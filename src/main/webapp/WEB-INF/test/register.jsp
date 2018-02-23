<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>

    <script type="text/javascript">
        function sendCode() {
            var data={
                tel:$("#tel").val()
            }

            $.ajax({
                    type: "post", //以post方式与后台沟通
                    url :"/task4-1/register/code", //与此页面沟通
                    dataType:"text",//返回的值以 JSON方式 解释
                    data: data, //发给的数据
                    success: function(suc){//如果调用成功
                        if (suc == "suc"){
                            alert("验证码发送成功")
                        }else if(suc=="time"){
                            alert("2分钟只发送一次验证码")
                        } else{
                            alert("验证码获取失败")
                        }
                    }
                }
            )
        }
    </script>

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
<h1 style="text-align: center;">手机注册页面</h1>
<%--水平居中--%>
<div style="width:100%;text-align:center">
    <form action="registerin" method="post">
        <div id="errorUsername" style="color:red;"></div>
        用户名: <input type="text" name="username" id="username"  placeholder="必须要填的哦"/><br/>

        密　码: <input type="password" name="password"/><br/>

        手  机：<input id="tel" name="tel" type="text">
        <input type='button' value="获取验证码" onclick="sendCode()"/><br/>
        验证码: <input type="text" name="code"/><br/>
        <input type="submit" value="提交注册" /> <br/>
    </form>


</div>

</body>
</html>
