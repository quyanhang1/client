<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@taglib prefix="dateTag" uri="/tags" %>--%>
<!doctype html>
<html>

<body>

<div class="container">

    <div class="nav-title">用户名：${username}  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 登录时间："/></div>
    <div class="nav-title">首页&gt;职业</div>
    <div class="nav-bar">
        <span class="">方向：</span>
        <a class="nav-bar-a a-selected" href="">全部</a>
        <a class="nav-bar-a" href="">前端开发</a>
        <a class="nav-bar-a" href="">后端开发</a>
        <a class="nav-bar-a" href="">移动开发</a>
        <a class="nav-bar-a" href="">整站开发</a>
        <a class="nav-bar-a" href="">运营维护</a>
    </div>




    <div class="caption">
        <h4>后端开发方向</h4>
    </div>

    <div class="row">
        <c:forEach items="${back}" var="back" begin="0" end="1">
            <div class="col-md-4 col-sm-6 col-xs-12 top-margin">

                <div class="warp-border">
                    <div class="clearfix">
                        <div class="icon-people"><img src="<%= request.getContextPath()%>/t11/imges/687.png"></div>
                        <div class="text">
                            <h4 class="">${back.promessage}</h4>
                            <p class="text-present">${back.protitle}</p>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding">门槛 <img src="<%= request.getContextPath()%>/t11/imges/xx.png"></div>
                        </div>
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding text-border-left">难易程度 <img src="<%= request.getContextPath()%>/t11/imges/xx.png"><img src="<%= request.getContextPath()%>/t11/imges/xx.png"></div>
                        </div>
                    </div>
                    <div class="warp-class2">
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding">${back.door}<span class="iconfont-color">1-3</span>年</div>
                        </div>
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding text-border-left">稀缺程度 <span class="iconfont-color">345</span>家公司需要</div>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <div class="leftWarp">
                            薪资待遇
                        </div>
                        <div class="rightWarp">
                            <div class="rightWarp-class">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                            <div class="rightWarp-class">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                            <div class="rightWarp-class border-bottom">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <b class="text-b">有286人正在学</b>
                    </div>
                    <div class="warp-class2">
                        <p class="text-p">提示:在你学习之前你应该已经掌握XXXXX、XXXXX、XX等语言基础</p>
                    </div>
                    <div class="flip-container">
                        <p class="flip-title">后端工程师</p>
                        <p class="flip-text">${back.message}</p>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>

    <div class="caption">
        <h4>前端开发方向</h4>
    </div>

    <div class="row">
        <c:forEach items="${font}" var="font" begin="0" end="1">
            <div class="col-md-4 col-sm-6 col-xs-12 top-margin">

                <div class="warp-border">
                    <div class="clearfix">
                        <div class="icon-people"><img src="<%= request.getContextPath()%>/t11/imges/687.png"></div>
                        <div class="text">
                            <h4 class="">${font.promessage}</h4>
                            <p class="text-present">${font.protitle}</p>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding">门槛 <img src="<%= request.getContextPath()%>/t11/imges/xx.png"></div>
                        </div>
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding text-border-left">难易程度 <img src="<%= request.getContextPath()%>/t11/imges/xx.png"><img src="<%= request.getContextPath()%>/t11/imges/xx.png"></div>
                        </div>
                    </div>
                    <div class="warp-class2">
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding">${font.door}<span class="iconfont-color">1-3</span>年</div>
                        </div>
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding text-border-left">稀缺程度 <span class="iconfont-color">345</span>家公司需要</div>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <div class="leftWarp">
                            薪资待遇
                        </div>
                        <div class="rightWarp">
                            <div class="rightWarp-class">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                            <div class="rightWarp-class">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                            <div class="rightWarp-class border-bottom">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <b class="text-b">有286人正在学</b>
                    </div>
                    <div class="warp-class2">
                        <p class="text-p">提示:在你学习之前你应该已经掌握XXXXX、XXXXX、XX等语言基础</p>
                    </div>
                    <div class="flip-container">
                        <p class="flip-title">wb工程师</p>
                        <p class="flip-text">${font.message}</p>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>

    <div class="caption">
        <h4>移动端开发方向</h4>
    </div>

    <div class="row">
        <c:forEach items="${mobile}" var="mobile" begin="0" end="1">
            <div class="col-md-4 col-sm-6 col-xs-12 top-margin">

                <div class="warp-border">
                    <div class="clearfix">
                        <div class="icon-people"><img src="<%= request.getContextPath()%>/t11/imges/687.png"></div>
                        <div class="text">
                            <h4 class="">${mobile.promessage}</h4>
                            <p class="text-present">${mobile.protitle}</p>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding">门槛 <img src="<%= request.getContextPath()%>/t11/imges/xx.png"></div>
                        </div>
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding text-border-left">难易程度 <img src="<%= request.getContextPath()%>/t11/imges/xx.png"><img src="<%= request.getContextPath()%>/t11/imges/xx.png"></div>
                        </div>
                    </div>
                    <div class="warp-class2">
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding">${mobile.door}<span class="iconfont-color">1-3</span>年</div>
                        </div>
                        <div class="warp-class2-text">
                            <div class="iconfont text-padding text-border-left">稀缺程度 <span class="iconfont-color">345</span>家公司需要</div>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <div class="leftWarp">
                            薪资待遇
                        </div>
                        <div class="rightWarp">
                            <div class="rightWarp-class">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                            <div class="rightWarp-class">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                            <div class="rightWarp-class border-bottom">
                                <div class="rightWarp-year">0-1年</div>
                                <div class="rightWarp-wages">5k-10k/月</div>
                            </div>
                        </div>
                    </div>

                    <div class="warp-class2">
                        <b class="text-b">有286人正在学</b>
                    </div>
                    <div class="warp-class2">
                        <p class="text-p">提示:在你学习之前你应该已经掌握XXXXX、XXXXX、XX等语言基础</p>
                    </div>
                    <div class="flip-container">
                        <p class="flip-title">移动端工程师</p>
                        <p class="flip-text">${mobile.message}</p>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>


</div>
</body>
</html>