<%--
  Created by IntelliJ IDEA.
  User: Zack_RZH
  Date: 2018/5/20
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <title>任志洪得个人博客</title>
    <link rel="shortcut icon" href="../../../static/images/bannerlogo.png">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="../../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../../ueditor/ueditor.all.min.js"></script>

    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="../../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');

        function isFocus(e) {
            alert(UE.getEditor('editor').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }

        function setblur(e) {
            UE.getEditor('editor').blur();
            UE.dom.domUtils.preventDefault(e)
        }

        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('editor').execCommand('insertHtml', value)
        }

        function createEditor() {
            enableBtn();
            UE.getEditor('editor');
        }

        function getAllHtml() {
            alert(UE.getEditor('editor').getAllHtml())
        }

        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }

        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getPlainTxt());
            alert(arr.join('\n'))
        }

        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }

        function setDisabled() {
            UE.getEditor('editor').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('editor').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('editor').selection.getRange();
            range.select();
            var txt = UE.getEditor('editor').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('editor').getContentTxt());
            alert(arr.join("\n"));
        }

        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('editor').hasContents());
            alert(arr.join("\n"));
        }

        function setFocus() {
            UE.getEditor('editor').focus();
        }

        function deleteEditor() {
            disableBtn();
            UE.getEditor('editor').destroy();
        }

        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }

        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            }
        }

        function getLocalData() {
            alert(UE.getEditor('editor').execCommand("getlocaldata"));
        }

        function clearLocalData() {
            UE.getEditor('editor').execCommand("clearlocaldata");
            alert("已清空草稿箱")
        }
    </script>
</head>
<body>
<h1 align="center">发布新文章</h1>
<form action="addArticle.action" method="post" enctype="multipart/form-data">
    <table align="center" width="1200px" height="50px">
        <tr>
            <td>
                文章标题：<input type="text" name="article_title" width="15"/>
            </td>
            <td>文章分类标签：
                <select name="article_label">
                    <%--<c:choose>--%>
                    <%--<c:when test="${article_label == 'A'}">--%>
                    <option value="A" selected>A</option>
                    <%--</c:when>--%>
                    <%--<c:when test="${article_label == 'B'}">--%>
                    <option value="B" selected>B</option>
                    <%--</c:when>--%>
                    <%--<c:when test="${article_label == 'C'}">--%>
                    <option value="C" selected>C</option>
                    <%--</c:when>--%>
                    <%--</c:choose>--%>
                </select>
            </td>
            <td>
                选取配图：<input type="file" name="picture">
            </td>
            <td>
                <input type="submit" value="确认上传"/>
            </td>
        </tr>




    </table>

    <script id="editor" type="text/plain" style="width:1200px;height:500px;"></script>

</form>
</body>
</html>