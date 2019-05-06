<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:ITNews
 * Description:
 * Author:Zack
 * Date:2019/3/25
 * Time:19:56
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
</head>


<body class="user-select">
<section class="container-fluid">
    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <form action="" method="post">
                <h1 class="page-header">操作</h1>
                <ol class="breadcrumb">
                    <li><a href="<%=basePath%>view/admin/jsps/add_newITNews.jsp">增加IT风向</a></li>
                </ol>
                <h1 class="page-header">管理</h1>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span>
                            </th>
                            <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">主要内容</span>
                            </th>
                            <th><span class="glyphicon glyphicon-link"></span> <span class="visible-lg">原文链接</span></th>
                            <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                            <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.itNewsList}" var="itNews">
                            <tr>
                                <td><input type="checkbox" class="input-control" name="checkbox[]" value=""/></td>
                                <td class="article-title">${itNews.news_content}</td>
                                <td>${itNews.news_url}</td>
                                <td><fmt:formatDate value="${itNews.create_time}" pattern="yyyy/MM/dd"/></td>
                                <td>
                                    <a href="<%=basePath%>queryITNewsById.action?news_id=${itNews.news_id}">修改</a>
                                    <a href="<%=basePath%>deleteITNewsById.action?news_id=${itNews.news_id}">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <footer class="message_footer">
                    <nav>
                        <div class="row justify-content-center">
                            <div>
                                <nav>
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="<c:url value='queryITNewsPage.action'/>?page=1">首页</a></li>
                                        <li class="page-item"><a class="page-link" href="<c:url value='queryITNewsPage.action'/>?page=${requestScope.page-1>1?requestScope.page-1:1}">&laquo;</a>
                                        </li>

                                        <c:forEach begin="1" end="${pagination.getTotalPage()}" varStatus="loop">
                                            <c:set var="active" value="${loop.index==requestScope.page?'active':''}"/>
                                            <li class="page-item ${active}">
                                                <a class="page-link" href="<c:url value='queryITNewsPage.action'/>?page=${loop.index}">${loop.index}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value='queryITNewsPage.action'/>?page=${requestScope.page+1<pagination.getTotalPage()?requestScope.page+1:pagination.getTotalPage()}">&raquo;</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value='queryITNewsPage.action'/>?page=${pagination.getTotalPage()}">尾页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </nav>
                </footer>
            </form>
        </div>
    </div>
</section>
<script src="<%=basePath%>view/admin/js/bootstrap.min.js"></script>
<script src="<%=basePath%>view/admin/js/admin-scripts.js"></script>
<script>
    //是否确认删除
    $(function(){
        $("#main table tbody tr td a").click(function(){
            var name = $(this);
            var id = name.attr("rel"); //对应id
            if (event.srcElement.outerText == "删除")
            {
                if(window.confirm("此操作不可逆，是否确认？"))
                {
                    $.ajax({
                        type: "POST",
                        url: "/Flink/delete",
                        data: "id=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                            window.location.reload();
                        }
                    });
                };
            };
        });
    });
</script>
</body>
</html>
