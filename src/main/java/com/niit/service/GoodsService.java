package com.niit.service;

import com.niit.model.Goods;

import java.util.List;

/**
 * Created by Administrator on 2017/6/18.
 */
public interface GoodsService {

    int insertGoods(Goods goods);

    List<Goods> selectAll();

    List<Goods> getUserByKey(String key);

    int deleteGoods(String goodsId);

    List<Goods> selectByUserAccount(String userAccount);

    List<Goods> selectByText(String type,String brand,double minPrice,double maxPrice);

    Goods selectByPrimaryKey(String goodsId);

    int updateByPrimaryKey(Goods record);
}
