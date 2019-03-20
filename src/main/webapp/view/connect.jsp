<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:connect
 * Description:
 * Author:Zack
 * Date:2018/7/6
 * Time:14:33
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <script language="javascript">
        function showPic(e,sUrl){
            var x,y;
            x = e.clientX;
            y = e.clientY;
            document.getElementById("Layer1").style.left = x+2+'px';
            document.getElementById("Layer1").style.top = y+2+'px';
            document.getElementById("Layer1").innerHTML = "<img border='0' src=\"" + sUrl + "\">";
            document.getElementById("Layer1").style.display = "";
        }
        function hiddenPic(){
            document.getElementById("Layer1").innerHTML = "";
            document.getElementById("Layer1").style.display = "none";
        }
    </script>

</head>
<body>

<div>

    <!-- QQ联系 -->
    <div id="Layer1" style="width:200px;height: 200px; display: none; position: absolute; z-index: 100;">
    </div>
    <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1363498361&amp;site=qq&amp;menu=yes"
       onmouseout="hiddenPic();" onmousemove="showPic(event,'<%=basePath%>static/images/qqcontent.png');">
        <div style="float: left;margin-right: 40px;">
            <div style="float: left;">
                <img src="<%=basePath%>static/images/QQ.png" style="width: 30px;height: 30px">
            </div>
            <div style="float: left; margin-top: 5px;margin-left: 5px;"><span style="color: #e72e0f;">QQ</span></div>
        </div>
    </a>


    <!-- 微信联系 -->
    <div id="Layer1" style="width:200px;height: 200px;display: none; position: absolute; z-index: 100;">
    </div>
    <a href="<%=basePath%>static/images/contentmeWX.jpg" target="_blank" onmouseout="hiddenPic();" onmousemove="showPic(event,'<%=basePath%>static/images/contentmeWX.jpg');">
        <div style="float: left;margin-right: 40px;">
            <div style="float: left;">
                <img src="<%=basePath%>static/images/weixin.png" style="width: 30px;height: 30px">
            </div>
            <div style="float: left; margin-top: 5px;margin-left: 5px;"><span style="color: #07cf14;">微信</span></div>
        </div>
    </a>


    <!-- 微博联系 -->
    <div id="Layer1" style="width:200px;height: 200px;display: none; position: absolute; z-index: 100;">
    </div>
        <div style="float: left;">
            <div style="float: left;">
                <img src="<%=basePath%>static/images/weibo.png" style="width: 30px;height: 30px">
            </div>
            <div style="float: left; margin-top: 5px;margin-left: 5px;"><span style="color: #ffd542;">微博</span></div>
        </div>
</div>


</body>
</html>