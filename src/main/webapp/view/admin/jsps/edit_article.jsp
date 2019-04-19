<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:edit_article.jsp
 * Description:
 * Author:Zack
 * Date:2019/4/19
 * Time:11:29
 */  
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

<jsp:include page="head.jsp"/>
<head>

    <script src="<%=basePath%>ueditor/ueditor.all.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.all.min.js"></script>

</head>



<body class="user-select">
<section class="container-fluid">
    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <div class="row">
                <form action="<%=basePath%>addArticle.action" method="post" enctype="multipart/form-data">
                    <div class="col-md-9">
                        <h1 class="page-header">撰写新文章</h1>
                        <div class="form-group">
                            <h2 class="add-article-box-title"><span>标题</span></h2>
                            <input type="text" id="article-title" name="article_title" class="form-control"
                                   placeholder="在此处输入标题" required autofocus autocomplete="off">
                        </div>
                        <div class="form-group">
                            <h2 class="add-article-box-title"><span>内容</span></h2>

                            <textarea id="article_content" name="article_content" value="${requestScope.article.article_content}"/>
                            <script type="text/javascript" charset="utf-8">
                                var editor = new baidu.editor.ui.Editor();
                                editor.render("article_content");
                                // editor.setContext(document.getElelmentById("article_content").value)
                            </script>

                        </div>
                    </div>
                    <div class="col-md-3">
                        <h1 class="page-header">操作</h1>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>栏目</span></h2>
                            <div class="add-article-box-content">
                                <ul class="category-list">
                                    <li>
                                        <label>
                                            <input name="category" type="radio" value="1" checked>
                                            这是栏目 <em class="hidden-md">( 栏目ID: <span>1</span> )</em>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <input name="category" type="radio" value="2">
                                            这是栏目 <em class="hidden-md">( 栏目ID: <span>2</span> )</em>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <input name="category" type="radio" value="3">
                                            这是栏目 <em class="hidden-md">( 栏目ID: <span>3</span> )</em>
                                        </label>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>标签</span></h2>
                            <div class="add-article-box-content">
                                <input type="text" class="form-control" placeholder="输入新标签" name="article_label"
                                       autocomplete="off">
                                <span class="prompt-text">多个标签请用英文逗号,隔开</span></div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>标题图片</span></h2>
                            <div class="add-article-box-content">
                                <input type="file" placeholder="点击按钮选择图片" id="pictureUpload" name="pictureFile">
                            </div>
                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>发布</span></h2>

                            <div class="add-article-box-footer">
                                <button class="btn btn-primary" type="submit">发布</button>
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
