<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/16
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>买家中心</title>

    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>
    <script type="text/javascript" src="../../js/num-alignment.js"></script>

    <style type="text/css">
        .table1 {
            margin-left: 5%;
            margin-right: 5%;
            width: 80%;
            text-align: center;
        }

        thead>tr>th {
            text-align: center;
        }

        tbody>tr {
            height: 200px;
        }

        .buttons {
            margin-left: 50%;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div id="tabs" style="margin: 30px;">

    <ul>
        <li><a href="#tabs-1">购物车</a></li>
        <li><a href="#tabs-2">收藏夹</a></li>
        <li><a href="#tabs-3">购买记录</a></li>
        <li><a href="#tabs-4">待收货</a></li>
    </ul>

    <script type="text/javascript">
        $(function() {
            $( "#tabs" ).tabs();
        });
    </script>

    <div id="tabs-1">
        <script type="text/javascript">

            //资源预加载
            postTab1();

            //全部下架点击事件
            $(function () {
                $("#buyNow").click(function () {
                    var goodsId = [];
                    var goodsCount = [];

                    $("#tab1Tr :checkbox:checked").each(function(){
                        goodsId.push($(this).parent().next().next().text());
                        goodsCount.push($(this).parent().next().next().next().next().next().children(".alignment").val());
                    });

                    var idString = goodsId.join("L");
                    var countString = goodsCount.join("L");
                    buyGoods(idString,countString);
                });
            });

            //获取tab1的数据
            function postTab1() {
                $.post("/buyer/searchTab1",{userAccount:${loginAccount}},function (data) {
                    $("#tab1Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        setTab1(obj['picture'],obj['goodsId'],obj['goodsName'],obj['price']);
                    }
                });
            }

            //
            function buyGoods(goodsId,goodsCount) {
                $.post("/buyer/buyGoods",{goodsId:goodsId,goodsCount:goodsCount,userAccount:${loginAccount}},function (data) {

                    if ( data == true ) {
                        alert("购买成功");
                        postTab1();
                    } else {
                        alert("请先选择商品");
                    }
                });
            }

            //删除tab1的商品
            function delGoodsFromTro(goodsId) {
                $.post("/buyer/delGoodsFromTro",{goodsId:goodsId},function (data) {

                    if ( data == true ) {
                        alert("确认收货成功");
                        alert("删除成功");
                        postTab1();
                    } else {
                        alert("请先选择商品");
                    }
                });
            }

            //动态添加tab1的tr
            function setTab1(picture,goodsId,goodsName,price) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td2 = $("<td><img src="+picture+" style='width: 150px;height: 150px;'></td>");
                $td3 = $("<td>"+goodsId+"</td>");
                $td4 = $("<td>"+goodsName+"</td>");
                $td5 = $("<td><strong>"+price+"</strong></td>");
                $td6 = $("<td><input class='alignment' data_edit='true' data_step='1' data_min='1' data_digit='0' value='1'/></td>");
                $but = $("<button class='btn btn-danger btn-sm'>删除</button>");
                $but.click(function() {
                    delGoodsFromTro(goodsId);
                });
                $td7 = $("<td></td>");
                $td7.append($but);

                $tr = $("<tr></tr>");
                $tr.append($td1);
                $tr.append($td2);
                $tr.append($td3);
                $tr.append($td4);
                $tr.append($td5);
                $tr.append($td6);
                $tr.append($td7);
                $tr.appendTo("#tab1Tr");
            }
        </script>
        <div>
            <table class="table1">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>商品图片</th>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>商品数量</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab1Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll1">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll1">取消</button>
                <button type="button" data-toggle="modal" data-target="#myPayModal" class="btn btn-danger">结算</button>
            </div>
        </div>

        <script type="text/javascript">
            $(function() {
                $("#selectAll1").click(function() {
                    $("#tabs-1 :checkbox").prop("checked",true);
                });

                $("#cancelAll1").click(function() {
                    $("#tabs-1 :checkbox").prop("checked",false);
                });
            });
        </script>
    </div>

    <div id="tabs-2">

        <script type="text/javascript">
            //资源预加载
            postTab2();

            //全部删除点击事件
            $(function () {
                $("#delAllFromFav").click(function () {
                    var goodsId = [];
                    $("#tab2Tr :checkbox:checked").each(function(){
                        goodsId.push($(this).parent().next().next().text());
                    });
                    var idString = goodsId.join("L");
                    delGoodsFromFav(idString);
                });
            });

            //全部删除点击事件
            $(function () {
                $("#addAllToTro").click(function () {
                    var goodsId = [];
                    $("#tab2Tr :checkbox:checked").each(function(){
                        goodsId.push($(this).parent().next().next().text());
                    });
                    var idString = goodsId.join("L");
                    addGoodsToTro(idString);
                });
            });

            //获取tab2的数据
            function postTab2() {
                $.post("/buyer/searchTab2",{userAccount:${loginAccount}},function (data) {
                    $("#tab2Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        setTab2(obj['picture'],obj['goodsId'],obj['goodsName'],obj['price']);
                    }
                });
            }

            //删除tab2的商品
            function delGoodsFromFav(goodsId) {
                $.post("/buyer/delGoodsFromFav",{goodsId:goodsId},function (data) {

                    if ( data == true ) {
                        alert("删除成功");
                        postTab2();
                    } else {
                        alert("请先选择商品");
                    }
                });
            }

            //添加到购物车
            function addGoodsToTro(goodsId) {
                $.post("/buyer/addGoodsToTro",{goodsId:goodsId,userAccount:${loginAccount}},function (data) {

                    if ( data == true ) {
                        alert("添加成功");
                        postTab2();
                        postTab1();
                    } else {
                        alert("请先选择商品");
                    }
                });
            }

            //动态添加tab2的tr
            function setTab2(picture,goodsId,goodsName,price) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td2 = $("<td><img src="+picture+" style='width: 150px;height: 150px;'></td>");
                $td3 = $("<td>"+goodsId+"</td>");
                $td4 = $("<td>"+goodsName+"</td>");
                $td5 = $("<td><strong>"+price+"</strong></td>");

                $but1 = $("<button class='btn btn-danger btn-sm'>添加到购物车</button>");
                $but1.click(function() {
                    addGoodsToTro(goodsId);
                });
                $but2 = $("<button class='btn btn-danger btn-sm'>删除</button>");
                $but2.click(function() {
                    delGoodsFromFav(goodsId);
                });
                $td7 = $("<td></td>");
                $td7.append($but1);
                $td7.append($but2);

                $tr = $("<tr></tr>");
                $tr.append($td1);
                $tr.append($td2);
                $tr.append($td3);
                $tr.append($td4);
                $tr.append($td5);
                $tr.append($td7);
                $tr.appendTo("#tab2Tr");
            }
        </script>

        <div>
            <table class="table1">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>商品图片</th>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab2Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll2">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll2">取消</button>
                <button type="button" id="addAllToTro" class="btn btn-danger btn-sm">添加到购物车</button>
                <button type="button" id="delAllFromFav" class="btn btn-danger">删除</button>
            </div>
        </div>

        <script type="text/javascript">
            $(function() {
                $("#selectAll2").click(function() {
                    $("#tabs-2 :checkbox").prop("checked",true);
                });

                $("#cancelAll2").click(function() {
                    $("#tabs-2 :checkbox").prop("checked",false);
                });
            });
        </script>
    </div>

    <div id="tabs-3">

        <script type="text/javascript">

            postTab3();

            //获取tab3的数据
            function postTab3() {
                $.post("/buyer/searchTab3",{userAccount:${loginAccount}},function (data) {
                    $("#tab3Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        var time = new Date(obj['orderTime']);
                        var str = time.getFullYear()+"-"+time.getMonth()+"-"+time.getDay();
                        setTab3(obj['picture'],obj['orderId'],obj['orderTime'],obj['price'],obj['goodsCounts'],str);
                    }
                });
            }

            //动态添加tab3的tr
            function setTab3(picture,orderId,goodsName,price,salesCount,saletime) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td8 = $("<td><img src="+picture+" style='width: 150px;height: 150px;'></td>");
                $td2 = $("<td>"+orderId+"</td>");
                $td3 = $("<td>"+goodsName+"</td>");
                $td4 = $("<td><strong>"+price+"</strong></td>");
                $td5 = $("<td>"+salesCount+"</td>");
                $td6 = $("<td>"+saletime+"</td>");
                $td7 = $("<td></td>");

                $but = $("<button class='btn btn-danger btn-sm'>删除</button>");
                $but.click(function() {
                    delGoodsFromRec(orderId);
                });
                $td7.append($but);

                $tr = $("<tr></tr>");
                $tr.append($td1);
                $tr.append($td8);
                $tr.append($td2);
                $tr.append($td3);
                $tr.append($td4);
                $tr.append($td5);
                $tr.append($td6);
                $tr.append($td7);
                $tr.appendTo("#tab3Tr");
            }

            $(function () {
                $("#delAllFromRec").click(function () {

                    var orderId = [];
                    $("#tab3Tr :checkbox:checked").each(function(){
                        orderId.push($(this).parent().next().next().text());
                    });

                    var arrayString=orderId.join("L");
                    delGoodsFromRec(arrayString);
                });
            });

            function delGoodsFromRec(orderId) {
                $.post("/buyer/delGoodsFromRec",{orderId:orderId},function (data) {

                    if ( data == true ) {
                        alert("删除成功");
                        postTab3();
                    } else {
                        alert("请先选择记录");
                    }
                });
            }

        </script>

        <div>
            <table class="table1">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>商品图片</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>商品金额</th>
                    <th>购买数量</th>
                    <th>购买日期</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab3Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll3">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll3">取消</button>
                <button type="button" id="delAllFromRec" class="btn btn-danger">删除</button>
            </div>
        </div>

        <script type="text/javascript">
            $(function() {
                $("#selectAll3").click(function() {
                    $("#tabs-3 :checkbox").prop("checked",true);
                });

                $("#cancelAll3").click(function() {
                    $("#tabs-3 :checkbox").prop("checked",false);
                });
            });
        </script>
    </div>

    <div id="tabs-4">

        <script type="text/javascript">

            postTab4();

            //获取tab4的数据
            function postTab4() {
                $.post("/buyer/searchTab4",{userAccount:${loginAccount}},function (data) {
                    $("#tab4Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        var time = new Date(obj['orderTime']);
                        var str = time.getFullYear()+"-"+time.getMonth()+"-"+time.getDay();
                        setTab4(obj['picture'],obj['orderId'],obj['orderTime'],obj['price'],obj['goodsCounts'],str);
                    }
                });
            }

            //动态添加tab4的tr
            function setTab4(picture,orderId,goodsName,price,salesCount,saletime) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td8 = $("<td><img src="+picture+" style='width: 150px;height: 150px;'></td>");
                $td2 = $("<td>"+orderId+"</td>");
                $td3 = $("<td>"+goodsName+"</td>");
                $td4 = $("<td><strong>"+price+"</strong></td>");
                $td5 = $("<td>"+salesCount+"</td>");
                $td6 = $("<td>"+saletime+"</td>");
                $td7 = $("<td></td>");

                $but = $("<button class='btn btn-danger btn-sm'>确认收货</button>");
                $but.click(function() {
                    ensureGoods(orderId);
                });
                $td7.append($but);

                $tr = $("<tr></tr>");
                $tr.append($td1);
                $tr.append($td8);
                $tr.append($td2);
                $tr.append($td3);
                $tr.append($td4);
                $tr.append($td5);
                $tr.append($td6);
                $tr.append($td7);
                $tr.appendTo("#tab4Tr");
            }
            
            function ensureGoods(orderId) {
                $.post("/buyer/ensureGoods",{orderId:orderId},function(data) {

                    if ( data == true ) {
                        alert("确认收货成功");
                        postTab4();
                        postTab3();
                    } else {
                        alert("请先选择商品");
                    }

                });
            }

            //全部发货点击事件
            $(function () {
                $("#ensureAll").click(function () {

                    var orderId = [];

                    $("#tab4Tr :checkbox:checked").each(function(){
                        orderId.push($(this).parent().next().text());
                    });

                    var arrayString = orderId.join("L");

                    ensureGoods(arrayString);
                });
            });
        </script>

        <div>
            <table class="table1">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>商品图片</th>
                    <th>商品编号</th>
                    <th>商品名称</th>
                    <th>商品金额</th>
                    <th>购买数量</th>
                    <th>购买日期</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab4Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll4">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll4">取消</button>
                <button type="button" id="ensureAll" class="btn btn-danger">确认收货</button>
            </div>
        </div>

        <script type="text/javascript">
            $(function() {
                $("#selectAll4").click(function() {
                    $("#tabs-4 :checkbox").prop("checked",true);
                });

                $("#cancelAll4").click(function() {
                    $("#tabs-4 :checkbox").prop("checked",false);
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
