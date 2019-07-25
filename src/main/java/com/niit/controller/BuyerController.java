package com.niit.controller;

import com.niit.model.*;
import com.niit.service.FavoriteService;
import com.niit.service.GoodsService;
import com.niit.service.OrderRecordService;
import com.niit.service.TrolleyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/6/16.
 */

@Controller
@RequestMapping("/buyer")
public class BuyerController {

    @Autowired
    private TrolleyService trolleyService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderRecordService orderRecordService;

    @Autowired
    private FavoriteService favoriteService;

    @RequestMapping("/center")
    public String verificationUser(HttpServletRequest request) {

        return "buyerCenter";
    }

    @RequestMapping("/searchTab1")
    @ResponseBody
    public List<Goods> searchTab1(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        List<Trolley> trolleyList = trolleyService.selectByUserAccount(userAccount);
        List<Goods> goodsList = new ArrayList<Goods>();

        for ( int i = 0 ; i < trolleyList.size(); i ++ ) {
            goodsList.add(goodsService.selectByPrimaryKey(trolleyList.get(i).getGoodsId()));
        }

        return goodsList;
    }

    @RequestMapping("/buyGoods")
    @ResponseBody
    public boolean buyGoods(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        String goodsIdString = request.getParameter("goodsId");
        String [] goodsId = goodsIdString.split("L");
        String countString = request.getParameter("goodsCount");
        String [] countStr = countString.split("L");

        if ( goodsIdString.equals("") ) {
            return false;
        }

        int [] count = new int[countStr.length];
        for (int i = 0 ; i < countStr.length ; i ++ ) {

            count[i] = Integer.parseInt(countStr[i]);
            Goods goods = goodsService.selectByPrimaryKey(goodsId[i]);

            OrderRecord orderRecord = new OrderRecord();

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
            Date date = new Date();
            String dateString = sdf1.format(date);

            orderRecord.setOrderId(userAccount+dateString);
            orderRecord.setOrderTime(date);
            orderRecord.setUserSell(userAccount);
            orderRecord.setUserBuy(userAccount);
            orderRecord.setGoodsId(goods.getGoodsId());
            orderRecord.setGoodsCounts(count[i]);
            orderRecord.setSellHandler(false);
            orderRecord.setBuyHandler(false);

            orderRecordService.insert(orderRecord);

            trolleyService.deleteByGoodsId(goodsId[i]);

            //销量
            goods.setSalesCounts(goods.getSalesCounts()+count[i]);
            goodsService.updateByPrimaryKey(goods);
        }

        return true;
    }

    @RequestMapping("/delGoodsFromTro")
    @ResponseBody
    public boolean pullGoods(HttpServletRequest request) {

        String goodsIdString = request.getParameter("goodsId");
        String [] goodsId = goodsIdString.split("L");

        if ( goodsIdString.equals("") ) {
            return false;
        }

        for (int i = 0 ; i < goodsId.length ; i ++ ) {
            trolleyService.deleteByGoodsId(goodsId[i]);
        }

        return true;
    }

    @RequestMapping("/searchTab2")
    @ResponseBody
    public List<Goods> searchTab2(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        List<Favorite> favoriteList = favoriteService.selectByUserAccount(userAccount);
        List<Goods> goodsList = new ArrayList<Goods>();

        for ( int i = 0 ; i < favoriteList.size() ; i ++ ) {
            goodsList.add(goodsService.selectByPrimaryKey(favoriteList.get(i).getGoodsId()));
        }

        return goodsList;
    }

    @RequestMapping("/delGoodsFromFav")
    @ResponseBody
    public boolean delGoodsFromFav(HttpServletRequest request) {

        String goodsIdString = request.getParameter("goodsId");
        String [] goodsId = goodsIdString.split("L");

        if ( goodsIdString.equals("") ) {
            return false;
        }

        for (int i = 0 ; i < goodsId.length ; i ++ ) {
            favoriteService.deleteByGoodsId(goodsId[i]);
        }

        return true;
    }

