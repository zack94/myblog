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
<!doctype html>
<html>
<jsp:include page="head.jsp"/>
<head>

    <script src="<%=basePath%>ueditor/ueditor.all.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.all.min.js"></script>
    <script src="<%=basePath%>ueditor/third-party/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>view/admin/js/getTime.js"></script>

    <script>

        $(function () {
            var toolbars = [['fullscreen', 'source', '|', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                'directionalityltr', 'directionalityrtl', 'indent', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
                'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
                'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                'print', 'preview', 'searchreplace', 'drafts', 'help']];

            var ue = UE.getEditor('infoEditor', {toolbars: toolbars});

            //初始化编辑框内容

            var htmlStr = "${requestScope.mind.mind_content}";
            console.log(htmlStr);
            ue.ready(function () {
                ue.setContent(htmlStr, false);
            });
            $("input[type='checkbox']").prop("disabled", true)
        })

        function save() {
            var content = UE.getEditor('infoEditor').getContent();
            // content = content.replace(new RegExp("<", "g"), "<").replace(new RegExp(">", "g"), ">").replace(new RegExp("\"", "g"), "");
            $("#editorValue").val(content);
            $("#ueform").submit();
        }

    </script>


</head>


<body class="user-select">
<section class="container-fluid">

    <jsp:include page="banner.jsp"/>
    <div class="row">
        <jsp:include page="left_Navigation_bar.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <div class="row">
                <form action="<%=basePath%>updateMind.action" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="mind_id" value="${requestScope.mind.mind_id}">
                    <div class="col-md-9">
                        <h1 class="page-header">修改心情</h1>


                        <div class="form-group">
                            <h2 class="add-article-box-title"><span>内容</span></h2>
                            <input id="editorValue" type="hidden" style="display: none" name="mind_content"></input>
                            <script id="infoEditor" type="text/plain"></script>
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
                                    <%--${requestScope.mind.mind_look}--%>
                                    <input type="radio" name="mind_look" value="1" ${requestScope.mind.mind_look==1 ? 'checked':''}>公开
                                    <input type="radio" name="mind_look" value="0" ${requestScope.mind.mind_look==0 ? 'checked':''}>加密
                                </p>
                                <p><label>修改时间：</label>
                                    <span class="article-time-display">
                                        <span id="timeShow" class="time1"></span>
                                    <%--<input style="border: none;" type="datetime" name="time" value="2016-01-09 17:29:37" />--%>
                                </span>
                                </p>
                            </div>
                            <div class="add-article-box-footer">
                                <button class="btn btn-primary" type="submit" onclick="save()">确认修改</button>
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


