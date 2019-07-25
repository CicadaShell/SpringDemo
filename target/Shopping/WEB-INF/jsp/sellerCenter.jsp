
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/16
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.jspsmart.upload.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>卖家中心</title>

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

        .form-group {
            padding-left: 50px;
            padding-bottom: 25px;
            position:relative;
        }

        #myModal3 .form-control {
            margin-left: 50px;
        }

        .table1 {
            margin-left: 5%;
            margin-right: 5%;
            width: 80%;
            text-align: center;
        }

        thead>tr>th {
            text-align: center;
        }

        #tabs-1 tbody>tr {
            height: 180px;
        }

        tbody>tr {
            height: 120px;
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
        <li><a href="#tabs-1">已上架</a></li>
        <li><a href="#tabs-2">已卖出</a></li>
        <li><a href="#tabs-3">待发货</a></li>
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
                $("#pullAllGoods").click(function () {

                    var goodsId = [];

                    $("#tab1Tr :checkbox:checked").each(function(){
                        goodsId.push($(this).parent().next().next().text());
                    });

                    var arrayString=goodsId.join("L");
                    pullGoods(arrayString);
                });
            });

            //获取tab1的数据
            function postTab1() {
               $.post("/seller/searchTab1",{userAccount:${loginAccount}},function (data) {
                   $("#tab1Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        setTab1(obj['picture'],obj['goodsId'],obj['goodsName'],obj['price'],obj['salesCounts']);
                    }
               });
            }

            //删除tab1的商品
            function pullGoods(goodsId) {
                $.post("/seller/pullGoods",{goodsId:goodsId},function (data) {

                    if ( data == true ) {
                        alert("删除成功");
                        postTab1();
                    } else {
                        alert("请先选择商品");
                    }

                });
            }

            //动态添加tab1的tr
            function setTab1(picture,goodsId,goodsName,price,salesCount) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td2 = $("<td><img src="+picture+" style='width: 150px;height: 150px;'></td>");
                $td3 = $("<td>"+goodsId+"</td>");
                $td4 = $("<td>"+goodsName+"</td>");
                $td5 = $("<td><strong>"+price+"</strong></td>");
                $td6 = $("<td>"+salesCount+"</td>");
                $but = $("<button class='btn btn-danger btn-sm'>下架</button>");
                $but.click(function() {
                    pullGoods(goodsId)
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
                    <th>商品金额</th>
                    <th>商品销量</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab1Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll1">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll1">取消</button>
                <button type="button" id="pullAllGoods" class="btn btn-danger">下架</button>
                <button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal3" style="margin-left: 120px;">上架商品</button>
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

            postTab2();

            //获取tab2的数据
            function postTab2() {
                $.post("/seller/searchTab2",{userAccount:${loginAccount}},function (data) {

                    $("#tab2Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        var time = new Date(obj['orderTime']);
                        var str = time.getFullYear()+"-"+time.getMonth()+"-"+time.getDay();
                        setTab2(obj['orderId'],obj['goodsName'],obj['price'],obj['goodsCounts'],str,obj['buyName'],obj['address']);
                    }
                });
            }

            //动态添加tab2的tr
            function setTab2(orderId,goodsName,price,salesCount,saletime,buyName,buyAddress) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td2 = $("<td>"+orderId+"</td>");
                $td3 = $("<td>"+goodsName+"</td>");
                $td4 = $("<td><strong>"+price+"</strong></td>");
                $td5 = $("<td>"+salesCount+"</td>");
                $td6 = $("<td>"+saletime+"</td>");
                $td7 = $("<td>"+buyName+"</td>");
                $td8 = $("<td>"+buyAddress+"</td>");
                $td9 = $("<td></td>");

                $but = $("<button class='btn btn-danger btn-sm'>删除</button>");
                $but.click(function() {
                    delRecord(orderId);
                });
                $td9.append($but);

                $tr = $("<tr></tr>");
                $tr.append($td1);
                $tr.append($td2);
                $tr.append($td3);
                $tr.append($td4);
                $tr.append($td5);
                $tr.append($td6);
                $tr.append($td7);
                $tr.append($td8);
                $tr.append($td9);
                $tr.appendTo("#tab2Tr");
            }

            //删除tab2的记录
            function delRecord(orderId) {

                $.post("/seller/delRecord",{orderId:orderId},function (data) {

                    if ( data == true ) {
                        alert("删除成功");
                        postTab2();
                    } else {
                        alert("请先选择商品");
                    }

                });
            }

            //全部删除点击事件
            $(function () {
                $("#delAllRecord").click(function () {

                    var orderId = [];

                    $("#tab2Tr :checkbox:checked").each(function(){
                        orderId.push($(this).parent().next().text());
                    });

                    var arrayString=orderId.join("L");
                    delRecord(arrayString);
                });
            });

        </script>

        <div>
            <table class="table1">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>商品金额</th>
                    <th>卖出数量</th>
                    <th>购买日期</th>
                    <th>买家姓名</th>
                    <th>买家地址</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab2Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll2">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll2">取消</button>
                <button type="button" id="delAllRecord" class="btn btn-danger">删除</button>
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
                $.post("/seller/searchTab3",{userAccount:${loginAccount}},function (data) {

                    $("#tab3Tr").empty();
                    for ( var i = 0 ; i < data.length ; i ++ ) {
                        var obj = data[i];
                        var time = new Date(obj['orderTime']);
                        var str = time.getFullYear()+"-"+time.getMonth()+"-"+time.getDay();
                        setTab3(obj['orderId'],obj['goodsName'],obj['price'],obj['goodsCounts'],str,obj['buyName'],obj['address']);
                    }
                });
            }

            //动态添加tab2的tr
            function setTab3(orderId,goodsName,price,salesCount,saletime,buyName,buyAddress) {
                $td1 = $("<td><input type='checkbox'/></td>");
                $td2 = $("<td>"+orderId+"</td>");
                $td3 = $("<td>"+goodsName+"</td>");
                $td4 = $("<td><strong>"+price+"</strong></td>");
                $td5 = $("<td>"+salesCount+"</td>");
                $td6 = $("<td>"+saletime+"</td>");
                $td7 = $("<td>"+buyName+"</td>");
                $td8 = $("<td>"+buyAddress+"</td>");
                $td9 = $("<td></td>");

                $but = $("<button class='btn btn-danger btn-sm'>发货</button>");
                $but.click(function() {
                    sendGoods(orderId);
                });
                $td9.append($but);

                $tr = $("<tr></tr>");
                $tr.append($td1);
                $tr.append($td2);
                $tr.append($td3);
                $tr.append($td4);
                $tr.append($td5);
                $tr.append($td6);
                $tr.append($td7);
                $tr.append($td8);
                $tr.append($td9);
                $tr.appendTo("#tab3Tr");
            }

            //发货
            function sendGoods(orderId) {
                $.post("/seller/sendGoods",{orderId:orderId},function (data) {

                    if ( data == true ) {
                        alert("发货成功");
                        postTab3();
                        postTab2();
                    } else {
                        alert("请先选择商品");
                    }
                });
            }

            //全部发货点击事件
            $(function () {
                $("#sendAllGoods").click(function () {

                    var orderId = [];

                    $("#tab3Tr :checkbox:checked").each(function(){
                        orderId.push($(this).parent().next().text());
                    });

                    var arrayString=orderId.join("L");
                    sendGoods(arrayString);
                });
            });
        </script>
        <div>
            <table class="table1">
                <thead>
                <tr>
                    <th>选择</th>
                    <th>订单编号</th>
                    <th>商品名称</th>
                    <th>商品金额</th>
                    <th>卖出数量</th>
                    <th>购买日期</th>
                    <th>买家姓名</th>
                    <th>买家地址</th>
                    <th>编辑</th>
                </tr>
                </thead>
                <tbody id="tab3Tr">
                </tbody>
            </table>

            <div class="buttons">
                <button type="button" class="btn btn-danger" id="selectAll3">全选</button>
                <button type="button" class="btn btn-danger" id="cancelAll3">取消</button>
                <button type="button" id="sendAllGoods" class="btn btn-danger">发货</button>
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
</div>