    @RequestMapping("/addGoodsToTro")
    @ResponseBody
    public boolean addGoodsToTro(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        String goodsIdString = request.getParameter("goodsId");
        String [] goodsId = goodsIdString.split("L");

        if ( goodsIdString.equals("") ) {
            return false;
        }

        for (int i = 0 ; i < goodsId.length ; i ++ ) {
            Trolley trolley = new Trolley();
            trolley.setUserAccount(userAccount);
            trolley.setGoodsId(goodsId[i]);

            trolleyService.insert(trolley);
            favoriteService.deleteByGoodsId(goodsId[i]);
        }

        return true;
    }

    @RequestMapping("/searchTab3")
    @ResponseBody
    public List<OrderRecordMes> searchTab3(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");

        List<OrderRecordMes> orderRecordMesList = new ArrayList<OrderRecordMes>();

        List<OrderRecord> orderRecordList = orderRecordService.selectByUserBuyAccount(userAccount);
        for ( int j = 0 ; j < orderRecordList.size() ; j ++ ) {

            OrderRecordMes orderRecordMes = new OrderRecordMes();

            orderRecordMes.setOrderId(orderRecordList.get(j).getOrderId());
            orderRecordMes.setOrderTime(orderRecordList.get(j).getOrderTime());
            orderRecordMes.setGoodsCounts(orderRecordList.get(j).getGoodsCounts());
            Goods goods = goodsService.selectByPrimaryKey(orderRecordList.get(j).getGoodsId());
            orderRecordMes.setGoodsName(goods.getGoodsName());
            orderRecordMes.setPrice(goods.getPrice());
            orderRecordMes.setPicture(goods.getPicture());

            orderRecordMesList.add(orderRecordMes);
        }

        return orderRecordMesList;
    }

    @RequestMapping("/delGoodsFromRec")
    @ResponseBody
    public boolean delGoodsFromRec(HttpServletRequest request) {

        String orderIdString = request.getParameter("orderId");
        String [] orderId = orderIdString.split("L");

        if ( orderIdString.equals("") ) {
            return false;
        }

        for (int i = 0 ; i < orderId.length ; i ++ ) {
            orderRecordService.deleteByPrimaryKey(orderId[i]);
        }

        return true;
    }

    @RequestMapping("/searchTab4")
    @ResponseBody
    public List<OrderRecordMes> searchTab4(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");

        List<OrderRecordMes> orderRecordMesList = new ArrayList<OrderRecordMes>();

        List<OrderRecord> orderRecordList = orderRecordService.selectByUserBuyAccount(userAccount);
        for ( int j = 0 ; j < orderRecordList.size() ; j ++ ) {

            OrderRecordMes orderRecordMes = new OrderRecordMes();

            orderRecordMes.setOrderId(orderRecordList.get(j).getOrderId());
            orderRecordMes.setOrderTime(orderRecordList.get(j).getOrderTime());
            orderRecordMes.setGoodsCounts(orderRecordList.get(j).getGoodsCounts());
            Goods goods = goodsService.selectByPrimaryKey(orderRecordList.get(j).getGoodsId());
            orderRecordMes.setGoodsName(goods.getGoodsName());
            orderRecordMes.setPrice(goods.getPrice());
            orderRecordMes.setPicture(goods.getPicture());

            if ( orderRecordList.get(j).getSellHandler() && (!orderRecordList.get(j).getBuyHandler()) ) {
                orderRecordMesList.add(orderRecordMes);
            }
        }

        return orderRecordMesList;
    }

    @RequestMapping("/ensureGoods")
    @ResponseBody
    public boolean ensureGoods(HttpServletRequest request) {

        String orderIdString = request.getParameter("orderId");

        if ( orderIdString.equals("") ) {
            return false;
        }

        String orderId [] = orderIdString.split("L");

        for (int i = 0 ; i < orderId.length ; i ++ ) {
            OrderRecord orderRecord = orderRecordService.selectByPrimaryKey(orderId[i]);
            orderRecord.setBuyHandler(true);
            orderRecordService.updateByPrimaryKeySelective(orderRecord);
        }

        return true;
    }

}
