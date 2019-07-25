<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/14
  Time: 23:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>
</head>
<body>

<!-- 搜索框 -->
<div style="text-align:center; padding-top: 35px;">
    <form class="form-inline" id="searchForm" role="form" action="/search/searchGoods">
        <div class="input-group">
            <input type="text" name="searchName" id="searchName" placeholder="请输入商品名称" class="form-control" style="height: 45px; width: 400px;">
            <span class="input-group-btn">
				<button class="btn btn-default" type="button" id="searchSubmit"style="height: 45px;width: 45px;">
					<i class="fa fa-search" style="font-size: 20px;"></i>
				</button>
			</span>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#searchSubmit").click( function () {
            $("#searchForm").submit();
        });
    });
</script>

</body>
</html>
