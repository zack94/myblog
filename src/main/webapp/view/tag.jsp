<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:tag
 * Description:
 * Author:Zack
 * Date:2018/6/22
 * Time:13:46
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

    <style type="text/css">
        /*body {*/
        /*font-family: "微软雅黑", Arial, sans-serif;*/
        /*}*/

        #main {
            /*border: none;*/
            /*background: none;*/
        }

        /*body, ul, li, h1, h2, h3, p, form {*/
        /*margin: 0;*/
        /*padding: 0;*/
        /*}*/

        /*body {*/
        /*background: #fbfbfb;*/
        /*color: #444;*/
        /*font-size: 14px;*/
        /*}*/

        a {
            color: #444;
            text-decoration: none;
        }

        /*a:hover {*/
            /*color: red;*/
        /*}*/

        /* tagscloud */
        #tagscloud {
            /*font-size: 14px;*/
            width: 280px;
            height: 260px;
            position: relative;
            font-size: 12px;
            color: #333;
            margin: 20px auto 0;
            text-align: center;
        }

        #tagscloud a {
            position: absolute;
            top: 0px;
            left: 0px;
            color: #333;
            font-family: Arial;
            text-decoration: none;
            margin: 0 10px 15px 0;
            line-height: 18px;
            text-align: center;
            font-size: 16px;
            padding: 1px 5px;
            display: inline-block;
            border-radius: 3px;
        }

        #tagscloud a.tagc1 {
            background: #c0a867;
            color: #ffffff;
        }

        #tagscloud a.tagc2 {
            background: #23a136;
            color: #ffffff;
        }

        #tagscloud a.tagc3 {
            background: #0971a0;
            color: #ffffff;
        }

        #tagscloud a.tagc4 {
            background: #ac761d;
            color: #ffffff;
        }

        #tagscloud a.tagc5 {
            background: #8969aa;
            color: #ffffff;
        }

        #tagscloud a:hover {
            color: #494bbc;
            background:  #ff414c;
        }
    </style>
</head>

<body>
<div id="tagscloud">
    <a href="" class="tagc1">JS</a>
    <a href="" class="tagc2">springMVC</a>
    <a href="" class="tagc3">Mybatis</a>
    <a href="" class="tagc4">AOP</a>
    <a href="" class="tagc5">IOC/DI</a>
    <a href="" class="tagc1">Google</a>
    <a href="" class="tagc2">算法</a>
    <a href="" class="tagc3">架构</a>
    <a href="" class="tagc4">OOP</a>
    <a href="" class="tagc5">XHTML</a>
    <a href="" class="tagc1">W3C</a>
    <a href="" class="tagc2">算法</a>
    <a href="" class="tagc3">架构</a>
    <a href="" class="tagc4">OOP</a>
    <a href="" class="tagc5">XHTML</a>
    <a href="" class="tagc1">JS</a>
    <a href="" class="tagc2">JavaScript</a>
    <a href="" class="tagc3">前端</a>
    <a href="" class="tagc4">IE</a>
    <a href="" class="tagc5">CSS</a>


</div>
<script src='<%=basePath%>static/js/tagscloud.js' type="text/javascript"></script>

</body>
</html>


