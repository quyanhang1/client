<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
=================================
这是a的值----${a}<br>
<%--<json:object name="a">--%>

<%--</json:object>--%>

这是图片1<img src="<%= request.getContextPath()%>/WEB-INF/2.jpg"><br>
这是图片2<img src="<%= request.getContextPath()%>/t10/2.jpg">
这是图片3<img src="<%= request.getContextPath()%>/t10/2.jpg">
</body>
</html>
