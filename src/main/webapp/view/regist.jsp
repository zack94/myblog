<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:testRegist
 * Description:
 * Author:Zack
 * Date:2018/6/29
 * Time:14:27
 */
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<html lang="en">
<%--导入标题栏--%>
<jsp:include page="header.jsp"/>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="<%=basePath%>static/login/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/login/css/camera.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/login/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/login/matrix-login.css"/>
    <link rel="stylesheet" href="<%=basePath%>static/login/font-awesome.css"/>
    <script type="text/javascript" src="<%=basePath%>static/login/js/jquery-1.5.1.min.js"></script>
    <!-- 软键盘控件start -->
    <%--<link href="<%=basePath%>static/login/keypad/css/framework/form.css" rel="stylesheet" type="text/css"/>--%>
    <!-- 软键盘控件end -->
    <style type="text/css">
        /*
       body{
        -webkit-transform: rotate(-3deg);
        -moz-transform: rotate(-3deg);
        -o-transform: rotate(-3deg);
        padding-top:20px;
        }
        */
        .cavs {
            z-index: 1;
            position: fixed;
            width: 95%;
            margin-left: 20px;
            margin-right: 20px;
        }
    </style>
    <script>
        //window.setTimeout(showfh,3000);
        var timer;

        function showfh() {
            fhi = 1;
            //关闭提示晃动屏幕，注释掉这句话即可
            // timer = setInterval(xzfh2, 10);
        }

        var current = 0;

        function xzfh() {
            current = (current) % 360;
            document.body.style.transform = 'rotate(' + current + 'deg)';
            current++;
            if (current > 360) {
                current = 0;
            }
        }

        var fhi = 1;
        var current2 = 1;

        function xzfh2() {
            if (fhi > 50) {
                document.body.style.transform = 'rotate(0deg)';
                clearInterval(timer);
                return;
            }
            current = (current2) % 360;
            document.body.style.transform = 'rotate(' + current + 'deg)';
            current++;
            if (current2 == 1) {
                current2 = -1;
            } else {
                current2 = 1;
            }
            fhi++;
        }
    </script>
</head>

<body>


<!--小键盘承载器-->
<%--<canvas class="cavs"></canvas>--%>

<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">


    <!-- 注册 -->
    <div <%--id="windows2"--%> <%--style="display: none;"--%>>
        <div id="loginbox">
            <form action="addUser.action" method="post" <%--id="loginForm"--%> onsubmit="return rcheck()">
                <div class="control-group normal_text">
                    <h3>
                        <span style="color: #3ae076e0">W</span>
                        <span style="color: #ff4040">E</span>
                        <span style="color: #d24dae">L</span>
                        <span style="color: #49ded8">C</span>
                        <span style="color: #5538ec">O</span>
                        <span style="color: #f36e2c">M</span>
                        <span style="color: #38d42f">E</span>
                    </h3>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
    <span class="add-on bg_lg">
    <i>用户</i>
    </span>
                            <input type="text" name="user_name" id="USERNAME" value="${user.user_name}" placeholder="请输入昵称"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
    <span class="add-on bg_lg">
    <i>邮箱</i>
    </span>
                            <input type="text" name="user_email" id="EMAIL2" value="${user.user_email}" placeholder="请输入邮箱"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
    <span class="add-on bg_ly">
    <i>密码</i>
    </span>
                            <input type="password" name="user_password" id="PASSWORD" placeholder="请输入密码"
                                   class="keypad" <%--keypadMode="full" allowKeyboard="true"--%> value=""/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
    <span class="add-on bg_ly">
    <i>重输</i>
    </span>
                            <input type="password" name="chkpwd" id="chkpwd" placeholder="请确认密码"
                                   class="keypad" <%--keypadMode="full" allowKeyboard="true"--%> value=""/>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div style="width:86%;padding-left:8%;">

                        <div style="float: left;/*padding-top:2px;*/">
                            <i><img src="<%=basePath%>static/login/yan.png"/></i>
                        </div>
                        <div style="float: left;" class="codediv">
                            <input type="text" name="vcode" id="rcode" class="login_code"
                                   style="height:28px;width: 50px;"/>
                        </div>
                        <%--<input name="rcode" style="height: 28px;width: 50px;"/>--%>

                        <div style="float: left;">
                            <i>
                                <%--注册验证码--%>
                                <img style="height:28px;" id="verifyCode2"
                                     src="<c:url value='getVerifyCode.action'/>" onclick="changeVerifyCode2()"
                                     alt="点击更换"/>
                            </i>
                        </div>

                        <%--<span class="pull-right"><a onclick="rcheck();" class="flip-link btn btn-info" id="to-recover">提交</a></span>--%>
                        <span class="pull-right"><button type="submit" <%--onclick="submitFrom();"--%> <%--onclick="rcheck();"--%>
                                                                                   <%--onsubmit="return rcheck()"--%> class="flip-link btn btn-info" id="to-recover">提交</button></span>

                        <span class="pull-right" style="padding-right:3%;"><a href="userLoginHomepage.action" class="btn btn-success">取消</a></span>
                    </div>
                </div>
                    <%--<span style="background-color: white;color: #ff0000;font-size: 14px;">${error}</span>--%>
                <label id="error" style="color: red">${error}</label>
            </form>
            <div class="controls">
                <div class="main_input_box">
                    <span color="white"><span id="nameerr">ZACKBLOG</span></span>
                </div>
            </div>
        </div>
    </div>

