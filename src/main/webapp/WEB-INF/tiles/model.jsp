<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="title" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/18
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title:getAsString name="title"></title:getAsString>
</head>
<body>

<tiles:insertAttribute name="head"/>
<tiles:insertAttribute name="menu"/>
<tiles:insertAttribute name="menu2"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="foot"/>

</body>
</html>
