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
    <h2 class="litle"><span>实现目标的道路也许漫长，无论如何，我将砥砺前行！</span>About Me</h2>
    <div class="ab_box">
        <div class="leftbox">
            <div class="newsview">
                <div class="news_infos">
                    <p style="font-size: 16px;color: #1F7D6A">简介</p>
                        &nbsp;&nbsp;&nbsp;&nbsp;任志洪&nbsp;|&nbsp;Zack&nbsp;&nbsp;&nbsp;&nbsp;
                        四川轻化工大学&nbsp;||&nbsp;计算机科学与技术&nbsp;&nbsp;对IT充满热情，热爱编程，爱钻研新技术，喜欢黑科技<br/>
                    <br/>
                    <p style="font-size: 16px;color: #1F7D6A">技术掌握</p>
                        &nbsp;&nbsp;&nbsp;&nbsp;编码能力：熟悉mvc设计模式，主要专注于Javaweb服务器端的开发，有独立开发项目的经历，熟悉java EE&SE，对jvm有一定了解，
                    熟悉freemarker数据渲染模板，jQuery框架等；熟练运用Spring、SpringMVC、Mybatis
                    、spring boot等开源框架，理解Spring AOP、IOC的设计思想并能在项目中运用；熟练使用MySQL并根据项目需要设计数据库，对数据库优化有一定了解；
                        具体开发中使用maven配合项目管理；能熟练使用Linux常用操作，配置主机、服务器(openjava、MySQL、tomcat等)、部署项目等。<br/>
                        &nbsp;&nbsp;&nbsp;&nbsp;其他技能：通过了CET-4；喜欢PS，感觉很厉害，所以自学了phototshop，能处理一些常规图片；
                    有算法学习比赛的经历，参加过算法竞赛也取得了不错的成绩。<br/>
                    <br/>
                    <p style="font-size: 16px;color: #1F7D6A">博客</p>
                        &nbsp;&nbsp;&nbsp;&nbsp;写博客主要有两个原因，第一就是自己在专研学习中遇到过很多坑，也填了很多坑，每一次经历都是积累经验，值得记录下来，
                    当作填坑记录和学习笔记，会写代码的程序员就只是程序员，要会总结自己遇到的问题及最后的解决办法，
                    边学习边积累才能有提高；另外一个原因就是把自己学习的东西拿出来，和大家一起学习研讨，共享经验教训共同进步。<br/>
                    <br/>
                    <p style="font-size: 16px;color: #1F7D6A">工作</p>
                    &nbsp;&nbsp;&nbsp;&nbsp;目前就职于<a href="https://www.asiainfo.com/zh_cn/index.html" target="_blank">亚信科技</a>，现在主要任务包括参与开发和中国移动合作的CRM系统。我所在的项目组(CMC项目组)负责产商品中心。
                        前端主要使用到的是公司自主研发的WADE5框架，它将目前优秀高效的框架进行再封装，在此基础上提供给开发人员可快速开发实现的接口和良好的用户体验界面。
                        后台主要使用的是公司的AppFrame框架，业务逻辑使用csf对调用接口再封装，并通过数据库注册管理的方式进行，使得各个模块间耦合度降低并提高了数据访问的安全性，
                        此外还参与到项目从前端到后台的设计实现和模型优化、提供解决方案、规范接口、测试、项目上线等。
                        <br/>
                    <br/>
                </div>
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;zackrzh.work@gmail.com</p>
                </div>
            </div>
        </div>

    </div>
</article>
<footer>
    <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>" style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>
</body>
</html>
