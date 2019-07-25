package com.niit.controller;

import com.niit.model.Favorite;
import com.niit.model.Goods;
import com.niit.model.OrderRecord;
import com.niit.model.Trolley;
import com.niit.service.FavoriteService;
import com.niit.service.GoodsService;
import com.niit.service.OrderRecordService;
import com.niit.service.TrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/6/20.
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private FavoriteService favoriteService;

    @Autowired
    private TrolleyService trolleyService;

    @Autowired
    private OrderRecordService orderRecordService;

    @RequestMapping("/show")
    public String showGoods(HttpServletRequest request, HttpServletResponse response) {

        String goodsId = request.getParameter("hiddenGoodsId");

        Goods goods = goodsService.selectByPrimaryKey(goodsId);
        request.setAttribute("goods",goods);

        return "goods";
    }

    @RequestMapping("/save")
    @ResponseBody
    public boolean saveToFavotite(HttpServletRequest request) {

        Favorite favorite = new Favorite();
        favorite.setUserAccount(request.getParameter("userAccount"));
        favorite.setGoodsId(request.getParameter("goodsId"));

        favoriteService.insert(favorite);

        return true;
    }

    @RequestMapping("/trolley")
    @ResponseBody
    public boolean saveToTrolley(HttpServletRequest request) {

        Trolley trolley = new Trolley();
        trolley.setUserAccount(request.getParameter("userAccount"));
        trolley.setGoodsId(request.getParameter("goodsId"));

        trolleyService.insert(trolley);

        return true;
    }

    @RequestMapping("/buy")
    @ResponseBody
    public boolean buyNow(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        int buyCount = Integer.parseInt(request.getParameter("buyCount"));

        OrderRecord orderRecord = new OrderRecord();
        Goods goods = goodsService.selectByPrimaryKey(request.getParameter("goodsId"));

        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        String dateString = sdf1.format(date);

        orderRecord.setOrderId(userAccount+dateString);
        orderRecord.setOrderTime(date);
        orderRecord.setUserSell(goods.getUserAccount());
        orderRecord.setUserBuy(userAccount);
        orderRecord.setGoodsId(goods.getGoodsId());
        orderRecord.setGoodsCounts(buyCount);
        orderRecord.setSellHandler(false);
        orderRecord.setBuyHandler(false);

        //销量加一
        goods.setSalesCounts(goods.getSalesCounts()+buyCount);
        goodsService.updateByPrimaryKey(goods);

        orderRecordService.insert(orderRecord);

        return true;
    }
}
