package com.niit.service;

import com.niit.model.Trolley;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public interface TrolleyService {

    int insert(Trolley record);

    List<Trolley> selectByUserAccount(String userAccount);

    int deleteByGoodsId(String goodsId);
}
