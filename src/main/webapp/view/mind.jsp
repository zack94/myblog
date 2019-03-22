<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/10
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--倒c标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--使得页面能够识别c标签--%>
<%@ page isELIgnored="false" %>
<%--导入格式标签--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<jsp:include page="headFile.jsp"/>

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
    <div class="container">
        <ul class="cbp_tmtimeline">
            <c:forEach items="${requestScope.mindList}" var="mind">
                <li>
                    <time class="cbp_tmtime"><span><fmt:formatDate value="${mind.mind_date}" pattern="dd-MM"/></span>
                        <span><fmt:formatDate value="${mind.mind_date}" pattern="yyyy"/> </span>
                    </time>
                    <div class="cbp_tmicon"></div>
                    <div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">
                        <%--<h2>标题</h2>--%>
                        <p><span class="blogpic">
                        <a href=""><img src="<%=basePath%>mindPicture/${mind.mind_picture}"></a></span>
                            <%--0表示公开--%>
                            <c:if test="${mind.mind_look==0}">
                                ${mind.mind_content}
                            </c:if>
                            <c:if test="${mind.mind_look==1}">
                                抱歉，这属于博主的个人隐私内容，您不能浏览！
                            </c:if>
                        </p>
                        <a href="" target="_blank" class="readmore">点击阅读&gt;&gt;</a>
                    </div>
                </li>
            </c:forEach>
            <%--<li>--%>
            <%--<time class="cbp_tmtime"><span>08-08</span> <span>2017</span></time>--%>
            <%--<div class="cbp_tmicon"></div>--%>
            <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">--%>
            <%--<h2>标题</h2>--%>
            <%--<p><span class="blogpic"><a href=""><img src="../static/images/s1.jpg"></a></span>想要说的话的简介。。。。。。--%>
            <%--</p>--%>
            <%--<a href="" target="_blank" class="readmore">点击阅读&gt;&gt;</a>--%>
            <%--</div>--%>
            <%--</li>--%>

            <%--<li>--%>
            <%--<time class="cbp_tmtime"><span>08-08</span> <span>2017</span></time>--%>
            <%--<div class="cbp_tmicon"></div>--%>
            <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">--%>
            <%--<h2>标题</h2>--%>
            <%--<p><span class="blogpic"><a href=""><img src="../static/images/s1.jpg"></a></span>想要说的话的简介。。。。。。--%>
            <%--</p>--%>
            <%--<a href="" target="_blank" class="readmore">点击阅读&gt;&gt;</a>--%>
            <%--</div>--%>
            <%--</li>--%>

            <%--<li>--%>
            <%--<time class="cbp_tmtime"><span>08-08</span> <span>2017</span></time>--%>
            <%--<div class="cbp_tmicon"></div>--%>
            <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">--%>
            <%--<h2>标题</h2>--%>
            <%--<p><span class="blogpic"><a href=""><img src="../static/images/s1.jpg"></a></span>想要说的话的简介。。。。。。--%>
            <%--</p>--%>
            <%--<a href="" target="_blank" class="readmore">点击阅读&gt;&gt;</a>--%>
            <%--</div>--%>
            <%--</li>--%>

            <%--<li>--%>
            <%--<time class="cbp_tmtime"><span>08-08</span> <span>2017</span></time>--%>
            <%--<div class="cbp_tmicon"></div>--%>
            <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">--%>
            <%--<h2>标题</h2>--%>
            <%--<p><span class="blogpic"><a href=""><img src="../static/images/s1.jpg"></a></span>想要说的话的简介。。。。。。--%>
            <%--</p>--%>
            <%--<a href="" target="_blank" class="readmore">点击阅读&gt;&gt;</a>--%>
            <%--</div>--%>
            <%--</li>--%>

            <%--<li>--%>
            <%--<time class="cbp_tmtime"><span>08-08</span> <span>2017</span></time>--%>
            <%--<div class="cbp_tmicon"></div>--%>
            <%--<div class="cbp_tmlabel" data-scroll-reveal="enter right over 1s">--%>
            <%--<h2>标题</h2>--%>
            <%--<p><span class="blogpic"><a href=""><img src="../static/images/s1.jpg"></a></span>想要说的话的简介。。。。。。--%>
            <%--</p>--%>
            <%--<a href="" target="_blank" class="readmore">点击阅读&gt;&gt;</a>--%>
            <%--</div>--%>
            <%--</li>--%>

        </ul>
    </div>
</article>

<script>
    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
        (function () {
            window.scrollReveal = new scrollReveal({reset: true});
        })();
    }
    ;
</script>
<footer>
        <span>Design By <a href="<c:url value='/view/aboutme.jsp'/>"
                           style="color: #349075;">任志洪</a> 蜀ICP备18020072号</span>
</footer>
</body>
</html>
