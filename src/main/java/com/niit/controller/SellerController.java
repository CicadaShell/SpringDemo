package com.niit.controller;

//import com.jspsmart.upload.Request;
//import com.jspsmart.upload.SmartUpload;
//import com.jspsmart.upload.SmartUploadException;
import com.niit.model.Goods;
import com.niit.model.OrderRecord;
import com.niit.model.User;
import com.niit.service.GoodsService;
import com.niit.service.OrderRecordService;
import com.niit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/6/16.
 */

@Controller
@RequestMapping("/seller")
public class SellerController implements ServletConfigAware,ServletContextAware {

    private ServletContext servletContext;
    private ServletConfig servletConfig;

    @Autowired
    private UserService userService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderRecordService orderRecordService;

    @RequestMapping("/center")
    public String verificationUser(HttpServletRequest request,HttpServletResponse response,HttpSession session) {

        return "sellerCenter";
    }

    @RequestMapping("/searchTab1")
    @ResponseBody
    public List<Goods> searchTab1(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");

        return goodsService.selectByUserAccount(userAccount);
    }

    @RequestMapping("/pullGoods")
    @ResponseBody
    public boolean pullGoods(HttpServletRequest request) {

        String goodsIdString = request.getParameter("goodsId");
        String [] goodsId = goodsIdString.split("L");

        if ( goodsIdString.equals("") ) {
            return false;
        }

        for (int i = 0 ; i < goodsId.length ; i ++ ) {
            goodsService.deleteGoods(goodsId[i]);
        }

        return true;
    }

    @RequestMapping("/searchTab2")
    @ResponseBody
    public List<OrderRecordMes> searchTab2(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        List<Goods> goodsList = goodsService.selectByUserAccount(userAccount);

        List<OrderRecordMes> orderRecordMesList = new ArrayList<OrderRecordMes>();
        for ( int i = 0 ; i < goodsList.size() ; i ++ ) {
            List<OrderRecord> orderRecordListTemp = orderRecordService.selectByGoodsId( goodsList.get(i).getGoodsId() );
            for ( int j = 0 ; j < orderRecordListTemp.size() ; j ++ ) {

                OrderRecordMes orderRecordMes = new OrderRecordMes();

                orderRecordMes.setOrderId(orderRecordListTemp.get(j).getOrderId());
                orderRecordMes.setOrderTime(orderRecordListTemp.get(j).getOrderTime());
                orderRecordMes.setGoodsCounts(orderRecordListTemp.get(j).getGoodsCounts());
                orderRecordMes.setGoodsName(goodsList.get(i).getGoodsName());
                orderRecordMes.setPrice(goodsList.get(i).getPrice());

                User user = userService.searchOne(orderRecordListTemp.get(j).getUserBuy());
                orderRecordMes.setBuyName(user.getName());
                orderRecordMes.setAddress(user.getAddress());

                orderRecordMesList.add(orderRecordMes);
            }
        }

        return orderRecordMesList;
    }

    @RequestMapping("/delRecord")
    @ResponseBody
    public boolean delRecord(HttpServletRequest request) {

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

    @RequestMapping("/searchTab3")
    @ResponseBody
    public List<OrderRecordMes> searchTab3(HttpServletRequest request) {

        String userAccount = request.getParameter("userAccount");
        List<Goods> goodsList = goodsService.selectByUserAccount(userAccount);

        List<OrderRecordMes> orderRecordMesList = new ArrayList<OrderRecordMes>();
        for ( int i = 0 ; i < goodsList.size() ; i ++ ) {
            List<OrderRecord> orderRecordListTemp = orderRecordService.selectByGoodsId( goodsList.get(i).getGoodsId() );
            for ( int j = 0 ; j < orderRecordListTemp.size() ; j ++ ) {

                OrderRecordMes orderRecordMes = new OrderRecordMes();

                orderRecordMes.setOrderId(orderRecordListTemp.get(j).getOrderId());
                orderRecordMes.setOrderTime(orderRecordListTemp.get(j).getOrderTime());
                orderRecordMes.setGoodsCounts(orderRecordListTemp.get(j).getGoodsCounts());
                orderRecordMes.setGoodsName(goodsList.get(i).getGoodsName());
                orderRecordMes.setPrice(goodsList.get(i).getPrice());

                User user = userService.searchOne(orderRecordListTemp.get(j).getUserBuy());
                orderRecordMes.setBuyName(user.getName());
                orderRecordMes.setAddress(user.getAddress());

                if ( !orderRecordListTemp.get(j).getSellHandler() ) {
                    orderRecordMesList.add(orderRecordMes);
                }
            }
        }

        return orderRecordMesList;
    }

    @RequestMapping("/sendGoods")
    @ResponseBody
    public boolean sendGoods(HttpServletRequest request) {

        String orderIdString = request.getParameter("orderId");
        String orderId [] = orderIdString.split("L");

        if ( orderIdString.equals("") ) {
            return false;
        }

        for (int i = 0 ; i < orderId.length ; i ++ ) {
            OrderRecord orderRecord = orderRecordService.selectByPrimaryKey(orderId[i]);
            orderRecord.setSellHandler(true);
            orderRecordService.updateByPrimaryKeySelective(orderRecord);
        }

        return true;
    }

    @RequestMapping("/add")
    public String addGoods(HttpServletRequest request, HttpServletResponse response,HttpSession session) {

        SimpleDateFormat sdf = new SimpleDateFormat("mm-ss");
        Date date1 = new Date();
        String date = sdf.format(date1);

        Goods goods = new Goods();
        goods.setGoodsId( session.getAttribute("loginAccount")+date);

//        SmartUpload mySmartUpload = new SmartUpload();
//        try {
//            mySmartUpload.initialize(this.servletConfig, request,response);
//            mySmartUpload.upload();
//            mySmartUpload.getFiles().getFile(0).saveAs("D:\\Web\\Shopping\\target\\Shopping\\img\\"+goods.getGoodsId()+".jpg");
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (SmartUploadException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        Request request1 = mySmartUpload.getRequest();
//
//        goods.setGoodsName(request1.getParameter("goodsName"));
//        goods.setBrand(request1.getParameter("brand"));
//        goods.setUserAccount((String) session.getAttribute("loginAccount"));
//        goods.setPrice( Double.valueOf(request1.getParameter("price")) );
//        goods.setType( request1.getParameter("type") );
//        goods.setSalesCounts(0);
//        goods.setPicture("../../img/"+goods.getGoodsId()+".jpg");

        goodsService.insertGoods(goods);

        return "sellerCenter";
    }

    public void setServletConfig(ServletConfig servletConfig) {
        this.servletConfig = servletConfig;
    }

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
}