</div>
<div id="templatemo_banner_slide" class="container_wapper">
    <div class="camera_wrap camera_emboss" id="camera_slide">
        <!-- 背景图片 -->
        <div data-src="<%=basePath%>static/login/images/banner_slide_01.jpg"></div>
        <div data-src="<%=basePath%>static/login/images/banner_slide_02.jpg"></div>
        <div data-src="<%=basePath%>static/login/images/banner_slide_03.jpg"></div>
        <div data-src="<%=basePath%>static/login/images/banner_slide_04.jpg"></div>
        <div data-src="<%=basePath%>static/login/images/banner_slide_05.jpg"></div>
    </div>
    <!-- #camera_wrap_3 -->
</div>


<%--点击更换验证码--%>
<script>

    $(document).ready(function(){//页面加载完之后，自动执行该方法
        setTimeout(function(){
            $("#error").hide();},5000);//5秒后执行该方法
    });



    function changeVerifyCode2() {
        // 获取到元素
        var verifyCode = document.getElementById("verifyCode2");
        verifyCode.src = "<c:url value='getVerifyCode.action'/>?xxx" + new Date().getTime();
    }
</script>

<script type="text/javascript">

    function submitFrom() {
        if (rcheck()){
            $("to-recover")
        }

    }


    //注册校验
    function rcheck() {
        // 用户名校验
        if ($("#USERNAME").val() == "") {
            $("#USERNAME").tips({
                side: 3,
                msg: '输入昵称',
                bg: '#AE81FF',
                time: 2
            });
            $("#USERNAME").focus();
            $("#USERNAME").val('');
            return false;
        } else {
            $("#USERNAME").val(jQuery.trim($('#USERNAME').val()));
        }
        // 注册邮箱校验
        if ($("#EMAIL2").val() == "") {
            $("#EMAIL2").tips({
                side: 3,
                msg: '输入邮箱',
                bg: '#AE81FF',
                time: 2
            });
            $("#EMAIL2").focus();
            return false;
        } else if (!ismail($("#EMAIL2").val())) {
            $("#EMAIL2").tips({
                side: 3,
                msg: '邮箱格式不正确',
                bg: '#AE81FF',
                time: 2
            });
            $("#EMAIL2").focus();
            return false;
        }
        // 密码校验
        if ($("#PASSWORD").val() == "") {
            $("#PASSWORD").tips({
                side: 3,
                msg: '输入密码',
                bg: '#AE81FF',
                time: 2
            });
            $("#PASSWORD").focus();
            return false;
        }
        if ($("#PASSWORD").val() != $("#chkpwd").val()) {
            $("#chkpwd").tips({
                side: 3,
                msg: '两次密码不相同',
                bg: '#AE81FF',
                time: 3
            });
            $("#chkpwd").focus();
            return false;
        }
        // 验证码非空校验
        if ($("#rcode").val() == "") {
            $("#rcode").tips({
                side: 1,
                msg: '验证码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#rcode").focus();
            return false;
        }

        return true;
    }


    //邮箱格式校验
    function ismail(mail) {
        return (new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
    }
</script>
<script src="<%=basePath%>static/login/js/bootstrap.min.js"></script>
<script src="<%=basePath%>static/login/js/jquery-1.7.2.js"></script>
<script src="<%=basePath%>static/login/js/jquery.easing.1.3.js"></script>
<script src="<%=basePath%>static/login/js/jquery.mobile.customized.min.js"></script>
<script src="<%=basePath%>static/login/js/camera.min.js"></script>
<script src="<%=basePath%>static/login/js/templatemo_script.js"></script>
<script src="<%=basePath%>static/login/js/ban.js"></script>
<script type="text/javascript" src="<%=basePath%>static/login/js/jQuery.md5.js"></script>
<script type="text/javascript" src="<%=basePath%>static/login/js/jquery.tips.js"></script>
<script type="text/javascript" src="<%=basePath%>static/login/js/jquery.cookie.js"></script>

<!-- 软键盘控件start -->
<%--<script type="text/javascript" src="<%=basePath%>static/login/keypad/js/form/keypad.js"></script>--%>
<%--<script type="text/javascript" src="<%=basePath%>static/login/keypad/js/framework.js"></script>--%>
<!-- 软键盘控件end -->
<footer>
        <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>"
                           style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>

</body>

</html>

