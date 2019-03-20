<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/10
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
    <title>任志洪的个人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%=basePath%>static/css/base.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/index.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/m.css" rel="stylesheet">
    <link href="<%=basePath%>static/images/bannerlogo.png" rel="shortcut icon">
    <script src="<%=basePath%>static/js/jquery.min.js"></script>
    <script src="<%=basePath%>static/js/jquery.easyfader.min.js"></script>
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

    <%--文章缩略显示样式--%>
    <style>
        #article_content {
            /*文字的左右间距*/
            padding-left: 25px;
            padding-right: 75px;
            /*文章部分显示，多余的部分用.....表示*/
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical
        }
    </style>


</head>
<body>
<header>
    <div id="mnav">
        <h2><span class="navicon"></span></h2>
        <a href="<%=basePath%>initHomepage.action">
            <img src="<%=basePath%>static/images/logo3.png" alt="这里本来该有图片的" style="vertical-align: middle;">
        </a>
        <ul>
            <li><a href="<%=basePath%>initHomepage.action">BLOG首页</a></li>
            <%--<li><a href="<%=basePath%>view/articles.jsp">学无止境</a></li>--%>
            <li><a href="<%=basePath%>InitMindPage.action">心情琐事</a></li>
            <li><a href="<%=basePath%>view/aboutme.jsp">关于我</a></li>
            <li><a href="<%=basePath%>userLoginHomepage.action">登录</a></li>
            <li><a href="<%=basePath%>view/messages.jsp">给我留言</a></li>
        </ul>
    </div>

    <nav>
        <a href="<%=basePath%>initHomepage.action">
            <img src="<%=basePath%>static/images/logo3.png" alt="这里本来该有图片的" style="vertical-align: middle;">
        </a>
        <ul>
            <li><a href="<%=basePath%>initHomepage.action">BLOG首页</a></li>
            <%--<li><a href="<%=basePath%>view/articles.jsp">学无止境</a></li>--%>
            <li><a href="<%=basePath%>InitMindPage.action">心情琐事</a></li>
            <li><a href="<%=basePath%>view/aboutme.jsp">关于我</a></li>
            <li><a href="<%=basePath%>userLoginHomepage.action">登录</a></li>
            <li><a href="<%=basePath%>view/messages.jsp">给我留言</a></li>
        </ul>
    </nav>
</header>
</body>