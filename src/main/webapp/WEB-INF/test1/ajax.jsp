<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        var data={
            tel:$("#tel").val()
        }
        function sendV() {
            $.ajax({
                    type: "post", //以post方式与后台沟通
                    url :"/task4-1/register/verify", //与此页面沟通
                    dataType:JSON,//返回的值以 JSON方式 解释
                    data: data, //发给的数据
                    success: function() {//如果调用成功
                        alert("验证码获取")
                    }
                }
            )
        }

             $(document).ready(function() {
                     //给账号文本框绑定失去焦点的事件
                    $("#account").blur(function(){
                             //alert("测试"+$(this).val());
                             $.ajax({
                                     url:"/task4-1/register/checkAccount",//设置服务器地址，即为servlet配置的url-pattern
                                     type:"post",//提交的方式
                                     data:{account:$(this).val()},//提交到服务器的数据，多个值以逗号分割开{account:$(this).val(),...}
                                     success:function(data){//回调函数，data是返回的数据
                                        $("#errorAccount").html(data);
                                     }
                              });
                         });
                 });

//

        function test1() {
            $.ajax({
//                asynch:false,
                    type: "post", //以post方式与后台沟通
                    url :"/task4-1/aaaa", //与此页面沟通
                    dataType:'json',//返回的值以 JSON方式 解释
//                    data: data, //发给的数据
                    success: function(json) {//如果调用成功
                        if (json.i<1){
                            alert("返回的是a")
                        }else {
                            alert("返回的是b")
                        }
                    }
                }
            )
        }

function test2() {
    $.ajax({
//            asynch:false,
            type: "get", //以post方式与后台沟通
            url :"/task4-1/12345", //与此页面沟通
            dataType:"json",//返回的值以 JSON方式 解释
//                    data: data, //发给的数据
            success: function(res) {//如果调用成功,res是接收controller中return的数据
                var a=res.a;  //将res中key=a的数据定义成一个变量a，
                console.log(res)//在控制台输出
                console.log(a)
                if(a=="b"){  //判断语句，
                    alert("成功")
                    $("#qq").html(res.aa)  //qq是jsp页面中要显示内容的id，res.aa是显示的内容
                }else {
                    alert("失败")
                }
            }
        }
    )
}
    </script>

</head>
<body>

<input type="text" name="account" id="account" />
 <div id="errorAccount" style="color:red;display:inline;"></div>
<input type="button" onclick="t1()" value="跳弹框"/><br>
<input type="button" onclick="test1()" value="跳弹框2"/><br>
<input type="button" onclick="test2()" value="测试"/><br>



这是a的值：<span id="qq"/>
<hr>
<form action="<%=request.getContextPath()%>/uploadtest" method="post" enctype="multipart/form-data">
    请选择上传文件：<input type="file" name="file" /><br/>
    <input type="submit" value="上传" />
</form>
<img class="aligncenter smaller-image" src="http://quyanhang1.oss-cn-beijing.aliyuncs.com/24137d590bed4402b700f8a3fedae4eb.png?Expires=1518009116&OSSAccessKeyId=TMP.AQHH3Xx7J_kyTs8lFjrexUbTPOxuFiRwkpVFMHyuZkd1-edJv1J9uMsTswRKMC4CFQCebPGHQNvyUIJ0VcJZnvIC7tFCIgIVAN1iIdn17HxyRbNjw696v5BA6XdY&Signature=trO8WxoXFBlCZLeF2XfSEf1LWNQ%3D"  alt="这是头像">
</body>
</html>