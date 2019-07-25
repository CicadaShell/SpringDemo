package com.niit.controller;

import com.niit.model.Goods;
import com.niit.model.OrderRecord;
import com.niit.model.User;
import com.niit.model.UserComments;
import com.niit.service.GoodsService;
import com.niit.service.OrderRecordService;
import com.niit.service.UserCommentService;
import com.niit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by robot on 2017/6/15.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private OrderRecordService orderRecordService;
    @Autowired
    private UserCommentService userCommentService;
    /*
    * 管理员权限用户管理映射
    * */
    @RequestMapping(value = "/getUser",method = RequestMethod.GET)
    @ResponseBody
    public List<User> initUser(){
        return userService.getAllUser();
    }

    @RequestMapping(value = "/searchUser",method = RequestMethod.POST)
    @ResponseBody
    public List<User> searchUser(HttpServletRequest request){
        String key=request.getParameter("key");
        return userService.getUserByKey(key);
    }

    @RequestMapping(value = "/deleteUser",method = RequestMethod.POST)
    @ResponseBody
    public List<User> deleteUser(HttpServletRequest request){
        String arrayString= (String) request.getParameter("deleteArray");
        String array[]=arrayString.split("-");
        for (int i=0;i<array.length;i++){
            System.out.print(array[i]);
            userService.deleteUser(array[i]);
        }
        return userService.getAllUser();
    }

    /*
    * 管理员权限商品管理映射
    * */
    @RequestMapping(value = "/getGoods",method = RequestMethod.GET)
    @ResponseBody
    public List<Goods> initGoods(){
        return goodsService.selectAll();
    }

    @RequestMapping(value = "/searchGoods",method = RequestMethod.POST)
    @ResponseBody
    public List<Goods> searchGoods(HttpServletRequest request){
        String key=request.getParameter("key");
        return goodsService.getUserByKey(key);
    }

    @RequestMapping(value = "/deleteGoods",method = RequestMethod.POST)
    @ResponseBody
    public List<Goods> deleteGoods(HttpServletRequest request){
        String arrayString= (String) request.getParameter("deleteArray");
        String array[]=arrayString.split("-");
        for (int i=0;i<array.length;i++){
            System.out.print(array[i]);
            goodsService.deleteGoods(array[i]);
        }
        return goodsService.selectAll();
    }

    /*
    * 管理员权限订单管理映射
    * */
    @RequestMapping(value = "/getOrderRecord",method = RequestMethod.GET)
    @ResponseBody
    public List<OrderRecord> initOderRecord(){
        return orderRecordService.selectAll();
    }

    @RequestMapping(value = "/searchOrderRecord",method = RequestMethod.POST)
    @ResponseBody
    public List<OrderRecord> searchOderRecord(HttpServletRequest request){
        String key=request.getParameter("key");
        return orderRecordService.selectOrderRecordByKey(key);
    }

    @RequestMapping(value = "/deleteOrderRecord",method = RequestMethod.POST)
    @ResponseBody
    public List<OrderRecord> deleteOderRecord(HttpServletRequest request){
        String arrayString= (String) request.getParameter("deleteArray");
        String array[]=arrayString.split("-");
        for (int i=0;i<array.length;i++){
            System.out.print(array[i]);
            orderRecordService.deleteByPrimaryKey(array[i]);
        }
        return orderRecordService.selectAll();
    }

    /*
    * 管理员权限评论管理映射
    * */
    @RequestMapping(value = "/getUserComments",method = RequestMethod.GET)
    @ResponseBody
    public List<UserComments> initUserComments(){
        return userCommentService.selectAll();
    }

    @RequestMapping(value = "/searchUserComments",method = RequestMethod.POST)
    @ResponseBody
    public List<UserComments> searchUserComments(HttpServletRequest request){
        String key=request.getParameter("key");
        return userCommentService.selectUserCommentsByKey(key);
    }

    @RequestMapping(value = "/deleteUserComments",method = RequestMethod.POST)
    @ResponseBody
    public List<UserComments> deleteUserComments(HttpServletRequest request){
        String arrayString= (String) request.getParameter("deleteArray");
        String array[]=arrayString.split("-");
        for (int i=0;i<array.length;i++){
            System.out.print(array[i]);
            userCommentService.deleteUserComments(array[i]);
        }
        return userCommentService.selectAll();
    }
}
