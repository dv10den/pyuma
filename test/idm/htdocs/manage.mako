<%!
def resource_set_choice(rs_list):
    """
    Creates a dropdown list of resource sets
    Each item in the list is a tuple of (resource set name, resource id)
    """
    element = "<select name=\"resource\">"
    for name, rsid in rs_list:
        element += "<option value=\"%s\">%s</option>" % (rsid, name)
    element += "</select>"
    return element
%>

<%!
def requestor_choice(rs_list):
    """
    Creates a dropdown list of requestors
    Each item in the list is a tuple of (name, entity_id)
    """
    element = "<select name=\"requestor\">"
    for name, entity_id in rs_list:
        if len(name) > 120:
            name = name[:120]
        element += "<option value=\"%s\">%s</option>" % (entity_id, name)
    element += "</select>"
    return element
%>

<html>
  <head>
    <title>UMA AS manage page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="static/style.css" rel="stylesheet" media="all">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/html5shiv.js"></script>
    <script src="../../assets/js/respond.min.js"></script>
    <style type="text/css">
      tbody tr:nth-child(odd){ background-color:#ccc; }
      select { width:100px; overflow:hidden; white-space:pre;
          text-overflow:ellipsis; -webkit-appearance: none; }
    </style>
    <![endif]-->
  </head>
  <body>

    <div class="container">
     <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <form action="${action}" method="${method}">
            <input type="hidden" name="user" value="${user}">
            <h3>Chose the resource set: </h3>
            ${resource_set_choice(rs_list)}
            <h3>Chose requestor</h3>
            <div id="something" style="width:500px">
            ${requestor_choice(req_list)}
            </div><hr>
            <br>
            <input type="submit" name="commit" value="display"/>
            <input type="submit" name="commit" value="modify"/>
            <input type="submit" name="commit" value="add"/>
            <input type="submit" name="commit" value="delete"/>
            a permission
        </form>
      </div>

    </div> <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/jquery.min.1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>

  </body>
</html>