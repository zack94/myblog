<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/20
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <%--<base href="<%=basePath%>">--%>
    <title>任志洪得个人博客</title>
    <link rel="shortcut icon" href="<%=basePath%>static/images/bannerlogo.png">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>ueditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body>
<h1 align="center">发布新文章</h1>
<form action="../../addArticle.action" method="post" enctype="multipart/form-data">
    <table align="center" width="1200px" height="50px">
        <tr>
            <td>
                文章标题：<input type="text" name="article_title" width="15"/>
            </td>
            <td>文章分类标签：<input type="text" name="article_label"/>
            </td>
            <td>
                选取配图：<input type="file" name="pictureFile">
            </td>
            <td>
                <input type="submit" value="确认上传"/>
            </td>
        </tr>
    </table>


    <textarea id="article_content" name="article_content"></textarea>
    <script type="text/javascript" charset="utf-8" >
        var editor = new baidu.editor.ui.Editor();
        editor.render("article_content");
    </script>


</form>
</body>

</html>