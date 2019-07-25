<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/14
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.jspsmart.upload.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>分类</title>

    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>


    <style type="text/css">
        .classify {
            margin-left: 100px;
            margin-right: 100px;
            padding:50px;
            border-bottom: 2px solid #686363;
        }

        .feedback { font-size: 1.4em; }
        .feedback2 { font-size:1.2em; }
        .selectable .ui-selecting { background: #8F8D87; }
        .selectable .ui-selected { background: #363627; color: white; }

        .ui-widget-content { margin-left: 20px; }

        #menu li {
            float:left; /* 往左浮动 */
            line-height:30px; /* 设置行高，将行高和高度设置同一个值，可以让单行文本垂直居中 */
            width: 200px;
            height:400px;
        }

        #menu {
            font:12px verdana, arial, sans-serif; /* 设置文字大小和字体样式 */
        }

        #menu, #menu li {
            list-style:none; /* 将默认的列表符号去掉 */
            padding:0; /* 将默认的内边距去掉 */
            margin:0; /* 将默认的外边距去掉 */
            margin-right: 30px;
        }
    </style>

    <%
        response.setCharacterEncoding("utf-8");
    %>

    <script type="text/javascript">

        $(function() {

            mypost();

            $( "#selectable1" ).selectable({
                stop: function() {
                    var result = $( "#select-result1" ).empty();
                    var index = $("#selectable1 .ui-selected").text();
                    result.append( index );

                    mypost();
                }
            });

            $( "#selectable2" ).selectable({
                stop: function() {
                    var result = $( "#select-result2" ).empty();
                    var index = $("#selectable2 .ui-selected").text();
                    result.append( index );

                    mypost();
                }
            });

            $( "#selectable3" ).selectable({
                stop: function() {
                    var result = $( "#select-result3" ).empty();
                    var index = $("#selectable3 .ui-selected").text();
                    result.append( index );

                    mypost();
                }
            });
            
            function mypost() {
                $.post("/search/changeGoods",{select1:$("#select-result1").text()
                        ,select2:$("#select-result2").text()
                        ,select3:$("#select-result3").text()}
                    ,function (data2) {
                        $("#menu").empty();
                        for (var i = 0 ; i < data2.length ; i ++ ) {
                            var obj = data2[i];
                            insGoods(obj['picture'],obj['price'],obj['goodsName'],obj['goodsId'],obj['brand'],obj['salesCounts']);
                        }
                    });
            }

        });

        function setClick(goodsId) {
            $(function () {
                $("#hiddenId").val( goodsId );
                $("#showGoods").submit();
            });
        }

        function insGoods(pic,price,name,goodsId,brand,sales) {
            $(function() {
                var $myLi = $("<li></li>");
                var $myA = $("<a href='#' class='aaa'></a>");

                var $myimg = $("<span><img src='"+pic+"' style='width: 200px;height: 200px;'></span>");
                var $myPrice = $("<p><span style='color: red'>&yen;<strong>" +price+ "</strong></span><span>包邮</span></p>");
                var $myName = $("<div><p><span>"+name+"</span></p><span>编号：</span><span id='showGoodsId'>"+goodsId+"</span></div>")
                var $mySales = $("<p style='color: #a94442'><span>品牌："+brand+"</span>&nbsp;&nbsp;&nbsp;<span>"+sales+"人付款</span></p>")

                $myA.click(function () {
                    setClick(goodsId);
                });

                $myA.append($myimg);
                $myA.append($myPrice);
                $myA.append($myName);
                $myA.append($mySales);
                $myLi.append($myA);
                $myLi.appendTo("#menu");
            });
        }
    </script>

</head>
<body>

<jsp:include page="navbar.jsp"/>

<jsp:include page="search.jsp"/>

<!-- 商品分类 -->
<div class="classify">
    <p class="feedback" style="font-size: 2.4em;margin-left: 40%;margin-bottom: 50px;">
        <span>商品分类</span>
    </p>
    <div class="feedback">
        <span>您已经选择了：</span>
        <span id="select-result1" name="select1" class="label label-primary"></span>
        &nbsp;&nbsp;<span id="select-result2" name="select2" class="label label-primary"></span>
        &nbsp;&nbsp;<span id="select-result3" name="select3" class="label label-primary"></span>
    </div>

    <div style="padding-top: 30px;">
        <ol id="selectable1" class="selectable">
            <span class="feedback2">类型：</span>
            <li class="ui-widget-content btn" style="margin-left: 60px;">笔记本</li>
            <li class="ui-widget-content btn">手机</li>
            <li class="ui-widget-content btn">外设</li>
            <li class="ui-widget-content btn">平板</li>
            <li class="ui-widget-content btn">配件</li>
            <li class="ui-widget-content btn">其他</li>
        </ol>
        <ol id="selectable2" class="selectable" style="padding-top: 15px;">
            <span class="feedback2">品牌：</span>
            <li class="ui-widget-content btn" style="margin-left: 60px;">华为</li>
            <li class ="ui-widget-content btn">小米</li>
            <li class="ui-widget-content btn">乐视</li>
            <li class="ui-widget-content btn">魅族</li>
            <li class="ui-widget-content btn">苹果</li>
            <li class="ui-widget-content btn">oppo</li>
            <li class="ui-widget-content btn">三星</li>
            <li class="ui-widget-content btn">华硕</li>
            <li class="ui-widget-content btn">Intel</li>
            <li class="ui-widget-content btn">其他</li>
        </ol>
        <ol id="selectable3" class="selectable" style="padding-top: 15px;">
            <span class="feedback2">价格区间：</span>
            <li class="ui-widget-content btn">0~499</li>
            <li class="ui-widget-content btn">500~999</li>
            <li class="ui-widget-content btn">1000~1999</li>
            <li class="ui-widget-content btn">2000~2999</li>
            <li class="ui-widget-content btn">3000~3999</li>
            <li class="ui-widget-content btn">4000以上</li>
        </ol>
    </div>
</div>

<form id="showGoods" action="/goods/show">
    <input type="hidden" id="hiddenId" name="hiddenGoodsId">
</form>

<div class="panel-default" style="padding-left: 15%;padding-right: 10%">
    <div class="page-header">
        <h1 class="panel-title">商品展示</h1>
    </div>

    <div id="ItemWrapper" >
        <ul id="menu" style="display: inline-block;">

        </ul>
    </div>
</div>


<!--分页bookstrap-->
<ul class="pagination" style="padding-left: 40%">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>

</body>
</html>
