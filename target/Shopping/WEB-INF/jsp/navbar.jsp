<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/12
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>123</title>
    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>

    <style type="text/css">

        /*导航栏边距*/
        .navbar-inverse div{
            float: right;
            padding-right: 20%;
        }

        /*对齐表单*/
        .fa {
            width: 1.2rem;
            font-size: 1.2rem;
            color: #505B7B;
        }

        .ui-menu {
            width: 150px;
        }

        .form-group {
            padding-left: 50px;
            padding-bottom: 25px;
            position:relative;
        }

        #myModal2 .form-control {
            margin-left: 50px;
        }

        .fa-times {
            color: red;
            font-size: 20px;
        }

        .fa-check {
            color: green;
            font-size: 20px;
        }

    </style>
</head>
<body>

<!-- 导航栏 -->
<div class="navbar navbar-inverse">
    <div>
        <!-- 基础导航条-->
        <ul class="nav navbar-nav">
            <li><a href="/homepage">商城首页</a></li>
            <li><a href=" <% if(session.getAttribute("loginName")!=null){ %> /seller/center <% } %> ">卖家中心</a></li>
            <li><a href=" <% if(session.getAttribute("loginName")!=null){ %> /buyer/center <% } %> ">购买记录</a></li>
            <li><a href=" <% if(session.getAttribute("loginName")!=null){ %> /buyer/center <% } %> ">收藏的宝贝</a></li>
            <li><a href=" <% if(session.getAttribute("loginName")!=null){ %> /buyer/center <% } %> ">购物车</a></li>

            <% if ( session.getAttribute("loginName") != null ) { %>
            <li data-toggle="modal" data-target="#myModal4"><a href="##"><%= session.getAttribute("loginName") %></a></li>
            <% } else { %>
            <li data-toggle="modal" data-target="#myModal"><a id="loginText" href="##">登录</a></li>
            <% } %>

        </ul>
    </div>
</div>


