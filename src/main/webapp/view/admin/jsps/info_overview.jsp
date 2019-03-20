<%@ page import="cn.suse.zack.pojo.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:52
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
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>static/images/icon/icon.png">
    <link rel="shortcut icon" href="<%=basePath%>static/images/bannerlogo.png">
    <script src="<%=basePath%>view/admin/js/localInfo.js" type="text/javascript"></script>

</head>
<jsp:include page="banner.jsp"/>
<jsp:include page="left_Navigation_bar.jsp"/>
<div class="row">
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
        <h1 class="page-header">信息总览</h1>
        <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
                <h4>发布文章</h4>
                <span class="text-muted">0 条</span> </div>

            <div class="col-xs-6 col-sm-3 placeholder">
                <h4>友情链接</h4>
                <span class="text-muted">0 条</span> </div>

        </div>
        <h1 class="page-header">状态</h1>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <tbody>
                <tr>
                    <%Admin admin = (Admin) session.getAttribute("admin");%>
                    <td>欢迎您管理员: <span><%=admin.getAdmin_name()%></span>
                </tr>
                </tbody>
            </table>
        </div>
        <h1 class="page-header">系统信息</h1>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr> </tr>
                </thead>
                <tbody id="info1">
                </tbody>
            </table>
        </div>
        <footer>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <tbody>
                    <tr>
                        <td><span style="display:inline-block; width:8em">版权所有</span> POWERED BY Zack
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </footer>
    </div>
</div>
