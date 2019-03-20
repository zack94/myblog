<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<%--引入包含css，js的文件--%>
<jsp:include page="head.jsp"/>

<body class="user-select">
<section class="container-fluid">
    <%--引入抬头banner--%>
    <jsp:include page="banner.jsp"/>

    <%--引入左边导航条--%>
    <jsp:include page="left_Navigation_bar.jsp"/>

    <%--信息总览面板--%>
    <jsp:include page="info_overview.jsp"/>

</section>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/admin-scripts.js"></script>
</body>
</html>
