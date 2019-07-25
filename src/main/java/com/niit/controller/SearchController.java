package com.niit.controller;

import com.niit.model.Goods;
import com.niit.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/6/14.
 */

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/searchGoods")
    public String searchGoods(HttpServletRequest request, HttpSession session) {

        session.setAttribute("goodsList",goodsService.selectAll());

        return "classify";
    }

    @RequestMapping("/changeGoods")
    @ResponseBody
    public List<Goods> changeGoods(HttpServletRequest request) {

        String type = request.getParameter("select1");
        String brand = request.getParameter("select2");
        String price = request.getParameter("select3");

        double min = 0, max = 0;

        if (price.equals("0~499")) {
            min = 0;
            max = 500;
        } else if (price.equals("500~999")) {
            min = 500;
            max = 999;
        } else if (price.equals("1000~1999")) {
            min = 1000;
            max = 1999;
        } else if (price.equals("2000~2999")) {
            min = 2000;
            max = 2999;
        } else if (price.equals("3000~3999")) {
            min = 3000;
            max = 3999;
        } else if (price.equals("4000以上")) {
            min = 4000;
            max = 999999;
        } else {
            min = 0;
            max = 999999;
        }

        List<Goods> goodsListTemp = goodsService.selectAll();
        List<Goods> goodsList = new ArrayList<Goods>();

        for ( int i = 0 ; i < goodsListTemp.size() ; i ++ ) {
            Goods goods = goodsListTemp.get(i);
            if ( (goods.getBrand().equals(brand)||brand.equals(""))
                && (goods.getType().equals(type)||type.equals(""))
                && (goods.getPrice()>min && goods.getPrice()<max)) {
                goodsList.add(goods);
            }
        }

        return goodsList;
    }

}
