<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<body>
<header>
    <div class="top container">
        <p class="hidden-xs">客服热线：010-594-78634</p>
        <img src="<%= request.getContextPath()%>/t11/imges/12321.gif">
    </div>

    <div role="navigation" class="nav1 navbar navbar-default">
        <div class="container">
            <div class="header-logo">
                <div class="logo-middle"><img src="<%= request.getContextPath()%>/t11/imges/logo.png"></div>
            </div>
            <div class="navbar-header marginTop">
                <button data-target="#example-navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div id="example-navbar-collapse" class=" collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <a href="http://localhost:8080/task4-1/t10"><li>首 页</li></a>
                    <a href="http://localhost:8080/task4-1/login"><li>职 业</li></a>
                    <a href=""><li>推 荐</li></a>
                    <a href="http://localhost:8080/task4-1/u/loginok"><li>上传头像</li></a>
                </ul>
            </div>
        </div>

    </div>

</header>

</body>
</html>
