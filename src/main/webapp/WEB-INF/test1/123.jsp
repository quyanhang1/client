<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
=================================
这是a的值----${a}<br>

这是图片2<img src="/task4-1/t10/imges/2.jpg"><br>
这是图片2<img src="<%= request.getContextPath()%>/t10/imges/2.jpg"><br>
<%= request.getContextPath()%>

</body>
</html>
