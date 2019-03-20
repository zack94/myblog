<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/7
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html>
<head>
    <title>任志洪的个人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%=basePath%>static/css/base.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/index.css" rel="stylesheet">
    <link href="<%=basePath%>static/css/m.css" rel="stylesheet">
    <link href="<%=basePath%>static/images/bannerlogo.png" rel="shortcut icon">
    <!--[if lt IE 9]>
    <script src="<%=basePath%>static/js/modernizr.js"></script>
    <![endif]-->
    <script>
        window.onload = function () {
            var oH2 = document.getElementsByTagName("h2")[0];
            var oUl = document.getElementsByTagName("ul")[0];
            oH2.onclick = function () {
                var style = oUl.style;
                style.display = style.display == "block" ? "none" : "block";
                oH2.className = style.display == "block" ? "open" : ""
            }
        }
    </script>
</head>
<body>
<%--引入header板块--%>
<jsp:include page="header.jsp"/>

<article>
    <h2 class="litle"><span>不要轻易放弃。学习成长的路上，我们长路漫漫，只因学无止境。</span>学无止境</h2>
    <div class="navtab">

        <%--搜索栏--%>
        <div class="search">
            <form action="#" method="post" name="searchform" id="searchform">
                <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字"
                       style="color: rgb(153, 153, 153);"
                       onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}"
                       onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
                <input name="show" value="title" type="hidden">
                <input name="tempid" value="1" type="hidden">
                <input name="tbname" value="news" type="hidden">
                <input name="Submit" class="input_submit" value="搜索" type="submit">
            </form>
        </div>

        <%--文章分类--%>
        <ul class="navlist" id="pageContent">
            <li><a href="">所有文章</a></li>
            <li><a href="">填坑记录</a></li>
            <li><a href="">学习笔记</a></li>
            <li><a href="">他山之石</a></li>
            <li><a href="">黑科技</a></li>
        </ul>
        <script language="javascript">
            var obj = null;
            var As = document.getElementById('pageContent').getElementsByTagName('li');
            obj = As[0];
            for (i = 1; i < As.length; i++) {
                if (window.location.href.indexOf(As[i].href) >= 0)
                    obj = As[i];
            }
            obj.id = 'pagecurrent'
        </script>
    </div>


    <div class="newblogs">
        <h2 class="hometitle">最新文章</h2>
        <%--所有文章--%>
        <ul>
            <% for (int i = 0; i < 10; i++) { %>
            <li>
                <h3 class="blogtitle">
                    <span>
                        <a href="" title="css3" target="_blank" class="classname">个人博客</a>
                    </span>
                    <a href="" target="_blank">文章的标题</a>
                </h3>
                <div class="bloginfo">
                    <span class="blogpic">
                        <a href="" title="">
                            <img src="../static/images/t01.jpg" alt="没有图片"/>
                        </a>
                    </span>
                    <p>文章的简单介绍</p>
                </div>
                <div class="autor"><span class="lm f_l"></span><span class="dtime f_l">2018-03-26</span><span
                        class="viewnum f_l">浏览（<a href="#">1429</a>）</span><span class="f_r"><a
                        href="" class="more">阅读原文>></a></span></div>
                <div class="line"></div>
            </li>
            <% } %>
        </ul>

        <%--分页显示--%>
        <div class="pagelist">
            <a href=""><b>首页</b></a>
            <a href=""><b>上一页</b></a>
            <a href=""><b>1</b></a>
            <a href=""><b>2</b></a>
            <a href=""><b>3</b></a>
            <a href=""><b>4</b></a>
            <a href=""><b>5</b></a>
            <a href=""><b>6</b></a>
            <a href=""><b>7</b></a>
            <a href="">下一页</a>
            <a href="">尾页</a>
            <b>共xx页</b>
        </div>
    </div>
    <div class="rbox">
        <div class="paihang">
            <h2 class="hometitle">阅读排行</h2>
            <ul>
                <% for (int i = 0; i < 6; i++) { %>
                <li><b><a href="#" target="_blank">
                    文章的标题</a></b>
                    <p><i><img src="../static/images/t02.jpg"/></i>文章的简介</p>
                </li>
                <% } %>
            </ul>
        </div>


        <div class="paihang">
            <h2 class="hometitle">推荐</h2>
            <ul>
                <% for (int i = 0; i < 6; i++) { %>
                <li><b><a href="" target="_blank">标题</a></b>
                    <p><i><img src="../static/images/t02.jpg"/></i>简介</p>
                </li>
                <% } %>
            </ul>
        </div>


        <div class="weixin">
            <h2 class="hometitle">XXX</h2>
            <ul>
                <img src="" alt="假装有图片"/>
            </ul>
        </div>
    </div>

</article>
<footer>
        <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>"
                           style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>
</body>
</html>
