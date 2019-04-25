<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:mindList.jsp
 * Description:
 * Author:Zack
 * Date:2019/4/24
 * Time:15:57
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
<head>
    <style>
        #mind_content {
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
        #mind_content a:hover{
            color: #e22845;
        }

    </style>
</head>
<jsp:include page="head.jsp"/>
<body class="user-select">
<section class="container-fluid">
    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <h1 class="page-header">心情管理</h1>
            <a href="<%=basePath%>view/admin/jsps/mind.jsp">
                <button style="width: 120px;line-height: 38px;text-align: center;font-weight: bold;color: #000;border-radius: 5px;
                                margin:0 20px 20px 0;position: relative;overflow: hidden;">添加心情
                </button>
            </a>

            <h1 class="page-header">管理</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th><span class="glyphicon glyphicon-ok-sign"></span> <span class="visible-lg">选择</span></th>
                        <th class="hidden-sm"><span class="glyphicon glyphicon-book"></span> <span class="visible-lg">内容</span></th>
                        <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                        <th> <span class="glyphicon glyphicon-eye-open"></span><span class="visible-lg">是否公开</span></th>
                        <th><span class="glyphicon glyphicon-edit"></span> <span class="visible-lg">操作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.mindList}" var="mind">
                        <tr>
                                <td style="width: 66px;"><input type="checkbox" class="input-control" name="checkbox[]" value=""/></td>
                                <td style="height: 39px;width: 496px;">
                                    <span style="width:500px;display: -webkit-box;overflow: hidden;text-overflow: ellipsis;-webkit-line-clamp: 2;-webkit-box-orient: vertical">
                                            ${mind.mind_content}
                                    </span>
                                </td>
                                <td style="padding-left: -50px;width: 136px;"><fmt:formatDate value="${mind.mind_date}" pattern="yyyy/MM/dd"/></td>
                                <td class="article-title">
                                    <c:if test="${mind.mind_look==1}">私密 <span class="glyphicon glyphicon-refresh"></span> 置为公开</c:if>
                                    <c:if test="${mind.mind_look==0}">公开 <span class="glyphicon glyphicon-refresh"></span> 置为私密</c:if>
                                </td>
                                <td>
                                    <a href="<c:url value='queryArticle.action'/>?mind_id=${mind.mind_id}">修改</a>
                                    <a href="<c:url value='deleteArticle.action'/>?mind_id=${mind.mind_id}">删除</a>
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
