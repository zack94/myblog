<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:headFile
 * Description:
 * Author:Zack
 * Date:2018/6/14
 * Time:17:27
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<title>任志洪的个人博客</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=basePath%>static/css/base.css" rel="stylesheet">
<%--<link href="../static/css/about.css" rel="stylesheet">--%>
<link href="<%=basePath%>static/css/m.css" rel="stylesheet">
<link href="<%=basePath%>static/css/mindALL.css" rel="stylesheet">
<link href="<%=basePath%>static/images/bannerlogo.png" rel="shortcut icon">

<!--[if lt IE 9]>
<script src=<%=basePath%>static/js/modernizr.js"></script>
<![endif]-->
<script src="<%=basePath%>static/js/scrollReveal.js"></script>
<!--[if lt IE 9]>
<script src="<%=basePath%>static/js/modernizr.js"></script>
<![endif]-->







