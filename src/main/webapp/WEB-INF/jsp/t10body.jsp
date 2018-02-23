<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <link href="<%= request.getContextPath()%>/t10/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/bootstrap-3.3.5-dist/css/bootstrap.css">
    <link href="<%= request.getContextPath()%>/t10/Untitled-3.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/t10/Untitled-1base.css" rel="stylesheet" type="text/css">
</head>
<body>


<div id="myCarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li class="active" data-slide-to="0" data-target="#myCarousel"></li>
        <li data-slide-to="1" data-target="#myCarousel"></li>
        <li data-slide-to="2" data-target="#myCarousel"></li>
        <li data-slide-to="3" data-target="#myCarousel"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img alt="First slide" src="<%= request.getContextPath()%>/t10/imges/547567.jpg">
        </div>
        <div class="item">
            <img alt="Second slide" src="<%= request.getContextPath()%>/t10/imges/547567.jpg">
        </div>
        <div class="item">
            <img alt="Third slide" src="<%= request.getContextPath()%>/t10/imges/547567.jpg">
        </div>
        <div class="item">
            <img alt="Third slide" src="<%= request.getContextPath()%>/t10/imges/547567.jpg">
        </div>
        <a data-slide="prev" href="#myCarousel" class="carousel-control left">
            <i class="icon-left"><img src="<%= request.getContextPath()%>/t10/imges/54354.png"></i>
        </a>
        <a data-slide="next" href="#myCarousel" class="carousel-control right">
            <i class="icon-right"><img src="<%= request.getContextPath()%>/t10/imges/4525424.png"></i>
        </a>
    </div>
</div>


<div class="main container">
    <!--第一部分开始-->
    <div class="main-a row">
        <c:forEach items="${heads}" var="head" begin="0" end="2">

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                <div class="row text-center">
                    <ul class="list-unstyled">
                        <li class="col-xs-12 up-1">
                            <img alt="" src=""${pageContext.request.contextPath}/t10/${head.image}">
                        </li>
                        <li class="up-2 col-xs-12">${head.title}</li>
                        <li class="up-3 col-xs-12">${head.message}</li>
                    </ul>
                </div>
            </div>
        </c:forEach>

        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 text-center">
            <p>
                <img src="<%= request.getContextPath()%>/t10/imges/453254312.png">${onStudy}<br>
                <span class="up-3">在学人数</span>
            </p>
            <p>
                <img src="<%= request.getContextPath()%>/t10/imges/453254312.png">${onWork}<br>
                <span class="up-3">学员已经找到满意工作</span>
            </p>
        </div>
    </div>

    <!--第二部分开始-->
    <%--<div class="main-b row">--%>
    <%--<h3 class="text-center main-tab">如何学习</h3>--%>
    <%--<ul class="list-unstyled text-center">--%>

            <%--<c:forEach items="studies" var="study" begin="0" end="3">--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">${study.id}11</span>--%>
                <%--<p class="up-2">${study.message}1</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--</c:forEach>--%>
    <%--</ul>--%>
    <%--</div>--%>


            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">2</span>--%>
                <%--<p class="up-2">了解职业前景薪金待遇，竞争压力等</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">3</span>--%>
                <%--<p class="up-2">掌握行业内顶级技能</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">4</span>--%>
                <%--<p class="up-2">查看职业目标任务</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">5</span>--%>
                <%--<p class="up-2">参考学习资料，掌握技能点，逐个完成任务</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">6</span>--%>
                <%--<p class="up-2">加入班级，和小伙伴们互帮互动，一块学习</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">7</span>--%>
                <%--<p class="up-2">选择导师，一路引导，加速自己成长</p>--%>
                <%--<span class="up-3"></span>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
                <%--<span class="up-1 text-center">8</span>--%>
                <%--<p class="up-2">完成职业 技能，升级业界大牛</p>--%>
                <%--<span class="up-3 invisible"></span>--%>
            <%--</li>--%>
        <%----%>

    <div class="main-b row">
        <h3 class="text-center main-tab">如何学习</h3>
        <ul class="list-unstyled text-center">
            <c:forEach var="study" items="${studies}" begin="0" end="7">
                <li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                    <span class="up-1 text-center">${study.id}</span>
                    <p class="up-2">${study.image}</p>
                    <span class="up-3"></span>
                </li>
            </c:forEach>
        </ul>

    </div>

    <!--第三部分开始-->
    <div class="main-c row">
        <h3 class="text-center main-tab">优秀学员展示</h3>
        <ul class="list-unstyled text-center">
            <c:forEach items="${students}" var="student" begin="0" end="3">
                <li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                    <div>
                        <img src="<%= request.getContextPath()%>/t10/${student.image}">
                        <span>${student.profession}:${student.name}</span>
                            <%--<p class="text-left">${studnet.introduce}</p>--%>
                        <p>${student.introduce}</p>
                    </div>
                </li>
            </c:forEach>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
            <%--<div>--%>
            <%--<img src="imges/242424.png">--%>
            <%--<span>技术顾问:罗大佑</span>--%>
            <%--<p class="text-left">百度技术总监：互联网基础服务领域，从事虚拟主机，云主机，域名。--%>
            <%--曾任新网高级技术经理，负责技术研发，团队管理与建设。</p>--%>
            <%--</div>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
            <%--<div>--%>
            <%--<img src="imges/242424.png">--%>
            <%--<span>技术顾问:罗大佑</span>--%>
            <%--<p class="text-left">百度技术总监：互联网基础服务领域，从事虚拟主机，云主机，域名。--%>
            <%--曾任新网高级技术经理，负责技术研发，团队管理与建设。</p>--%>
            <%--</div>--%>
            <%--</li>--%>
            <%--<li class="col-xs-12 col-sm-6 col-md-6 col-lg-3">--%>
            <%--<div>--%>
            <%--<img src="imges/242424.png">--%>
            <%--<span>技术顾问:罗大佑</span>--%>
            <%--<p class="text-left">百度技术总监：互联网基础服务领域，从事虚拟主机，云主机，域名。--%>
            <%--曾任新网高级技术经理，负责技术研发，团队管理与建设。</p>--%>
            <%--</div>--%>
            <%--</li>--%>
        </ul>
    </div>

    <!--第四部分开始-->
    <div class="row main-bottom">
        <h3 class="text-center">战略合作企业</h3>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <ul class="logo">
                <li>
                    <a href=""><img src="<%= request.getContextPath()%>/t10/imges/123132.png"></a>
                </li>
                <li>
                    <a href=""> <img src="<%= request.getContextPath()%>/t10/imges/1549865.png"></a>
                </li>
                <li>
                    <a href=""> <img src="<%= request.getContextPath()%>/t10/imges/785345.png"></a>
                </li>
                <li>
                    <a href=""> <img src="<%= request.getContextPath()%>/t10/imges/1471.png"></a>
                </li>
                <li>
                    <a href="">  <img src="<%= request.getContextPath()%>/t10/imges/7861.png"></a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="main-e">
    <h3 class="text-center main-tab ">友情链接</h3>
    <div class="container">
        <ul class="text-justify">
            <li><a href="#">手机软件</a></li>
            <li><a href="#">教师招聘</a></li>
            <li><a href="#">找工作</a></li>
            <li><a href="#">教师招聘</a></li>
            <li><a href="#">找工作</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">教师招聘</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">找工作</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">教师招聘</a></li>
            <li><a href="#">找工作</a></li>
            <li><a href="#">教师招聘</a></li>
            <li><a href="#">找工作</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">教师招聘</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">手机软件</a></li>
            <li><a href="#">找工作</a></li>
        </ul>
    </div>
</div>
</body>
</html>