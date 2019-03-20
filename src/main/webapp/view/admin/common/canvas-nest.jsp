<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/6/9
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script type="text/javascript" src="<%=basePath%>static/js/canvas-nest.min.js"></script>
