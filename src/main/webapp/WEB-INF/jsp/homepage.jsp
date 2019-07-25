<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/12
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>

    <!-- 小图标库 -->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css">

    <link href="../../css/style1.css" rel="stylesheet">

    <link href="../../css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.css" rel="stylesheet">
    <link href="../../css/jQueryUI/jquery-ui.theme.min.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/jQueryUI/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function() {
            var $lis = $("#proinfo").find("li");

            $lis.hover(function(){
                if(!$(this).hasClass('nochild')){
                    $(this).addClass("prosahover");
                    $(this).find(".prosmore").removeClass('hide');
                }
            },function(){
                if(!$(this).hasClass('nochild')){
                    if($(this).hasClass("prosahover")){
                        $(this).removeClass("prosahover");
                    }
                    $(this).find(".prosmore").addClass('hide');
                }
            });

        });
    </script>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<jsp:include page="search.jsp"/>

<div>
    <!-- 导航栏 -->
    <div class="pros subpage">
        <ul class="prosul clearfix" id="proinfo">
            <li class="food">
                <i>&gt;</i>
                <a class="ti" href="#">电脑</a>
                <a href="#">笔记本电脑</a>
                <a href="#">台式机</a>
                <div class="prosmore hide">
                    <span><em><a href="#">全部</a></em></span>
                    <span><em><a href="#">华硕</a></em></span>
                    <span><em><a href="#">三星</a></em></span>
                    <span><em><a href="#">IBM</a></em></span>
                    <span><em><a href="#">联想</a></em></span>
                    <span><em><a href="#">ThinkPad</a></em></span>
                    <span><em><a href="#">戴尔</a></em></span>
                    <span><em><a href="#">惠普</a></em></span>
                    <span><em><a href="#">微软</a></em></span>
                    <span><em><a href="#">外星人</a></em></span>
                    <span><em><a href="#">其他</a></em></span>
                </div>
            </li>
            <li class="enjoy">
                <i>&gt;</i>
                <a class="ti" href="#">手机</a>
                <a href="#">固话</a>
                <a href="#">智能手机</a>
                <div class="prosmore hide">
                    <span><em><a href="#">全部</a></em></span>
                    <span><em><a href="#">固话</a></em></span>
                    <span><em><a href="#">三星</a></em></span>
                    <span><em><a href="#">苹果</a></em></span>
                    <span><em><a href="#">金立</a></em></span>
                    <span><em><a href="#">索尼</a></em></span>
                    <span><em><a href="#">魅族</a></em></span>
                    <span><em><a href="#">小米</a></em></span>
                    <span><em><a href="#">联想</a></em></span>
                    <span><em><a href="#">锤子</a></em></span>
                    <span><em><a href="#">移动官方</a></em></span>
                    <span><em><a href="#">排挤的联通电信</a></em></span>
                    <span><em><a href="#">其他</a></em></span>
                </div>
            </li>
            <li class="travel">
                <i>&gt;</i>
                <a class="ti" href="#">外设</a>
                <a href="#">精品外设</a>
                <a href="#">炫迈外设</a>
                <div class="prosmore hide">
                    <span><em><a href="#">全部</a></em></span>
                    <span><em><a href="#">鼠标</a></em></span>
                    <span><em><a href="#">键盘</a></em></span>
                    <span><em><a href="#">音响</a></em></span>
                    <span><em><a href="#">其他</a></em></span>
                </div>
            </li>
            <li class="life">
                <i>&gt;</i>
                <a class="ti" href="#">平板</a>
                <a href="#">andriod</a>
                <a href="#">ios</a>
                <div class="prosmore hide">
                    <span><em><a href="#">全部</a></em></span>
                    <span><em><a href="#">苹果</a></em></span>
                    <span><em><a href="#">不知名的杂牌</a></em></span>
                    <span><em><a href="#">小米</a></em></span>
                    <span><em><a href="#">华为</a></em></span>
                    <span><em><a href="#">其他(8)</a></em></span>
                </div>
            </li>
            <li class="women">
                <i>&gt;</i>
                <a class="ti" href="#">配件</a>
                <a href="#">机械配件</a>
                <a href="#">电脑配件</a>
                <div class="prosmore hide">
                    <span><em><a href="#">全部</a></em></span>
                    <span><em><a href="#">CPU</a></em></span>
                    <span><em><a href="#">显卡</a></em></span>
                    <span><em><a href="#">内存条</a></em></span>
                </div>
            </li>
            <li class="goods bd-solid">
                <i>&gt;</i>
                <a class="ti" href="#">其他</a>
                <a href="#">什么乱七八糟的</a>
                <a href="#">其他乱七八糟的</a>
                <div class="prosmore hide">
                    <span><em><a href="#">全部</a> </em></span>
                    <span><em><a href="#">古董字画</a> </em></span>
                    <span><em><a href="#">游戏点卡</a> </em></span>
                    <span><em><a href="#">游戏代练</a> </em></span>
                    <span><em><a href="#">化妆用品</a> </em></span>
                    <span><em><a href="#">箱包</a> </em></span>
                    <span><em><a href="#">家用电器</a> </em></span>
                    <span><em><a href="#">登山专用</a> </em></span>
                    <span><em><a href="#">鞋靴(11686)</a> </em></span>
                    <span><em><a href="#">饰品(4558)</a> </em></span>
                    <span><em><a href="#">手表(1482)</a> </em></span>
                    <span><em><a href="#">母婴用品(3659)</a> </em></span>
                    <span><em><a href="#">玩具(777)</a> </em></span>
                    <span><em><a href="#">抽奖(7)</a> </em></span>
                    <span><em><a href="#">礼品(197)</a> </em></span>
                    <span><em><a href="#">其他(4931)</a> </em></span>
                </div>
            </li>
        </ul>
    </div>

    <div id="myCarousel" class="carousel slide" style="margin-left: 40%;margin-top: 50px;width: 30%;height: 30%;">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>

        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="../../img/1.jpg" width="700" height="700">
                <div class="carousel-caption">标题 1</div>
            </div>
            <div class="item">
                <img src="../../img/2.jpg">
                <div class="carousel-caption">标题 2</div>
            </div>
            <div class="item">
                <img src="../../img/3.jpg">
                <div class="carousel-caption">标题 3</div>
            </div>
            <div class="item">
                <img src="../../img/4.jpg">
                <div class="carousel-caption">标题 4</div>
            </div>
            <div class="item">
                <img src="../../img/5.jpg">
                <div class="carousel-caption">标题 5</div>
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">&rsaquo;</a>
    </div>
</div>

</body>
</html>
