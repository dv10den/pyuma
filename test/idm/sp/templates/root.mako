<% self.seen_css = set() %>
<%def name="css_link(path, media='')" filter="trim">
    % if path not in self.seen_css:
        <link rel="stylesheet" type="text/css" href="${path|h}" media="${media}">
    % endif
    <% self.seen_css.add(path) %>
</%def>
<%def name="css()" filter="trim">
    ${css_link('/css/main.css', 'screen')}
</%def>
    ##<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN "
##"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head><title>SP test</title>
    ${self.css()}
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
${next.body()}
${post()}
</body>
</html>
