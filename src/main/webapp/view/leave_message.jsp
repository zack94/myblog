<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:leave_message
 * Description:
 * Author:Zack
 * Date:2018/7/4
 * Time:10:14
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        body {
            background: url("<%=basePath%>static/leaveimages/background.jpg");
        }

        #qq {
            width: 600px; /*宽*/
            height: 170px; /*高*/
            background: #fff; /*背景颜色*/
            margin: 50px auto 30px;
            border-radius: 5px; /*Html5 圆角*/
        }

        #qq p {
            font-size: 12px;
            color: #666;
            font-family: "微软雅黑";
            line-height: 45px;
            text-indent: 20px;
        }

        #qq .message {
            width: 560px;
            height: 70px;
            margin: 0px auto;
            outline: none;
            border: 1px solid #ddd; /*粗细 风格 颜色*/
        }

        #qq .But {
            width: 560px;
            height: 35px;
            margin: 15px auto 0px;
            position: relative; /*相对，参考对象*/
        }

        #qq .But img.bq {
            float: left; /*左浮动*/
        }

        #qq .But span.submit {
            width: 80px;
            height: 30px;
            background: #ff8140;
            display: block;
            float: right; /*右浮动*/
            line-height: 30px;
            border-radius: 5px;
            cursor: pointer; /*手指*/
            color: #fff;
            font-size: 12px;
            text-align: center;
            font-family: "微软雅黑";
        }

        /*face begin*/
        #qq .But .face {
            width: 390px;
            height: 160px;
            background: #fff;
            padding: 10px;
            border: 1px solid #ddd;
            box-shadow: 2px 2px 3px #666;
            position: absolute; /*绝对定位*/
            top: 21px;
            left: 15px;
            display: none; /*隐藏*/
        }

        #qq .But .face ul li {
            width: 22px;
            height: 22px;
            list-style-type: none; /*去掉圆点*/
            float: left;
            margin: 2px;
            cursor: pointer;
        }

        /*msgCon begin*/
        .msgCon {
            width: 600px;
            height: 500px;
            margin: 0px auto;
        }

        .msgCon .msgBox {
            background: #fff;
            padding: 10px;
            margin-top: 20px;
        }

        .msgCon .msgBox dl {
            height: 60px;
            border-bottom: 1px dotted #ddd;
        }

        .msgCon .msgBox dl dt {
            width: 50px;
            height: 50px;
            float: left;
        }

        .msgCon .msgBox dl dt img {
            border-radius: 25px;
        }

        .msgCon .msgBox dl dd {
            width: 500px;
            height: 50px;
            line-height: 50px;
            float: right;
            font-size: 16px;
            font-family: "微软雅黑";
        }

        .msgCon .msgBox .msgTxt {
            font-size: 12px;
            color: #666;
            line-height: 25px;
        }
    </style>


</head>
<body>

