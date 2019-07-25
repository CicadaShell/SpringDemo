package com.niit.service;

import com.niit.model.Favorite;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public interface FavoriteService {

    int insert(Favorite record);

    List<Favorite> selectByUserAccount(String userAccount);

    int deleteByGoodsId(String goodsId);
}
