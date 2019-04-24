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
<!doctype html>
<html>
<jsp:include page="head.jsp"/>
<head>

    <script src="<%=basePath%>ueditor/ueditor.all.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.config.js"></script>
    <script src="<%=basePath%>ueditor/ueditor.all.min.js"></script>
    <%--<script src="<%=basePath%>view/admin/jsps/js/test.js"></script>--%>
    <script src="<%=basePath%>ueditor/third-party/jquery-1.10.2.js"></script>
    <script>

        $(function(){
            var toolbars = [["fullscreen","source","undo","redo","insertunorderedlist",
                "insertorderedlist","cleardoc","selectall","searchreplace","preview","date","time",
                "bold","italic","underline","fontborder","strikethrough","forecolor","backcolor",
                "superscript","subscript","justifyleft","justifycenter","justifyright","justifyjustify",
                "touppercase","tolowercase","directionalityltr","directionalityrtl","indent","removeformat",
                "formatmatch","autotypeset","customstyle","paragraph","rowspacingbottom","rowspacingtop",
                "lineheight","fontfamily","fontsize","imagenone","imageleft","imageright","imagecenter",
                "inserttable","deletetable","mergeright","mergedown","splittorows","splittocols","splittocells",
                "mergecells","insertcol","insertrow","deletecol","deleterow","insertparagraphbeforetable","charts","print","help"]];
            var ue = UE.getEditor('infoEditor',{
                toolbars: toolbars
            });

            //初始化编辑框内容
            // var htmlStr = $("#editorValue").val();
            var htmlStr = "${requestScope.article.article_content}";
            console.log(htmlStr);
            ue.ready(function() {
                ue.setContent(htmlStr, false);
            });
            $("input[type='checkbox']").prop("disabled",true)
        })
        function save(){
            var content= UE.getEditor('infoEditor').getContent();
            content = content.replace(new RegExp("<","g"),"<").replace(new RegExp(">","g"),">").replace(new RegExp("\"","g"),"");
            $("#editorValue").val(content);
            $("#ueform").submit();
        }

    </script>


</head>


<body>
<form action="" id="ueform">
    <%--"${requestScope.article.article_content}"--%>
    <%--<%=request.getAttribute("article")%>--%>
    <input id="editorValue" type="hidden"/>
    <div style="width: 80%;">
        <script id="infoEditor" type="text/plain" style="width:100%;"/>
    </div>
</form>
</body>

</html>
