<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任志洪个人博客后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/font-awesome.min.css">
    <link rel="shortcut icon" href="<%=basePath%>static/images/bannerlogo.png">
    <script src="<%=basePath%>view/admin/js/jquery-2.1.4.min.js"></script>
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
