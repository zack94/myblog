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
                <form action="<%=basePath%>addFriendLink.action" method="post" class="add-flink-form" autocomplete="off" draggable="false">
                    <div class="col-md-9">
                        <h1 class="page-header">增加友情链接</h1>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>链接文字</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" id="flink-name" name="link_words" class="form-control"
                                       placeholder="在此处输入名称" required autofocus autocomplete="off">
                                <span class="prompt-text">例如：任志洪个人博客的xxx博文</span></div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>链接地址</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" id="flink-url" name="link_url" class="form-control"
                                       placeholder="在此处输入URL地址" required autocomplete="off">
                                <span class="prompt-text">例子：<code>http://www.zackrzh.com/</code>——不要忘了<code>http://</code></span>
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>链接方式</span></h2>
                            <div class="add-article-box-content">
                                <%--<input type="text" id="flink-imgurl" name="imgurl" class="form-control" placeholder="在此处输入图像地址" required autocomplete="off">--%>
                                <%--<span class="prompt-text">图像地址是可选的，可以为网站LOGO地址等</span> </div>--%>
                                <p>
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;状态：</label>
                                    <span class="article-status-display"></span></p>
                                <p><label>&nbsp;&nbsp;&nbsp;target：</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="link_way" value="_blank" checked/>_blank&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="link_way" value="_self"/>_self&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="link_way" value="_top"/>_top
                                </p>
                                <p>
                                    <%--<label>rel：</label>--%>
                                    <%--<input type="radio" name="rel" value="0" checked/>--%>
                                    <%--nofollow&nbsp;&nbsp;<input type="radio" name="rel" value="1"/>none</p>--%>
                                        <span></span>
                                <p>
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;增加于:&nbsp;&nbsp;<span id="timeShow" class="time1"></span></label>
                                    <span class="article-time-display">
                                </span>
                                </p>
                            </div>
                            <div class="add-article-box-footer">
                                <button class="btn btn-primary" type="submit" name="submit">增加</button>
                            </div>
                        </div>
                        <%--<div class="add-article-box">--%>
                        <%--<h2 class="add-article-box-title"><span>描述</span></h2>--%>
                        <%--<div class="add-article-box-content">--%>
                        <%--<textarea class="form-control" name="describe" autocomplete="off"></textarea>--%>
                        <%--<span class="prompt-text">描述是可选的手工创建的内容总结</span> </div>--%>
                        <%--</div>--%>
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
                                    <%--<input type="radio" name="target" value="0" checked/>--%>
                                    <%--_blank&nbsp;&nbsp;<input type="radio" name="target" value="1"/>--%>
                                    <%--_self&nbsp;&nbsp;<input type="radio" name="target" value="2"/>--%>
                                    <%--_top</p>--%>
                                <p>
                                <%--<label>rel：--%>
                                <%--</label>--%>
                                    <%--<input type="radio" name="rel" value="0" checked/>--%>
                                    <%--nofollow&nbsp;&nbsp;<input type="radio" name="rel" value="1"/>none</p>--%>
                                <p>
                                    <%--<label>增加于：</label>--%>
                                    <span class="article-time-display">
                  <%--<input style="border: none;" type="datetime" name="time" value="2016-01-09 17:29:37"/>--%>

                  </span></p>
                            </div>
                            <div class="add-article-box-footer">
                                <%--<button class="btn btn-primary" type="submit" name="submit">增加</button>--%>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="<%=basePath%>view/admin/js/bootstrap.min.js"></script>
<script src="<%=basePath%>view/admin/js/admin-scripts.js"></script>

</body>
</html>
