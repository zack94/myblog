<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--导入c标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--函数库--%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--EL表达式的日期格式化标签--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!doctype html>
<html>
<head>
    <title>任志洪的个人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%=basePath%>static/css/base.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/index.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/m.css" rel="stylesheet">
    <link href="<%=basePath%>static/images/bannerlogo.png" rel="shortcut icon">
    <script src="<%=basePath%>static/js/jquery.min.js"></script>
    <script src="<%=basePath%>static/js/jquery.easyfader.min.js"></script>
    <!--[if lt IE 9]>
    <script src="../static/js/modernizr.js"></script>
    <![endif]-->
    <script>
        window.onload = function () {
            var oH2 = document.getElementsByTagName("h2")[0];
            var oUl = document.getElementsByTagName("ul")[0];
            oH2.onclick = function () {
                var style = oUl.style;
                style.display = style.display == "block" ? "none" : "block";
                oH2.className = style.display == "block" ? "open" : ""
            }
        }
    </script>
    <style>
        #article_content {
            /*文字的左右间距*/
            padding-left: 25px;
            padding-right: 75px;
            /*文章部分显示，多余的部分用.....表示*/
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            -webkit-box-orient: vertical
        }
        #article_content a:hover{
            color: #e22845;
        }

    </style>
</head>
<body>

<%--添加导航条--%>
<jsp:include page="header.jsp"/>


<article>
    <div class="banner">
        <div id="sucaihuo" class="fader">
            <img class="slide" src="<%=basePath%>static/images/slider1.png">
            <img class="slide" src="<%=basePath%>static/images/slider2.png">
            <img class="slide" src="<%=basePath%>static/images/slider3.jpg">
            <img class="slide" src="<%=basePath%>static/images/slider4.jpg">
            <div class="fader_controls">
                <div class="page prev" data-target="prev">&lsaquo;</div>
                <div class="page next" data-target="next">&rsaquo;</div>
                <ul class="pager_list">
                </ul>
            </div>
        </div>
        <script>
            $(function () {
                $('#sucaihuo').easyFader();
            });
        </script>
    </div>

    <div class="newblogs">
        <h2 class="hometitle">最新文章</h2>
        <ul>
            <c:forEach items="${requestScope.articleList}" var="article">
                <li>
                    <h3 class="blogtitle"><span>
                        <a href="" title="css3" target="_blank" class="classname">${article.article_label }</a></span>
                        <a href="articleDetail.action?article_id=${article.article_id}" target="_blank">${article.article_title }</a></h3>

                    <div class="bloginfo">
                        <span class="blogpic">
                        <a href="articleDetail.action?article_id=${article.article_id}" target="_blank">
                            <c:choose>
                                <c:when test="${article.article_picture=='articleDefaultImage.jpg'}">
                                    <img src="<%=basePath%>static/images/articleDefaultImage.jpg"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="<%=basePath%>picture/${article.article_picture}"/>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        </span>

                        <div id="article_content">
                            <label><a href="articleDetail.action?article_id=${article.article_id}" target="_blank">${article.article_content}</a></label>
                        </div>
                    </div>
                    <div class="autor">
                        <span class="lm f_l"></span><span class="dtime f_l">
                        <fmt:formatDate value="${article.article_createtime}" pattern="yyyy/MM/dd  HH:mm:ss"/></span>
                        <span class="f_r"><a href="articleDetail.action?article_id=${article.article_id}" class="more">阅读原文>></a></span>
                    </div>
                    <div class="line"></div>
                </li>
            </c:forEach>
        </ul>

        <div class="row justify-content-center">
            <div>
                <nav>
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="<c:url value='page.action'/>?page=1">首页</a></li>
                        <li class="page-item"><a class="page-link" href="<c:url value='page.action'/>?page=${requestScope.page-1>1?requestScope.page-1:1}">&laquo;</a>
                        </li>

                        <c:forEach begin="1" end="${pagination.getTotalPage()}" varStatus="loop">
                            <c:set var="active" value="${loop.index==requestScope.page?'active':''}"/>
                            <li class="page-item ${active}">
                                <a class="page-link" href="<c:url value='page.action'/>?page=${loop.index}">${loop.index}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="<c:url value='page.action'/>?page=${requestScope.page+1<pagination.getTotalPage()?requestScope.page+1:pagination.getTotalPage()}">&raquo;</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="<c:url value='page.action'/>?page=${pagination.getTotalPage()}">尾页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

    </div>
    <div class="rbox">
        <%--评论留言板块--%>
        <div class="paihang">
            <h2 class="hometitle">行业脉搏</h2>
            <ul>
                <%--在jsp代码中嵌入java代码循环打印5遍--%>
                <% for (int i = 0; i < 5; i++) {%>
                <li>
                    这里是评论或者读者的留言信息这里是评论或者读者的留言信息
                    这里是评论
                    <div style="float: right">
                        <span>——评论者(来自:<a style="color: #00a0e9" href="" target="_blank">文章xxxxx</a>)</span>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
        <%--<jsp:include page="connect.jsp"/>--%>
        <%--云标签板块--%>
        <div class="paihang">
            <h2 class="hometitle">标签分类</h2>
            <div>
                <jsp:include page="tag.jsp"/>
            </div>

        </div>


        <div class="weixin">
            <h2 class="hometitle">联系我</h2>
            <jsp:include page="connectme.jsp"/>
        </div>

        <div class="links">
            <h2 class="hometitle">友情链接</h2>
            <ul>
                <li><a href="">优秀博文</a></li>
            </ul>
        </div>

    </div>

</article>
<footer>
    <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>" style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>
</body>
</html>
