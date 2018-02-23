<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title><tiles:getAsString name="title"/></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" charset="UTF-8">
    <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/t11/t11.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/t11/base.css" rel="stylesheet" type="text/css">


</head>

<body>

<tiles:insertAttribute name="header"/>

<tiles:insertAttribute name="body"/>

<tiles:insertAttribute name="footer"/>
</body>
<script src="<%= request.getContextPath()%>/t10/jquery.min.js"></script>
<script  src="<%= request.getContextPath()%>/t10/bootstrap.min.js"></script>
</html>

