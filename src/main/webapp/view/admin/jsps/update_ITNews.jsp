<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:add_newITNews
 * Description:
 * Author:Zack
 * Date:2019/3/26
 * Time:10:56
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--函数库--%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<html>

<jsp:include page="head.jsp"/>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<%=basePath%>view/admin/js/getTime.js"></script>
    <script src="<%=basePath%>view/admin/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>view/admin/js/admin-scripts.js"></script>

    <script src="<%=basePath%>static/login/keypad/js/jquery.js"></script>
    <script src="<%=basePath%>view/admin/jsps/js/add_newITNews.js"></script>
</head>

<body class="user-select">
<section class="container-fluid">
    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <div class="row">
                <form action="<%=basePath%>updateITNews.action" method="post" class="add-flink-form" autocomplete="off" draggable="false">
                    <div class="col-md-9">
                        <h1 class="page-header">更新IT新风向</h1>
                        <input type="hidden" name="news_id" value="${requestScope.ITNews.news_id}">
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>主要内容</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" id="news_content" name="news_content" class="form-control"
                                       value="${requestScope.ITNews.news_content}" required autofocus autocomplete="off">
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>原文地址</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" id="news_url" name="news_url" class="form-control"
                                       value="${requestScope.ITNews.news_url}" required autocomplete="off">
                                <span class="prompt-text">例子：<code>http://www.zackrzh.com/</code>——不要忘了<code>http://</code></span>
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>链接方式</span></h2>
                            <div class="add-article-box-content">
                                <p>
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;状态：</label>
                                    <span class="article-status-display"></span></p>
                                <p><label>&nbsp;&nbsp;&nbsp;target：</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="news_way" value="_blank" ${requestScope.ITNews.news_way=='_blank' ? 'checked':''}/>_blank&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="news_way" value="_self" ${requestScope.ITNews.news_way=='_blank' ? 'checked':''}/>_self&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="news_way" value="_top" ${requestScope.ITNews.news_way=='_blank' ? 'checked':''}/>_top
                                </p>
                                <p>

                                    <span></span>
                                <p>
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;修改于:&nbsp;&nbsp;<span id="timeShow" class="time1"></span></label>
                                    <span class="article-time-display">
                                </span>
                                </p>
                            </div>
                            <div class="add-article-box-footer">
                                <button class="btn btn-primary" type="submit" name="submit">确认修改</button>
                            </div>
                        </div>
                    </div>
                    <div class="add-article-box">
                        <h1 class="page-header"></h1>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span></span></h2>
                            <div class="add-article-box-content">
                                <p>
                                    <label></label>
                                    <span class="article-status-display"></span></p>
                                <p><label></label>
                                <p>
                                <p>
                                    <span class="article-time-display"></span></p>
                            </div>
                            <div class="add-article-box-footer">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


</body>
</html>
