<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:testueditor
 * Description:
 * Author:Zack
 * Date:2019/3/18
 * Time:17:54
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>

<head>
    <meta charset="UTF-8">
    <title>ueditor demo</title>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->

</head>

<body>
<!-- 加载编辑器的容器 -->
<script id="container" name="content" type="text/plain"></script>
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>

</body>

</html>