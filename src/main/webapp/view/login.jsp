<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:testLogin
 * Description:
 * Author:Zack
 * Date:2018/6/29
 * Time:14:17
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

    <style type="text/css">

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
        function showfh(){
            fhi = 1;
            //关闭提示晃动屏幕，注释掉这句话即可
            timer = setInterval(xzfh2, 10);
        };
        var current = 0;
        function xzfh(){
            current = (current)%360;
            document.body.style.transform = 'rotate('+current+'deg)';
            current ++;
            if(current>360){current = 0;}
        };
        var fhi = 1;
        var current2 = 1;
        function xzfh2(){
            if(fhi>50){
                document.body.style.transform = 'rotate(0deg)';
                clearInterval(timer);
                return;
            }
            current = (current2)%360;
            document.body.style.transform = 'rotate('+current+'deg)';
            current ++;
            if(current2 == 1){current2 = -1;}else{current2 = 1;}
            fhi++;
        };
    </script>

</head>

<body>


<canvas class="cavs"></canvas>
<div style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
    <!-- 登录 -->
    <div <%--id="windows1"--%>>
        <div id="loginbox">
            <form action="userLogin.action" method="post" onsubmit="return check()">
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
                <label id="successInfo" style="color: white">${success}${userIsNull}</label>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="<%=basePath%>static/login/user.png"/></i>
							</span>
                            <input type="text" name="user_email" id="EMAIL" value="${user.user_email}" placeholder="请输入邮箱"/>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="<%=basePath%>static/login/suo.png"/></i>
							</span>
                            <input type="password" name="user_password" id="password" placeholder="请输入密码"
                                   class="keypad" keypadMode="full" allowKeyboard="true" value=""/>
                        </div>
                    </div>
                </div>
                <div style="float:right;padding-right:13%;">
                    <div style="float: left;/*margin-top:3px;*/margin-right:2px;">
                        <font color="white">记住密码</font>
                    </div>
                    <div style="float: left;">
                        <input name="form-field-checkbox" id="saveid" type="checkbox"
                               onclick="savePaw();" style="padding-top:0px;"/>
                    </div>
                </div>
                <div class="form-actions">
                    <div style="width:86%;padding-left:8%;">

                        <div style="float: left/*;padding-top:2px;*/">
                            <i><img src="<%=basePath%>static/login/yan.png"/></i>
                        </div>
                        <div style="float: left;" class="codediv">
                            <input type="text" name="vcode" id="code" class="login_code"
                                   style="height:28px; /*margin-top:3px;*/"/>
                        </div>
                        <div style="float: left;">
                            <i>
                                <%--登陆验证码--%>
                                <img style="height:28px;" id="verifyCode" src="<%=basePath%>getVerifyCode.action" onclick="changeVerifyCode()" alt="点击更换"/>
                            </i>
                        </div>

                        <span class="pull-right">
                            <button type="submit" class="flip-link btn btn-info">登录</button></span>

                        <span class="pull-right" style="padding-right:3%;">
                            <a href="userRegistHomepage.action"
                               class="btn btn-success">注册</a></span>
                    </div>
                </div>
                <label id="error" style="color: red">${error}</label>
            </form>
            <div class="controls">
                <div class="main_input_box">
                    <font color="white">ZACKBLOG</font>
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
    function changeVerifyCode() {
// 获取到元素
        var verifyCode = document.getElementById("verifyCode");
        verifyCode.src = "<%=basePath%>getVerifyCode.action?xxx" + new Date().getTime();
    }
</script>

<script type="text/javascript">

    // 注册成功信息消失
    $(document).ready(function(){//页面加载完之后，自动执行该方法
        setTimeout(function(){
            $("#successInfo").hide();},5000);//5秒后执行该方法
    });

    $(document).ready(function () {
        changeCode1();
        $("#codeImg").bind("click", changeCode1);
        $("#zcodeImg").bind("click", changeCode2);
    });

    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function changeCode1() {
        $("#codeImg").attr("src", "code.do?t=" + genTimestamp());
    }

    function changeCode2() {
        $("#zcodeImg").attr("src", "code.do?t=" + genTimestamp());
    }

    // 客户端校验
    function check() {

        // 邮箱校验
        if ($("#EMAIL").val() == "") {
            $("#EMAIL").tips({
                side: 3,
                msg: '输入邮箱',
                bg: '#AE81FF',
                time: 3
            });
            $("#EMAIL").focus();
            return false;
        } else if (!ismail($("#EMAIL").val())) {
            $("#EMAIL").tips({
                side: 3,
                msg: '邮箱格式不正确',
                bg: '#AE81FF',
                time: 3
            });
            $("#EMAIL").focus();
            return false;
        }
        if ($("#loginname").val() == "") {
            $("#loginname").tips({
                side: 2,
                msg: '用户名不得为空',
                bg: '#AE81FF',
                time: 3
            });
            showfh();
            $("#loginname").focus();
            return false;
        } else {
            $("#loginname").val(jQuery.trim($('#loginname').val()));
        }
        if ($("#password").val() == "") {
            $("#password").tips({
                side: 2,
                msg: '密码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            showfh();
            $("#password").focus();
            return false;
        }
        if ($("#code").val() == "") {
            $("#code").tips({
                side: 1,
                msg: '验证码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            showfh();
            $("#code").focus();
            return false;
        }
        $("#loginbox").tips({
            side: 1,
            msg: '正在登录 , 请稍后 ...',
            bg: '#68B500',
            time: 10
        });
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


<footer>
        <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>"
                           style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>
</body>

</html>
