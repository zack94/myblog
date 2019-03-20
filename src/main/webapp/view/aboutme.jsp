<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html>
<head>
    <title>任志洪的个人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%=basePath%>static/css/base.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/about.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/m.css" rel="stylesheet">
    <link href="<%=basePath%>static/images/bannerlogo.png" rel="shortcut icon">
    <!--[if lt IE 9]>
    <script src="../static/js/modernizr.js"></script>
    <![endif]-->
    <script>
        window.onload = function () {
            var oH2 = document.getElementsByTagName("h2")[0];
            var oUl = document.getElementsByTagName("ul")[0];
            oH2.onclick = function () {
                var style = oUl.style;
                style.display = style.display == "block" ? "none" : "block";
                oH2.className = style.display == "block" ? "open" : ""
            }
        }
    </script>
</head>
<body>
<%--引入header板块--%>
<jsp:include page="header.jsp"/>
<article>
    <h2 class="litle"><span>一根有思想的芦苇</span>About Me</h2>
    <div class="ab_box">
        <div class="leftbox">
            <div class="newsview">
                <div class="news_infos">
                    <%--<p style="color: #38485A;size: 16px;font-size: 14px;">--%>
                    <p>简介</p>
                        &nbsp;&nbsp;&nbsp;&nbsp;任志洪&nbsp;|&nbsp;Zack&nbsp;&nbsp;&nbsp;&nbsp;
                        现就读于四川理工学院计算机科学与技术专业，对IT充满热情，热爱编程，喜欢钻研新技术<br/>
                    <br/>
                    <p>技术掌握</p>
                        &nbsp;&nbsp;&nbsp;&nbsp;编码能力：熟悉mvc设计模式，主要专注于Javaweb服务器端的开发，有独立开发项目的经历，熟悉java EE&SE，对jvm有简单了解，
                    熟悉freemarker数据渲染模板，jQuery框架等；熟练运用spring、springmvc、mybatis
                    、hibernate、spring boot等开源框架，理解spring aop、Ioc的设计思想并能在项目中运用；熟练使用mysql并根据项目需要设计数据库，对数据库优化有简单了解；
                        具体开发中使用maven配合项目管理；能熟练使用Linux常用操作，配置主机、服务器(openjava、mysql、tomcat等)、部署项目等<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;其他技能：通过了CET-4；喜欢PS，感觉很牛逼，所以自学了phototshop，能处理一些要求不高的图片；
                    有算法学习比赛的经历，参加过算法竞赛取得了不错的成绩<br/>
                    <br/>
                    <p>博客</p>
                        &nbsp;&nbsp;&nbsp;&nbsp;写博客主要有两个原因，第一就是自己在开发学习中遇到过很多坑，也填了很多坑，每一次经历都是点经验，值得记录下来，
                    当作填坑记录和学习笔记了，只会写代码的程序员就只是程序员，要会总结自己遇到的问题及最后的解决办法，
                    边学习边积累才能有提高；另外一个原因就是把自己学习的东西拿出来，和大家一起讨论，共同学习共同进步<br/>
                    <br/>
                </div>
            </div>
            <div class="meandblog">
                <h2>我的作品</h2>
                <ul>
                    <li><a href="#" target="_blank">计算机设计大赛</a></li>
                    <li><a href="" target="_blank">项目二</a></li>
                    <li><a href="" target="_blank">项目三</a></li>
                    <li><a href="" target="_blank">项目四</a></li>
                </ul>
            </div>
        </div>
        <div class="rightbox">
            <div class="aboutme">
                <h2 class="hometitle">HANDSOME PICTURE</h2>
                <div class="avatar"><img src="<%=basePath%>static/images/head.jpeg"></div>
                <div style="padding: 20px 0px 20px 30px;">
                <jsp:include page="connect.jsp"/>
                </div>
                <div class="ab_con" style="margin-top: 20px;">
                    <p>Name:&nbsp;任志洪 | Zack</p>
                    <p>Ideal working city:&nbsp;上海&成都</p>
                    <p>Date of birth:&nbsp;October 16, 1994</p>
                    <p>Native place:&nbsp;四川绵阳</p>
                    <p>Hobby:&nbsp;听音乐、看电影、跑步、游泳、打羽毛球、钓鱼、吃美食、养宠物...</p>
                    <p>Email:&nbsp;zackrzh.life@gmail.com<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zackrzh.life@outlook.com</p>
                    <%--<p>susezack@gmail.com</p>--%>

                </div>
            </div>
            <%--<div class="weixin">--%>
                <%--<h2 class="hometitle">Contact Me</h2>--%>
                <%--<ul>--%>
                    <%--<img src="" alt="联系方式">--%>
                <%--</ul>--%>
            <%--</div>--%>

        </div>

    </div>
</article>
<footer>
    <%--<p>Design by <a href="">任志洪</a>  蜀ICP备11002373号-1</p>--%>
    <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>" style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>
</body>
</html>
