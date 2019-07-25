package com.niit.service;

import com.niit.model.OrderRecord;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
public interface OrderRecordService {

    int insert(OrderRecord record);

    List<OrderRecord> selectByGoodsId(String goodsId);

    List<OrderRecord> selectByUserBuyAccount(String userAccount);

    List<OrderRecord> selectAll();

    List<OrderRecord> selectOrderRecordByKey(String key);

    int deleteByPrimaryKey(String orderId);

    int updateByPrimaryKeySelective(OrderRecord record);

    OrderRecord selectByPrimaryKey(String orderId);
}
