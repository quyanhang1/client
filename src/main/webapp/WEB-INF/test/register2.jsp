<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/6
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        $(document).ready(function() {
            //给账号文本框绑定失去焦点的事件
            $("#username").blur(function(){
                //alert("测试"+$(this).val());
                $.ajax({
                    url:"/task4-1/register/checkName",//设置服务器地址，即为servlet配置的url-pattern
                    type:"post",//提交的方式
                    data:{username:$(this).val()},//提交到服务器的数据，多个值以逗号分割开{account:$(this).val(),...}
                    success:function(data){//回调函数，data是返回的数据
                        $("#errorUsername").html(data);
                    }
                });
            });
        });


    </script>
</head>
<body>
<h1 align="center">邮箱注册页面</h1>
<div style="width:100%;text-align:center">
    <form action="register_email" method="post">
        <div id="errorUsername" style="color:red;"></div>
        用户名: <input type="text" name="username" id="username"  placeholder="必须要填的哦"/><br/>

        密　码: <input type="password" name="password"/><br/>

        邮 箱：<input id="email" name="email" type="text">

        <input type="submit" value="提交注册" /> <br/>
    </form>

</div>
</body>
</html>
