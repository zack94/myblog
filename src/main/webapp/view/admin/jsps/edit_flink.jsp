<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:add_flink.jsp
 * Description:
 * Author:Zack
 * Date:2019/3/19
 * Time:17:52
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
</head>

<body class="user-select">
<section class="container-fluid">
    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <div class="row">
                <form action="<%=basePath%>updateFriendLink.action" method="post" class="add-flink-form" autocomplete="off" draggable="false">
                    <div class="col-md-9">
                        <h1 class="page-header">修改友情链接</h1>
                        <input type="hidden" name="link_id" value="${requestScope.friendLink.link_id}">
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>链接文字</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" id="flink-name" name="link_words" value="${requestScope.friendLink.link_words}" class="form-control"
                                       placeholder="在此处输入名称" required autofocus autocomplete="off">
                                <span class="prompt-text">例如：任志洪个人博客的xxx博文</span></div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>链接地址</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" id="flink-url" name="link_url" value="${requestScope.friendLink.link_url}" class="form-control"
                                       placeholder="在此处输入URL地址" required autocomplete="off">
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
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="link_way" value="_blank" ${requestScope.friendLink.link_way=='_blank' ? 'checked':''}/>_blank&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="link_way" value="_self" ${requestScope.friendLink.link_way=='_self' ? 'checked':''}/>_self&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="link_way" value="_top" ${requestScope.friendLink.link_way=='_top' ? 'checked':''}/>_top
                                </p>
                                <p>

                                    <span></span>
                                <p>
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;修改时间:&nbsp;&nbsp;<span id="timeShow" class="time1"></span></label>
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
                                    <span class="article-time-display">
                                    </span></p>
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
