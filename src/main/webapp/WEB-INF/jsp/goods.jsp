<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/19
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>单个商品</title>

    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>

    <style type="text/css">
        ul li{
            display:inline;
        }

        img.one{
            border: 1px solid black;
        }

        .goods_name {
            font: 700 16px Arial,"microsoft yahei";
            color: #666;
            padding-top: 10px;
            line-height: 28px;
            margin-bottom: 5px;
        }

        .tupian{
            float: left;
            padding-bottom: 15px;
        }

        .dt {
            float: left;
            padding-left: 10px;
            font-family: simsun;
            color: #999;
            line-height: 22px;
        }
        span {
            font-size: 16px;
        }
        .price {
            font-size: 22px;
        }
        .p-price {
            color: #E4393C;
            font-family: "microsoft yahei";
            margin-right: 5px;
        }

        .dd {
            margin-left: 70px;
            display:inline;
        }

        .choose-btns .btn-lg {
            margin-right: 10px;
            float: left;
        }
        .btn-lg {
            margin-right: 10px;
            float: left;
            height: 46px;
            line-height: 46px;
            padding: 0 26px;
            font-size: 18px;
            font-family: "microsoft yahei";
        }
        .btn-special1 {
            background-color: #df3033;
            color: #fff;
        }
        .clearfix:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        .pad {
            margin-top: 20px;
        }
    </style>

    <script type="text/javascript">
        $(function(){
            $("#seed").mouseover(function(){
                $("#change img").remove();
                var $pic=$("<img  src='../../img/2.jpg' width='450px' height='450px'/>");
                $pic.appendTo($("#change"));
            });
            $("#grow").mouseover(function(){
                $("#change img").remove();
                var $pic=$("<img  src='../../img/3.jpg' width='450px' height='450px'/>");
                $pic.appendTo($("#change"));
            });
            $("#bloom").mouseover(function(){
                $("#change img").remove();
                var $pic=$("<img  src='../../img/4.jpg' width='450px' height='450px'/>");
                $pic.appendTo($("#change"));
            });
            $("#fruit").mouseover(function(){
                $("#change img").remove();
                var $pic=$("<img  src='../../img/5.jpg' width='450px' height='450px'/>");
                $pic.appendTo($("#change"));
            });
            $("#harvest").mouseover(function(){
                $("#change img").remove();
            });
        });
    </script>

</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="preview" style="margin-left: 10%;margin-top: 40px;margin-right: 10%;">
    <div class="tupian" style="position:relative;">
        <div><img src="${goods.picture}" class="one" width="450px" height="450px" style="margin:20px ;vertical-align: middle;"/></div>
        <div id="change" style="position:absolute; left:18px; top:18px;border: 1px solid black;">
        </div>
        <div style="position:absolute; left:80px; top:500px; ">
            <ul style=" list-style:none;" >
                <li><img id="harvest" src="${goods.picture}" width="50" height="50"/></li>
                <li><img id="seed" src="../../img/2.jpg" width="50" height="50"/></li>
                <li><img id="grow" src="../../img/3.jpg" width="50" height="50"/></li>
                <li><img id="bloom" src="../../img/4.jpg" width="50" height="50"/></li>
                <li><img id="fruit" src="../../img/5.jpg" width="50" height="50"/></li>
            </ul>
        </div>
    </div>

    <div class="by_goods">

        <div class="goods_name" style="padding-top: 40px;padding-left: 20px;">
            ${goods.goodsName}
        </div>

        <div class="pad" style="margin-top: 40px;">
            <div class="dt">价&nbsp;&nbsp;&nbsp;格</div>
            <div class="dd">
			 <span class="p-price">
				 <span>￥</span>
				 <span class="price">${goods.price}</span>
			 </span>
            </div>
        </div>

        <div class="pad">
            <div class="dt">类&nbsp;&nbsp;&nbsp;型</div>
            <div class="dd"><span class="goods_name">${goods.type}</span></div>
        </div>

        <div class="pad">
            <div class="dt">品&nbsp;&nbsp;&nbsp;牌</div>
            <div class="dd"><span class="goods_name">${goods.brand}</span></div>
        </div>

        <div class="pad">
            <div class="dt">编&nbsp;&nbsp;&nbsp;号</div>
            <div class="dd"><span id="goodsId" class="goods_name">${goods.goodsId}</span></div>
        </div>

        <div class="pad">
            <label class="dt">数&nbsp;&nbsp;&nbsp;量&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <select id="buyCount" class="form-control" style="width: 60px;">
                <option value="1" selected="selected">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
        </div>

        <div id="choose-btns" class="choose-btns clearfix" style="margin-top: 50px;">
            <a href="#none" id="trolley" class="btn-special1 btn-lg btn-disable">加入购物车</a>
            <a href="#none" id="save" class="btn-special1 btn-lg btn-disable">添加收藏夹</a>

            <% if ( session.getAttribute("loginName") != null ) { %>
                <a href="#none" data-toggle="modal" data-target="#myPayModal" class="btn-special1 btn-lg btn-disable">立即购买</a>
                <script type="text/javascript">
                    $(function() {
                        $("#buyNow").click(function () {
                            $.post("/goods/buy",{goodsId:$("#goodsId").text(),userAccount:${loginAccount},buyCount:$("#buyCount option:selected").val()},function (data) {
                                alert("购买成功");
                            });
                        });
                    });
                </script>
            <% } else { %>
                <a href="#none" id="nologin" class="btn-special1 btn-lg btn-disable">立即购买</a>
            <% } %>

        </div>

        <%--添加收藏、添加购物车、立即购买--%>
        <script type="text/javascript">
            $(function () {
               $("#save").click(function () {
                        <%
                            if ( session.getAttribute("loginAccount") != null ) {
                        %>
                           $.post("/goods/save",{goodsId:$("#goodsId").text(),userAccount:${loginAccount}},function (data) {
                               alert("收藏成功");
                           });
                        <%
                            } else {
                        %>
                            alert("请先登录！");
                        <% } %>
               });

                $("#trolley").click(function () {
                    <%
                        if ( session.getAttribute("loginAccount") != null ) {
                    %>
                    $.post("/goods/trolley",{goodsId:$("#goodsId").text(),userAccount:${loginAccount}},function (data) {
                        alert("添加成功");
                    });
                    <%
                        } else {
                    %>
                    alert("请先登录！");
                    <% } %>
                });

                $("#nologin").click(function () {
                    alert("请先登录！");
                });

            });
        </script>
    </div>
</div>

<!-- 付款模态框（Modal） -->
<div class="modal fade" id="myPayModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left:15%;margin-top:3%;">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 350px;">
            <div class="modal-header" style="text-align: center;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    付款
                </h4>
            </div>

            <div class="modal-body">
                <img src="../../img/gcc.jpg" width="320" height="400">
            </div>

            <div class="modal-footer" style="text-align: center;">
                <button data-dismiss="modal" type="button" id="buyNow" class="btn btn-success">
                    已付款
                </button>
                <button data-dismiss="modal" type="button" class="btn btn-default">
                    取消
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
</html>