<!-- 上架商品模态框（Modal） -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="margin-left:6%;">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 500px; height: 500px;">

            <div class="modal-header" style="text-align: center;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h3 class="modal-title" id="myModalLabel">
                    上架商品
                </h3>
            </div>

            <div class="modal-body" style="font-size:17px;">
                <form class="form-inline" id="goodsForm" action="/seller/add" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="goodsname">名称：</label>
                        <input id="goodsname" type="text" name="goodsName" class="form-control" onblur="checkname()" placeholder="请输入商品名称">
                        <span id="spgoodsname"></span>
                    </div><br>
                    <div class="form-group">
                        <label>品牌：</label>
                        <select id="brand" name="brand" class="form-control">
                            <option value="华为">华为</option>
                            <option value="小米">小米</option>
                            <option value="乐视">乐视</option>
                            <option value="魅族">魅族</option>
                            <option value="oppo">oppo</option>
                            <option value="Intel">Intel</option>
                            <option value="华硕">华硕</option>
                            <option value="三星">三星</option>
                            <option value="苹果">苹果</option>
                            <option value="联想">联想</option>
                            <option value="其他" selected = "selected">其他</option>
                        </select>
                    </div><br>
                    <div class="form-group">
                        <label for="price">价格：</label>
                        <input id="price" type="text" name="price" class="form-control" onblur="checkprice()" placeholder="请输入商品价格" >
                        <span id="spprice"></span>
                    </div><br>
                    <div class="form-group">
                        <label>分类：</label>
                        <select id="type" name="type" class="form-control">
                            <option value="笔记本">笔记本</option>
                            <option value="手机">手机</option>
                            <option value="外设">外设</option>
                            <option value="平板">平板</option>
                            <option value="配件">配件</option>
                            <option  value="其他" selected = "selected">其他</option>
                        </select>
                    </div><br>
                    <div class="form-group">
                        <label>图片：</label>
                        <input type="file" accept=".jpg" name="pic" id="inputfile" onblur="checkfiletype()" class="form-control" style="width: 200px;">
                        <span id="spinputfile"></span>
                    </div><br>
                </form>
            </div>

            <div class="modal-footer" style="text-align: center;height: 50px;">
                <button type="button" class="btn btn-success" id="goodsSubmit">
                    提交
                </button>
                <button type="button" class="btn btn-default">
                    清空
                </button>
            </div>

            <script type="text/javascript">
                $(document).ready(function(){
                    $("#goodsSubmit").click( function () {
                        if ( checkname() && checkprice() && checkfiletype() ) {
                            $("#goodsForm").submit();
                        }
                    });
                });
            </script>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript">
    function checkname(){
        var name = document.getElementById("goodsname").value;
        if( name == "" ){
            document.getElementById("spgoodsname").innerHTML='<i class="fa fa-times" style="color:red;"></i>';
            return false;
        }
        document.getElementById("spgoodsname").innerHTML='<i class="fa fa-check" style="color:green;"></i>';
        return true;
    }

    function checkprice(){
        var shuzi=/^(([1-9]+)|([0-9]+\.[0-9]{1,2}))$/;
        var price=document.getElementById("price").value;
        if(!shuzi.test(price)){
            document.getElementById("spprice").innerHTML='<i class="fa fa-times" style="color:red;"></i>';
            return false;
        }
        document.getElementById("spprice").innerHTML='<i class="fa fa-check" style="color:green;"></i>';
        return true;
    }

    function checkfiletype(){

        var fileName = document.getElementById("inputfile").value;

        if(fileName==""){
            document.getElementById("spinputfile").innerHTML='<i class="fa fa-times" style="color:red;"></i>';
            return false;
        }

        if(fileName.lastIndexOf(".") != -1) {
            var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
            if( fileType == "jpg" ){
                document.getElementById("spinputfile").innerHTML='<i class="fa fa-check" style="color:green;"></i>';
                return true ;
            }
            document.getElementById("spinputfile").innerHTML='<i class="fa fa-times" style="color:red;"></i>';
            return false;
        }
        return false;
    }
</script>

</body>
</html>
