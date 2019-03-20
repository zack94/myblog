<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/27
  Time: 15:40
  To change this template use File | Settings | File Templates.
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
<body class="user-select">
<section class="container-fluid">
    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
                <h1 class="page-header">文章管理</h1>
                <a href="<%=basePath%>view/admin/jsps/add_article.jsp">
                        <button style="width: 120px;line-height: 38px;text-align: center;font-weight: bold;color: #000;border-radius: 5px;
                                margin:0 20px 20px 0;position: relative;overflow: hidden;">新增文章
                        </button>
                </a>

                <h1 class="page-header">管理</h1>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                            <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                            <th class="hidden-sm"><span class="glyphicon glyphicon-tag"></span> <span class="visible-lg">标签</span></th>
                            <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                            <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.articleList}" var="article">
                        <tr>
                                <td><input type="checkbox" class="input-control" name="checkbox[]" value=""/></td>
                                <td class="article-title">${article.article_title}</td>
                                <td class="hidden-sm">${article.article_label}</td>
                                <td><fmt:formatDate value="${article.article_createtime}" pattern="yyyy/MM/dd"/></td>
                                <td>
                                    <a href="">修改</a>
                                    <a rel="6">删除</a>
                                </td>
                        </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <footer class="message_footer" style="float: right;padding-right: 80px ">
                    <nav>
                        <div class="row justify-content-center">
                            <div>
                                <nav>
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="<c:url value='articleInfo.action'/>?page=1">首页</a></li>
                                        <li class="page-item"><a class="page-link" href="<c:url value='articleInfo.action'/>?page=${requestScope.page-1>1?requestScope.page-1:1}">&laquo;</a>
                                        </li>

                                        <c:forEach begin="1" end="${pagination.getTotalPage()}" varStatus="loop">
                                            <c:set var="active" value="${loop.index==requestScope.page?'active':''}"/>
                                            <li class="page-item ${active}">
                                                <a class="page-link" href="<c:url value='articleInfo.action'/>?page=${loop.index}">${loop.index}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value='articleInfo.action'/>?page=${requestScope.page+1<pagination.getTotalPage()?requestScope.page+1:pagination.getTotalPage()}">&raquo;</a>
                                        </li>
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value='articleInfo.action'/>?page=${pagination.getTotalPage()}">尾页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </nav>
                </footer>
        </div>
    </div>
</section>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/admin-scripts.js"></script>
<script>
    //是否确认删除
    $(function () {
        $("#main table tbody tr td a").click(function () {
            var name = $(this);
            var id = name.attr("rel"); //对应id
            if (event.srcElement.outerText == "删除") {
                if (window.confirm("此操作不可逆，是否确认？")) {
                    $.ajax({
                        type: "POST",
                        url: "/Article/delete",
                        data: "id=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                            window.location.reload();
                        }
                    });
                }
                ;
            }
            ;
        });
    });
</script>
</body>
</html>
