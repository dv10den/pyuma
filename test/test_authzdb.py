from bson.errors import InvalidId
from uma.authzdb import AuthzDB
from uma.authzsrv import safe_name
from uma.message import AuthzDescription
from uma.resource_set import UnknownObject

__author__ = 'rolandh'

DB_NAME = "rohe0002@umu_se"
COLLECTION = "sso"


def _eq(l1, l2):
    return set(l1) == set(l2)


ATTR = "http://fim.example.com/uma/attr"


def test_1():
    authz_db = AuthzDB(AuthzDescription, DB_NAME, COLLECTION)
    authz_db.restart(COLLECTION)

    rsd = AuthzDescription(
        resource_set_id="https://idp.catalogix.se/id/rohe0002@umu.se",
        entity="https://lingon.ladok.umu.se:8087/sp.xml",
        scopes=[
            "%s/givenName/Roland" % ATTR,
            "%s/surName/Hedberg" % ATTR,
            "%s/displayName/Roland%%20Hedberg" % ATTR,
            "%s/cn/Roland%%20Hedberg" % ATTR,
            "%s/eduPersonScopedAffiliation/member@umu.se" % ATTR,
            "%s/eduPersonScopedAffiliation/employee@umu.se" % ATTR,
            "%s/eduPersonScopedAffiliation/staff@umu.se" % ATTR
        ],
    )

    rid = authz_db.store(rsd.to_json())

    item = authz_db.read(rid)

    assert item
    assert isinstance(item, AuthzDescription)
    for key, val in rsd.items():
        assert key in item
        assert item[key] == val

    try:
        authz_db.read("phoney")
        assert False
    except UnknownObject:
        pass
    except InvalidId:
        pass

    res = authz_db.match(
        resource_set_id="https://idp.catalogix.se/id/rohe0002@umu.se",
        entity="https://lingon.ladok.umu.se:8087/sp.xml")

    assert res

    res = authz_db.match(
        resource_set_id="https://idp.catalogix.se/id/rohe0002@umu.se",
        entity="https://lingon.ladok.umu.se:8087/sp.xml",
        scopes=["%s/givenName/Roland" % ATTR])

    assert res

    res = authz_db.match(
        resource_set_id="https://idp.catalogix.se/id/rohe0002@umu.se",
        entity="https://lingon.ladok.umu.se:8087/sp.xml",
        scopes=["%s/sn/Magnusson" % ATTR])

    assert res is False

    res = authz_db.match(
        resource_set_id="https://idp.catalogix.se/id/rohe0002@umu.se",
        entity="https://lingon.catalogix.se:8087/sp.xml")

    assert res is False


def test_2():
    owner = DB_NAME
    client_id = "http://xenosmilus2.umdc.umu.se:8089/foo"
    collection = safe_name("%s:%s" % (owner, client_id))
    authz_db = AuthzDB(AuthzDescription, "uma_idm", collection)
    authz_db.restart(collection)


if __name__ == "__main__":
    test_2()