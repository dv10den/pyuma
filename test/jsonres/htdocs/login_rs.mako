<html>
  <head>
    <title>${title}</title>
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
    </style>
    <![endif]-->
  </head>
  <body>

    <div class="container">
     <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h2>Please authenticate at ${host}</h2>
    <form action="${action}" method="post" class="login form">
        <input type="hidden" name="query" value="${query}"/>
        <input type="hidden" name="acr_values" value="${acr}"/>
        <table>
            <tr>
                <td>Username</td>
                <td><input type="text" name="login" value="${login}"/></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="password"
                value="${password}"/></td>
            </tr>
            <tr>
                </td>
                <td><input type="submit" name="form.commit"
                        value="Log In"/></td>
            </tr>
        </table>
    </form>
    % if logo_url:
        <img src="${logo_url}" alt="Client logo">
    % endif
    % if policy_url:
        <a href="${policy_url}"><b>Client policy</b></a>
    % endif
      </div>
    </div>
    <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/static/jquery.min.1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <%def name="add_js()">
        <script type="text/javascript">
            $(document).ready(function() {
                bookie.login.init();
            });
        </script>
    </%def>
  </body>
</html>