<div id="qq">
    <%--<p>有什么想告诉我的?</p>--%>
    <%--<div class="message" contentEditable='true'></div>--%>
    <%--<div class="But">--%>
    <%--<img src="<%=basePath%>static/leaveimages/bba_thumb.gif" class='bq'/>--%>
    <%--<span class='submit'>发表</span>--%>
    <%--<div class="face">--%>
    <%--<ul>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/zz2_thumb.gif" title="[织]" ></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/horse2_thumb.gif" title="神马]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/fuyun_thumb.gif" title="[浮云]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/geili_thumb.gif" title="[给力]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/wg_thumb.gif" title="[围观]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/vw_thumb.gif" title="[威武]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/panda_thumb.gif" title="[熊猫]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/rabbit_thumb.gif" title="兔子]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/otm_thumb.gif" title="[奥特曼]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/j_thumb.gif" title="[囧]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/hufen_thumb.gif" title="[互粉]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/liwu_thumb.gif" title="[礼物]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/smilea_thumb.gif" title="呵呵]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/tootha_thumb.gif" title="嘻嘻]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/laugh.gif" title="[哈哈]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/tza_thumb.gif" title="[可爱]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/kl_thumb.gif" title="[可怜]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/kbsa_thumb.gif" title="[挖鼻屎]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cj_thumb.gif" title="[吃惊]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/shamea_thumb.gif" title="[害羞]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/zy_thumb.gif" title="[挤眼]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/bz_thumb.gif" title="[闭嘴]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/bs2_thumb.gif" title="[鄙视]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/lovea_thumb.gif" title="[爱你]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sada_thumb.gif" title="[泪]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/heia_thumb.gif" title="[偷笑]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/qq_thumb.gif" title="[亲亲]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sb_thumb.gif" title="[生病]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/mb_thumb.gif" title="[太开心]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/ldln_thumb.gif" title="[懒得理你]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/yhh_thumb.gif" title="[右哼哼]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/zhh_thumb.gif" title="[左哼哼]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/x_thumb.gif" title="[嘘]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cry.gif" title="[衰]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/wq_thumb.gif" title="[委屈]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/t_thumb.gif" title="[吐]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/k_thumb.gif" title="[打哈气]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/bba_thumb.gif" title="[抱抱]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/angrya_thumb.gif" title="[怒]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/yw_thumb.gif" title="[疑问]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cza_thumb.gif" title="[馋嘴]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/88_thumb.gif" title="[拜拜]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sk_thumb.gif" title="[思考]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sweata_thumb.gif" title="[汗]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sleepya_thumb.gif" title="[困]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sleepa_thumb.gif" title="[睡觉]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/money_thumb.gif" title="[钱]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sw_thumb.gif" title="[失望]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cool_thumb.gif" title="[酷]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/hsa_thumb.gif" title="[花心]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/hatea_thumb.gif" title="[哼]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/gza_thumb.gif" title="[鼓掌]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/dizzya_thumb.gif" title="[晕]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/bs_thumb.gif" title="[悲伤]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/crazya_thumb.gif" title="[抓狂]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/h_thumb.gif" title="[黑线]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/yx_thumb.gif" title="[阴险]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/nm_thumb.gif" title="[怒骂]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/hearta_thumb.gif" title="[心]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/unheart.gif" title="[伤心]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/pig.gif" title="[猪头]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/ok_thumb.gif" title="[ok]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/ye_thumb.gif" title="[耶]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/good_thumb.gif" title="[good]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/no_thumb.gif" title="[不要]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/z2_thumb.gif" title="[赞]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/come_thumb.gif" title="[来]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/sad_thumb.gif" title="[弱]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/lazu_thumb.gif" title="[蜡烛]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/clock_thumb.gif" title="[钟]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cake.gif" title="[蛋糕]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/m_thumb.gif" title="[话筒]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/weijin_thumb.gif" title="[围脖]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/lxhzhuanfa_thumb.gif" title="[转发]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/lxhluguo_thumb.gif" title="[路过这儿]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/bofubianlian_thumb.gif" title="[bofu变脸]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/gbzkun_thumb.gif" title="[gbz困]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/boboshengmenqi_thumb.gif" title="[生闷气]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/chn_buyaoya_thumb.gif" title="[不要啊]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cat_yunqizhong_thumb.gif" title="[运气中]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/youqian_thumb.gif" title="[有钱]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/cf_thumb.gif" title="[冲锋]"></li>--%>
    <%--<li><img src="<%=basePath%>static/leaveimages/camera_thumb.gif" title="[照相机]"></li>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</div>--%>


    <%--畅言留言板块 开始--%>
    <div id="SOHUCS" sid="leaveMeMessages"></div>
    <%--畅言留言板块 结束--%>

</div>
<!--qq end-->
<div id="time1"></div>
<!--msgCon begin-->
<div class="msgCon">


</div>

<script type="text/javascript" src="../static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">

    //点击小图片，显示表情
    $(".bq").click(function (e) {
        $(".face").slideDown();//慢慢向下展开
        e.stopPropagation();   //阻止冒泡事件
    });

    //在桌面任意地方点击，他是关闭
    $(document).click(function () {
        $(".face").slideUp();//慢慢向上收
    });

    //点击小图标时，添加功能
    $(".face ul li").click(function () {
        var simg = $(this).find("img").clone();
        $(".message").append(simg);
    });

    //点击发表按扭，发表内容
    $("span.submit").click(function () {

        var txt = $(".message").val();
        // 前端非空校验
        if (txt == "") {
            $('.message').focus();//自动获取焦点
            return false;
        }
        $(".msgCon").prepend(txt);
    });

</script>

<!--畅言留言板js 开始-->
<script charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/changyan.js"></script>
<script type="text/javascript">
    window.changyan.api.config({
        appid: 'cytHPrhn6',
        conf: 'prod_fa7163096eae74a6b5f63eda7683f58f'
    });
</script>
<%--畅言留言板js 结束--%>

</body>
</html>

