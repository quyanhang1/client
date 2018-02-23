<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆页面</title>
</head>
<body>
<%--<div style= "width:200px;height:150px;margin:0 auto;border:1px solid;">--%>
    <%--<form:form action="/login" method="post">--%>
        <%--用户名：<form:input path="user"/><br/>--%>
        <%--密码： <form:input path="password"/><br/>--%>
        <%--<br/>--%>
        <%--<hr>--%>
        <%--<input type="submit" name="Submit" value="登录">--%>
        <%--<input type="reset" name="Submit2" value="重填">--%>
    <%--</form:form>--%>
<%--</div>--%>

<h1 style="text-align: center;">用户登陆</h1>
<%--水平居中--%>
<div style="width:100%;text-align:center">
    <form action="login" method="post">
        用户名: <input type="text" name="username"/><br/>
        密　码: <input type="password" name="password"/><br/>
        <input type="submit" value="登录" /> <br/>
        <a href="<%= request.getContextPath()%>/register">手机注册</a>
        <a href="<%= request.getContextPath()%>/register2">邮箱注册</a>
    </form>
</div>

</body>
</html>
