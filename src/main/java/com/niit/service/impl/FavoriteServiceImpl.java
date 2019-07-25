package com.niit.service.impl;

import com.niit.dao.FavoriteMapper;
import com.niit.model.Favorite;
import com.niit.service.FavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
@Service
public class FavoriteServiceImpl implements FavoriteService{

    @Autowired
    private FavoriteMapper favoriteMapper;

    public int insert(Favorite record) {
        return favoriteMapper.insert(record);
    }

    public List<Favorite> selectByUserAccount(String userAccount) {
        return favoriteMapper.selectByUserAccount(userAccount);
    }

    public int deleteByGoodsId(String goodsId) {
        return favoriteMapper.deleteByGoodsId(goodsId);
    }
}
