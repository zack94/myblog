<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任志洪个人博客后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>static/images/icon/icon.png">
    <link rel="shortcut icon" href="<%=basePath%>static/images/bannerlogo.png">
    <script src="../js/jquery-2.1.4.min.js"></script>
    <!--[if gte IE 9]>
    <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="../js/html5shiv.min.js" type="text/javascript"></script>
    <script src="../js/respond.min.js" type="text/javascript"></script>
    <script src="../js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href='upgrade-browser.html';</script>
    <![endif]-->
</head>
<aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
    <ul class="nav nav-sidebar">
        <li><a href="<%=basePath%>view/admin/jsps/info_overview.jsp">报告</a></li>
        <li><a href="<%=basePath%>articleInfo.action">文章</a></li>
        <li><a href="<%=basePath%>view/admin/jsps/mind.jsp">心情</a></li>
        <li><a href="http://changyan.kuaizhan.com/overview" target="_blank">评论</a></li>
        <li><a href="<%=basePath%>view/admin/jsps/leave_messages.jsp">留言</a></li>
        <li><a href="<%=basePath%>view/admin/jsps/flink.jsp">友情链接</a></li>
    </ul>
    <ul class="nav nav-sidebar">
        <li><a href="#">栏目</a></li>
        <li><a class="dropdown-toggle" id="otherMenu" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false">其他</a>
        </li>
    </ul>
    <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
            <ul class="dropdown-menu" aria-labelledby="userMenu">
                <li><a href="manage_user.jsp">管理用户</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">管理登录日志</a></li>
            </ul>
        </li>
    </ul>
</aside>
