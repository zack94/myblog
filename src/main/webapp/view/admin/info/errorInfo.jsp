<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>任志洪个人博客后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/font-awesome.min.css">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>static/images/icon/icon.png">
    <link rel="shortcut icon" href="<%=basePath%>static/images/bannerlogo.png">
    <script src="../js/jquery-2.1.4.min.js"></script>
    <!--[if gte IE 9]>
    <script src="<%=basePath%>view/admin/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>view/admin/js/html5shiv.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>view/admin/js/respond.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>view/admin/js/selectivizr-min.js" type="text/javascript"></script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script>window.location.href = 'upgrade-browser.html';</script>
    <![endif]-->
</head>
<body class="user-select">
<section class="container-fluid">
    <%--引入抬头banner--%>
    <jsp:include page="../jsps/banner.jsp"/>

    <%--引入左边导航条--%>
    <jsp:include page="../left_Navigation_bar.jsp"/>

    <%--信息总览面板--%>
    <%--<jsp:include page="info_overview.jsp"/>--%>

        <div class="row">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
                <h1 class="page-header">错误信息</h1>
                <div class="row placeholders">
                    <span class="text-muted">${requestScope.errorInfo}</span></div>
                </div>

            </div>
        </div>

</section>

<script src="<%=basePath%>view/admin/js/bootstrap.min.js"></script>
<script src="<%=basePath%>view/admin/js/admin-scripts.js"></script>
</body>
</html>
