<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:mind
 * Description:
 * Author:Zack
 * Date:2018/6/12
 * Time:16:27
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<jsp:include page="head.jsp"/>
<head>
    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<title>任志洪的个人博客</title>--%>
    <%--<link rel="shortcut icon" href="<%=basePath%>view/admin/images/icon/bannerlogo.png">--%>

    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/style.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>view/admin/css/font-awesome.min.css">--%>

    <script src="<%=basePath%>ueditor/ueditor.all.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.all.min.js"></script>

    <script src="<%=basePath%>view/admin/js/getTime.js"></script>

</head>

<body class="user-select">
<section class="container-fluid">

    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <div class="row">
                <form action="<%=basePath%>addNewMind.action" method="post" enctype="multipart/form-data">
                    <div class="col-md-9">
                        <h1 class="page-header">新心情</h1>

                        <div class="form-group">
                            <h2 class="add-article-box-title"><span>内容</span></h2>

                            <textarea id="article_content" name="article_content"></textarea>
                            <script type="text/javascript" charset="utf-8">
                                var editor = new baidu.editor.ui.Editor();
                                editor.render("article_content");
                            </script>
                        </div>

                    </div>
                    <div class="col-md-3">
                        <h1 class="page-header">操作</h1>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>标题图片</span></h2>
                            <div class="add-article-box-content">
                                <input type="file" placeholder="点击按钮选择图片" id="pictureUpload" name="pictureFile">
                            </div>

                        </div>
                        <div class="add-article-box">
                            <h2 class="add-article-box-title"><span>发布</span></h2>
                            <div class="add-article-box-content">

                            <p><label>状态：</label>
                                <span class="article-status-display">未发布</span>
                            </p>

                            <p><label>公开度：</label>
                                <input type="radio" name="mind_look" value="0" checked/>公开
                                <input type="radio" name="mind_look" value="1" />加密</p>
                            <p><label>发布于：</label>
                                <span class="article-time-display">
                                    <span id="timeShow" class="time1"></span>
                                    <%--<input style="border: none;" type="datetime" name="time" value="2016-01-09 17:29:37" />--%>
                                </span>
                            </p>
                            </div>
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


