<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="head.jsp"/>
<header>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=basePath%>view/admin/jsps/index.jsp">ZACK||任志洪</a>
            </div>


            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="">消息 <span class="badge">1</span></a></li>

                    <li><a href="login.action" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
                </ul>

                <form action="" method="post" class="navbar-form navbar-right" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
                        <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span></div>
                </form>
            </div>
        </div>
    </nav>
</header>