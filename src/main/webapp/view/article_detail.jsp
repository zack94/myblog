<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/6/6
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--导入c标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--导入format标签--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>任志洪的个人博客</title>
    <link href="<%=basePath%>static/images/bannerlogo.png" rel="shortcut icon">

    <!-- Mobile Specific Metas
	================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
	================================================== -->
    <link rel="stylesheet" href="<%=basePath%>static/css/zerogrid.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/style.css">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>static/css/font-awesome.min.css" rel="stylesheet" type="text/css">


    <link rel="stylesheet" href="<%=basePath%>static/css/menu.css">
    <script src="<%=basePath%>static/js/jquery1111.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>static/js/script.js"></script>

    <!-- Owl Carousel Assets -->
    <link href="<%=basePath%>static/css/owl.carousel.css" rel="stylesheet">


    <!--PC版-->
    <script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js"></script>
    <script type="text/javascript">
        window.changyan.api.config({
            appid: 'cytHPrhn6',
            conf: 'prod_fa7163096eae74a6b5f63eda7683f58f'
        });
    </script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="wrap-body">

    <section id="container">
        <div class="wrap-container">
            <!-----------------Content-Box-------------------->
            <article class="post zerogrid">
                <div class="row wrap-post"><!--Start Box-->
                    <div class="entry-header">
                        <span class="time">
                        <fmt:formatDate value="${requestScope.article.article_createtime}" pattern="MM/dd， yyyy"/>
                        </span>
                        <h2 class="entry-title"><a href="#">${requestScope.article.article_title}</a></h2>
                        <span class="cat-links"><a href="#">${requestScope.article.article_label}</a></span>
                    </div>

                    <div class="entry-content">
                        <div class="excerpt">
                            ${requestScope.article.article_content}
                        </div>
                    </div>
                </div>
            </article>
        </div>
        <!--畅言留言板块，PC和WAP自适应版-->
        <div id="SOHUCS" sid="${requestScope.article.article_id}"></div>
    </section>


    <footer>
        <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>"
                           style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
    </footer>

</div>
</body>

</html>
