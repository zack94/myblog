<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:connectme
 * Description:
 * Author:Zack
 * Date:2018/6/22
 * Time:17:29
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>static/css/connectme.css" type="text/css">

    <%--鼠标悬停出现图片--%>
    <script>
        function showPic(e, sUrl) {
            var x, y;
            x = e.clientX;
            y = e.clientY;
            document.getElementById("Layer1").style.left = x + 2 + 'px';
            document.getElementById("Layer1").style.top = y + 2 + 'px';
            document.getElementById("Layer1").innerHTML = "<img border='0' src=\"" + sUrl + "\">";
            document.getElementById("Layer1").style.display = "";
        }

        function hiddenPic() {
            document.getElementById("Layer1").innerHTML = "";
            document.getElementById("Layer1").style.display = "none";
        }
    </script>

</head>
<body>
<div class="social-icons w3layouts agileits">
    <ul>
        <li class="qq">
            <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1363498361&amp;site=qq&amp;menu=yes">
                <span class="icons w3layouts agileits"></span>
                <span class="text w3layouts agileits">QQ</span>
            </a>
            <%--<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=1363498361&amp;site=qq&amp;menu=yes">点这里给我发消息</a>--%>
        </li>

        <li class="weixin w3ls">
            <a href="<%=basePath%>static/images/contentmeWX.jpg"  target="_blank" id="weixin">
                <span class="icons w3layouts agileits"></span>
                <span class="text w3layouts agileits">微信</span>
            </a>

        </li>

        <li class="weibo aits">
            <a href="">
                <span class="icons w3layouts agileits"></span>
                <span class="text w3layouts agileits">微博</span>
            </a>
        </li>
    </ul>
</div>
</body>
</html>