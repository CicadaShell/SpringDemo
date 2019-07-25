package com.niit.service.impl;

import com.niit.dao.GoodsMapper;
import com.niit.model.Goods;
import com.niit.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/18.
 */
@Service
public class GoodsServiceImpl implements GoodsService{

    @Autowired
    private GoodsMapper goodsMapper;

    public int insertGoods(Goods goods) {
        return goodsMapper.insert(goods);
    }

    public List<Goods> selectAll() {
        return goodsMapper.selectAll();
    }

    public List<Goods> selectByUserAccount(String userAccount) {
        return goodsMapper.selectByUserAccount(userAccount);
    }

    public List<Goods> selectByText(String type, String brand, double minPrice, double maxPrice) {
        return goodsMapper.selectByText(type,brand,minPrice,maxPrice);
    }

    public Goods selectByPrimaryKey(String goodsId) {
        return goodsMapper.selectByPrimaryKey(goodsId);
    }

    public int updateByPrimaryKey(Goods record) {
        return goodsMapper.updateByPrimaryKey(record);
    }

    public List<Goods> getUserByKey(String key) {
        return goodsMapper.selectGoodsByKey(key);
    }

    public int deleteGoods(String goodsId) {
        return goodsMapper.deleteByPrimaryKey(goodsId);
    }
}
