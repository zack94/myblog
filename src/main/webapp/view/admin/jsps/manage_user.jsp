<%--
  Created by IntelliJ IDEA.
  /**
 * FileName:manage_user
 * Description:
 * Author:Zack
 * Date:2018/6/11
 * Time:16:37
 */  
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<body class="user-select">
<jsp:include page="banner.jsp"/>
<jsp:include page="left_Navigation_bar.jsp"/>
<section class="container-fluid">
    <div class="row">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
            <h1 class="page-header">用户管理</h1>
            <h1 class="page-header">管理</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">ID</span></th>
                        <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户名</span></th>
                        <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">姓名</span></th>
                        <th><span class="glyphicon glyphicon-pushpin"></span> <span class="visible-lg">文章</span></th>
                        <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">上次登录时间</span></th>
                        <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>edit</td>
                        <td>编辑</td>
                        <td>4</td>
                        <td>2015-12-03 15:14:27</td>
                        <td><a rel="1" name="see">修改</a> <a rel="1" name="delete">删除</a> <a
                                href="">禁用</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>test</td>
                        <td>测试</td>
                        <td>3</td>
                        <td>2015-12-03 15:14:27</td>
                        <td><a rel="2" name="see">修改</a> <a rel="2" name="delete">删除</a> <a
                                href="#">启用</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/admin-scripts.js"></script>
<script>
    $(function () {
        $("#main table tbody tr td a").click(function () {
            var name = $(this);
            var id = name.attr("rel"); //对应id
            if (name.attr("name") === "see") {
                $.ajax({
                    type: "POST",
                    url: "/User/see",
                    data: "id=" + id,
                    cache: false, //不缓存此页面
                    success: function (data) {
                        var data = JSON.parse(data);
                        $('#truename').val(data.truename);
                        $('#username').val(data.username);
                        $('#usertel').val(data.usertel);
                        $('#userid').val(data.userid);
                        $('#seeUser').modal('show');
                    }
                });
            } else if (name.attr("name") === "delete") {
                if (window.confirm("此操作不可逆，是否确认？")) {
                    $.ajax({
                        type: "POST",
                        url: "/User/delete",
                        data: "id=" + id,
                        cache: false, //不缓存此页面
                        success: function (data) {
                            window.location.reload();
                        }
                    });
                }
                ;
            }
            ;
        });
    });
</script>
</body>
</html>