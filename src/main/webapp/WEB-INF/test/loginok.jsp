<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/7
  Time: 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.8.2.js"></script>
    <style type="text/css">
        .smaller-image {
            width: 200px;
            height: 200px;
        }
        .thick-green-border {
            border-width:2px;
            border-style:solid;
            border-color:green;
        }
        .possion{
            margin-left: 33.333%
        }
        .aligncenter {
            clear: both;
            display: block;
            margin:auto;
        }

    </style>
</head>
<body>
<div style="width:100%;text-align:center" id="div1">
<form action="<%=request.getContextPath()%>/uploadtest" method="post" enctype="multipart/form-data">
    请选择上传头像：<input type="file" name="file" />
    <input type="submit" value="上传" />
</form>
    <div class="smaller-image thick-green-border possion">
        <img class="aligncenter smaller-image" src="${image}"  alt="这是头像">
    </div>


</div>
</body>
</html>