<!-- 登录模态框（Modal） -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left:20%;margin-top:15%;">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 300px;">

            <div class="modal-header" style="text-align: center;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    提示
                </h4>
            </div>

            <div class="modal-body" style="text-align: center;">
                <h2>请确认退出</h2>
                <form id="logoutForm" action="/navbar/logout"></form>
            </div>

            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-success" id="logout">
                    退出
                </button>
                <button data-dismiss="modal" type="button" class="btn btn-default">
                    取消
                </button>

                <script type="text/javascript">
                    $(function () {
                        $("#logout").click(function () {
                            $("#logoutForm").submit();
                        });
                    });
                </script>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 登录模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left:20%;margin-top:15%;">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 300px;">

            <div class="modal-header" style="text-align: center;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    登录
                </h4>
            </div>

            <div class="modal-body">

                <form class="form-inline" role="form" id="form1" action="/navbar/login" style="text-align: center;">

                    <div class="input-group" style="padding-bottom: 5px;">
                        <div class="input-group-addon">
                            <i class="fa fa-user"></i>
                        </div>
                        <input type="text" class="form-control" name="username" id="username" placeholder="Username" autocomplete="off" />
                    </div>

                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-key"></i>
                        </div>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" autocomplete="off" />
                    </div>
                </form>

            </div>

            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-success" id="submit1">
                    登录
                </button>
                <button data-toggle="modal" data-dismiss="modal" data-target="#myModal2" type="button" class="btn btn-default">
                    注册
                </button>
            </div>

            <script type="text/javascript">
                $(document).ready(function(){
                    $("#submit1").click( function () {
                        $.post("/navbar/verification",{userName:$("#username").val(),password:$("#password").val()},function (data) {
                            if ( data == true ) {
                                $("#form1").submit();
                            } else {
                                alert("用户名/密码错误！");
                            }
                        });
                    });
                });
            </script>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!-- 注册模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left:6%;">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 500px; height: 620px;">

            <div class="modal-header" style="text-align: center;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h3 class="modal-title">
                    注册
                </h3>
            </div>

            <div class="modal-body" style="font-size:17px;">
                <form class="form-inline" id="form2" action="/navbar/register">
                    <div class="form-group">
                        <label for="name">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</label>
                        <input id="name" name="name" type="text" class="form-control" onblur="chekname()" placeholder="请输入您的姓名">
                        <span id="spname"></span>
                    </div><br>
                    <div class="form-group">
                        <label for="nickname">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
                        <input type="text" name="nickname" id="nickname" onblur="cheknickname()" class="form-control" placeholder="请输入您的昵称">
                        <span id="spnicname"></span>
                    </div><br>
                    <div class="form-group">
                        <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                        <div id="radio" style="margin-left: 50px;font-size: 14px;">
                            <input type="radio" id="radio1" name="sex" value="男" checked="checked"><label for="radio1" style="color: #655D5D;">男</label>
                            <input type="radio" id="radio2" name="sex" value="女"><label for="radio2" style="color: #655D5D;">女</label>
                        </div>
                        <%--切换按钮--%>
                        <script type="text/javascript">
                            $(function() {
                                $("#radio").buttonset();
                            });
                        </script>
                    </div>
                    <div class="form-group">
                        <label for="tel">手&nbsp;&nbsp;机&nbsp;&nbsp;号:</label>
                        <input type="text" id="tel" name="tel" onblur="chektel()" class="form-control" placeholder="请输入您的手机号">
                        <span id="sptel"></span>
                    </div><br>
                    <div class="form-group">
                        <label for="identity_id">身份证号:</label>
                        <input type="text" name="identityId" id="identity_id" onblur="chekidentity()" class="form-control" placeholder="请输入您的身份证号">
                        <span id="spidentity"></span>
                    </div><br>
                    <div class="form-group">
                        <label for="password1">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
                        <input type="password" name="userPassword" id="password1" onchange="chekconfirmpassword()" class="form-control" placeholder="请输入您的密码">
                        <span id="sppassword"></span>
                    </div><br>
                    <div class="form-group">
                        <label for="confirmpassword">确认密码:</label>
                        <input type="password" class="form-control" onblur="chekpassword()" onchange="chekconfirmpassword()" id="confirmpassword" placeholder="请输入您的密码">
                        <span id="spconfirmpassword"></span>
                    </div><br>
                    <div class="form-group" style="padding-bottom: 0;">
                        <label for="address">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
                        <input type="text" id="address" name="address" onblur="chekaddress()" class="form-control" placeholder="请输入您的地址">
                        <span id="spaddress"></span>
                    </div><br>
                </form>
            </div>

            <div class="modal-footer" style="text-align: center;height: 50px;">
                <button type="button" class="btn btn-success" id="submit2">
                    提交
                </button>
                <button type="button" class="btn btn-default" id="reset2">
                    清空
                </button>
            </div>

            <script type="text/javascript">
                $(document).ready(function(){
                    $("#submit2").click( function () {
                        if ( chekname() && cheknickname() && chektel() && chekidentity()
                            && chekpassword() && chekconfirmpassword() && chekaddress() ) {

                            $.post("/navbar/verificationUser",$("#form2").serializeArray(),function (data) {
                                if ( data == true ) {
                                    $("#form2").submit();
                                } else {
                                    alert("手机号已存在");
                                }
                            });
                        }

                    });
                });
            </script>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    function chekname(){
        if(document.getElementById("name").value==""){
            document.getElementById("spname").innerHTML='<i class="fa fa-times"></i>';
            return false;
        }
        document.getElementById("spname").innerHTML='<i class="fa fa-check"></i>';
        return true;
    }
    function cheknickname(){
        if(document.getElementById("nickname").value==""){
            document.getElementById("spnicname").innerHTML='<i class="fa fa-times"></i>';
            return false;
        }
        document.getElementById("spnicname").innerHTML='<i class="fa fa-check"></i>';
        return true;
    }
    function chektel(){
        var _d = /^1[3578][01379]\d{8}$/g;
        var _l = /^1[34578][01256]\d{8}$/g;
        var _y = /^(134[012345678]\d{7}|1[34578][012356789]\d{8})$/g;
        var tel=document.getElementById("tel").value;
        if (_d.test(tel)) {
            document.getElementById("sptel").innerHTML='<i class="fa fa-check"></i>';
            return true;
        } else if (_l.test(tel)) {
            document.getElementById("sptel").innerHTML='<i class="fa fa-check"></i>';
            return true;
        } else if (_y.test(tel)) {
            document.getElementById("sptel").innerHTML='<i class="fa fa-check"></i>';
            return true;
        }
        document.getElementById("sptel").innerHTML='<i class="fa fa-times"></i>';
        return false;
    }

    function chekidentity(){
        var identityreg= /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        var identity=document.getElementById("identity_id").value;
        if(!identityreg.test(identity)) {
            document.getElementById("spidentity").innerHTML='<i class="fa fa-times"></i>';
            return false;
        }
        document.getElementById("spidentity").innerHTML='<i class="fa fa-check"></i>';
        return true;
    }
    function chekpassword(){
        if(document.getElementById("password1").value==""){
            document.getElementById("sppassword").innerHTML='<i class="fa fa-times"></i>';
            return false;
        }
        document.getElementById("sppassword").innerHTML='<i class="fa fa-check"></i>';
        return true;
    }

    function chekconfirmpassword(){
        if(document.getElementById("password1").value == document.getElementById("confirmpassword").value) {
            document.getElementById("spconfirmpassword").innerHTML='<i class="fa fa-check"></i>';
            return true;
        }
        document.getElementById("spconfirmpassword").innerHTML='<i class="fa fa-times"></i>';
        return false;
    }
    function chekaddress(){
        if(document.getElementById("address").value==""){
            document.getElementById("spaddress").innerHTML='<i class="fa fa-times"></i>';
            return false;
        }
        document.getElementById("spaddress").innerHTML='<i class="fa fa-check"></i>';
        return true;
    }
</script>

</body>
</html>
