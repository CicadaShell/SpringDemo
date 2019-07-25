<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/12
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>

    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <link href="../../css/bootstrap-table.css" rel="stylesheet">

    <script src="../../js/bootstrap-table.js"></script>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>
</head>
<body>

<jsp:include page="navbar.jsp"/>
<link href="../../css/bootstrap-table.css">
<script src="../../js/bootstrap-table.js"></script>

<div id="tabs" style="margin: 30px;">

    <%--标签页切换--%>
    <script type="text/javascript">
        $(function() {
            $( "#tabs" ).tabs();

        });
    </script>

    <%--用户管理js--%>
    <script type="text/javascript">
        $(function() {
            $("#searchUser").click(function () {
                $.ajax(
                    {
                        type:"POST",
                        url:"/admin/searchUser",
                        data:{key:$("#UserKey").val()},
                        success:function(json){
                            $("#table1").bootstrapTable(
                                'load',json
                            );
                        },
                        error:function(){
                            alert("错误");
                        }
                    })
            });

            $("#removeUser").click(function(){
                var array=[];
                $("tbody input[type='checkbox']").each(function(){
                    if($(this).prop("checked")){
                        array.push($(this).parent().next().text());
                    }
                });
                var arrayString=array.join("-");
                $.ajax(
                    {
                        type:"POST",
                        url:"/admin/deleteUser",
                        data:{deleteArray:arrayString},
                        success:function(json){
                            $("#table1").bootstrapTable(
                                'load',json
                            );
                        },
                        error:function(){
                            alert("错误");
                        }
                    })
            });

        });

    </script>
    <%--商品管理js--%>
    <script type="text/javascript">
        $(function() {
            $("#searchGoods").click(function () {
                $.ajax(
                    {
                        type:"POST",
                        url:"/admin/searchGoods",
                        data:{key:$("#goodsKey").val()},
                        success:function(json){
                            $("#table2").bootstrapTable(
                                'load',json
                            );
                        },
                        error:function(){
                            alert("错误");
                        }
                    })
            });

            $("#removeGoods").click(function(){
                var array = [];
                $(" tbody input[type='checkbox']").each(function(){
                    if($(this).prop("checked")){
                        array.push($(this).parent().next().text());
                    }
                });
                var arrayString=array.join("-");
                $.ajax(
                    {
                        type:"POST",
                        url:"/admin/deleteGoods",
                        data:{deleteArray:arrayString},
                        success:function(json){
                            $("#table2").bootstrapTable(
                                'load',json
                            );
                        },
                        error:function(){
                            alert("错误");
                        }
                    })

            });

        });

    </script>

    <%--订单管理js--%>
    <script>
            $(function() {
                $("#searchOrderRecord").click(function () {
                    $.ajax(
                        {
                            type:"POST",
                            url:"/admin/searchOrderRecord",
                            data:{key:$("#orderRecordKey").val()},
                            success:function(json){
                                $("#table3").bootstrapTable(
                                    'load',json
                                );
                            },
                            error:function(){
                                alert("错误");
                            }
                        })
                });

                $("#removeOrderRecord").click(function(){
                    var array=[];
                    $(" tbody input[type='checkbox']").each(function(){
                        if($(this).prop("checked")){
                            array.push($(this).parent().next().text());
                        }
                    });
                    var arrayString=array.join("-");
                    $.ajax(
                        {
                            type:"POST",
                            url:"/admin/deleteOrderRecord",
                            data:{deleteArray:arrayString},
                            success:function(json){
                                $("#table3").bootstrapTable(
                                    'load',json
                                );
                            },
                            error:function(){
                                alert("错误");
                            }
                        })

                });

            });

        </script>

    <%--评论管理js--%>
    <script>
            $(function() {
                $("#searchUserComments").click(function () {
                    $.ajax(
                        {
                            type:"POST",
                            url:"/admin/searchUserComments",
                            data:{key:$("#userCommentsKey").val()},
                            success:function(json){
                                $("#table4").bootstrapTable(
                                    'load',json
                                );
                            },
                            error:function(){
                                alert("错误");
                            }
                        })
                });

                $("#removeUserComments").click(function(){
                    var array=[];
                    $(" tbody input[type='checkbox']").each(function(){
                        if($(this).prop("checked")){
                            array.push($(this).parent().next().text());
                        }
                    });
                    var arrayString=array.join("-");
                    $.ajax(
                        {
                            type:"POST",
                            url:"/admin/deleteUserComments",
                            data:{deleteArray:arrayString},
                            success:function(json){
                                $("#table4").bootstrapTable(
                                    'load',json
                                );
                            },
                            error:function(){
                                alert("错误");
                            }
                        })

                });

            });

        </script>

    <ul>
        <li><a href="#tabs-1">用户管理</a></li>
        <li><a href="#tabs-2">商品管理</a></li>
        <li><a href="#tabs-3">订单管理</a></li>
        <li><a href="#tabs-4">评价管理</a></li>
    </ul>

    <div id="tabs-1">
        <%--加载表格数据--%>
        <script type="text/javascript">
            $.ajax(
                {
                    type:"GET",
                    url:"/admin/getUser",
                    contentType: 'application/json',
                    dataType:"json",
                    success:function(json){
                        //finishingTask为table的id
                        $("#table1").bootstrapTable(
                            'load',json
                        );
                    },
                    error:function(){
                        alert("错误");
                    }
                }
            )
        </script>

        <div style="">
            <form class="form-inline">
                <label>关键词：</label>
                <input class="form-control" type="text" id="UserKey" />
                <input type="button" class="btn" value="查找" id="searchUser">

                <button id="addUser" type="button" class="btn btn-primary" style="margin-left: 150px;"><i class="fa fa-plus" aria-hidden="true"></i>新增</button>
                <button id="removeUser" type="button" class="btn btn-default"><i class="fa fa-minus" aria-hidden="true"></i>删除</button>
            </form>

        </div>

        <table id="table1"
                data-pagination="true"
                data-show-search="true"
                data-show-columns="true"
                data-icon-size="outline"
                data-mobile-responsive="true"
                data-height="500"
                toolbar="#toolbar">
            <thead>
            <tr>
                <th data-field="state" data-checkbox="true"></th>
                <th data-field="userAccount" >账号</th>
                <th data-field="nickname" >昵称</th>
                <th data-field="address" >地址</th>
                <th data-field="sex" >性别</th>
                <th data-field="identityId" >身份证</th>
                <th data-field="name" >姓名</th>
            </tr>
            </thead>
        </table>
    </div>

    <div id="tabs-2">
        <script type="text/javascript">
            $.ajax(
                {
                    type:"GET",
                    url:"/admin/getGoods",
                    contentType: 'application/json',
                    dataType:"json",
                    success:function(json){
                        //finishingTask为table的id
                        $("#table2").bootstrapTable(
                            'load',json
                        );
                    },
                    error:function(){
                        alert("错误");
                    }
                }
            )
        </script>

        <div style="">
            <form class="form-inline">
                <label>关键词：</label>
                <input class="form-control" type="text" id="goodsKey" />
                <input type="button" class="btn" value="查找" id="searchGoods">

                <button id="addGoods" type="button" class="btn btn-primary" style="margin-left: 150px;"><i class="fa fa-plus" aria-hidden="true"></i>新增</button>
                <button id="removeGoods" type="button" class="btn btn-default"><i class="fa fa-minus" aria-hidden="true"></i>删除</button>
            </form>
        </div>

        <div class="bs-example">
            <table id="table2"
                    data-pagination="true"
                    data-show-search="true"
                    data-show-columns="true"
                    data-icon-size="outline"
                    data-mobile-responsive="true"
                    data-height="500"
                    toolbar="#toolbar">
                <thead>
                <tr>
                    <th data-field="state" data-checkbox="true"></th>
                    <th data-field="goodsId" >商品id</th>
                    <th data-field="goodsName" >商品名</th>
                    <th data-field="userAccount" >卖家</th>
                    <th data-field="brand" >品牌</th>
                    <th data-field="price" >单价</th>
                    <th data-field="type" >类型</th>
                    <th data-field="salesCounts" >库存</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

    <div id="tabs-3">
            <script>
                $.ajax(
                    {
                        type:"GET",
                        url:"/admin/getOrderRecord",
                        contentType: 'application/json',
                        dataType:"json",
                        success:function(json){
                            //finishingTask为table的id
                            $("#table3").bootstrapTable(
                                'load',json
                            );
                        },
                        error:function(){
                            alert("错误");
                        }
                    }
                )
            </script>

            <div style="">
                <form class="form-inline">
                    <label>关键词：</label>
                    <input class="form-control" type="text" id="orderRecordKey" />
                    <input type="button" class="btn" value="查找" id="searchOrderRecord">

                    <button id="addOrderRecord" type="button" class="btn btn-primary" style="margin-left: 150px;"><i class="fa fa-plus" aria-hidden="true"></i>新增</button>
                    <button id="removeOrderRecord" type="button" class="btn btn-default"><i class="fa fa-minus" aria-hidden="true"></i>删除</button>
                </form>
            </div>
            <div class="bs-example">
                <table  id="table3"
                        data-pagination="true"
                        data-show-search="true"
                        data-show-columns="true"
                        data-icon-size="outline"
                        data-mobile-responsive="true"
                        data-height="500"
                        toolbar="#toolbar">
                    <thead>
                    <tr>
                        <th data-field="state" data-checkbox="true"></th>
                        <th data-field="orderId" >订单id</th>
                        <th data-field="orderTime" >订单时间</th>
                        <th data-field="userSell" >卖家</th>
                        <th data-field="userBuy" >品买家</th>
                        <th data-field="goodsId" >商品id</th>
                        <th data-field="goodsCounts" >商品库存</th>
                        <th data-field="sellHandler" >卖家处理信息</th>
                        <th data-field="buyHandler" >买家处理信息</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>

    <div id="tabs-4">
            <script>
                $.ajax(
                    {
                        type:"GET",
                        url:"/admin/getUserComments",
                        contentType: 'application/json',
                        dataType:"json",
                        success:function(json){
                            //finishingTask为table的id
                            $("#table4").bootstrapTable(
                                'load',json
                            );
                        },
                        error:function(){
                            alert("错误");
                        }
                    }
                )
            </script>

            <div style="">
                <form class="form-inline">
                    <label>关键词：</label>
                    <input class="form-control" type="text" id="userCommentsKey" />
                    <input type="button" class="btn" value="查找" id="searchUserComments">

                    <button id="addCommentsRecord" type="button" class="btn btn-primary" style="margin-left: 150px;"><i class="fa fa-plus" aria-hidden="true"></i>新增</button>
                    <button id="removeUserComments" type="button" class="btn btn-default"><i class="fa fa-minus" aria-hidden="true"></i>删除</button>
                </form>
            </div>

            <div class="bs-example">
                <table  id="table4"
                        data-pagination="true"
                        data-show-search="true"
                        data-show-columns="true"
                        data-icon-size="outline"
                        data-mobile-responsive="true"
                        data-height="500"
                        toolbar="#toolbar">
                    <thead>
                    <tr>
                        <th data-field="state" data-checkbox="true"></th>
                        <th data-field="commentId" >评论id</th>
                        <th data-field="goodsId" >评论商品id</th>
                        <th data-field="userAccount" >评论账户</th>
                        <th data-field="comments" >评论内容</th>
                        <th data-field="timestamp" >时间戳</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
</div>


</body>
</html>
