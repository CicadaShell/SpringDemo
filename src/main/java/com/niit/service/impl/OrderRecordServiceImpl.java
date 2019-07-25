package com.niit.service.impl;

import com.niit.dao.OrderRecordMapper;
import com.niit.model.OrderRecord;
import com.niit.service.OrderRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/20.
 */
@Service
public class OrderRecordServiceImpl implements OrderRecordService {

    @Autowired
    private OrderRecordMapper orderRecordMapper;

    public int insert(OrderRecord record) {
        return orderRecordMapper.insert(record);
    }

    public List<OrderRecord> selectByGoodsId(String goodsId) {
        return orderRecordMapper.selectByGoodsId(goodsId);
    }

    public List<OrderRecord> selectByUserBuyAccount(String userAccount) {
        return orderRecordMapper.selectByUserBuyAccount(userAccount);
    }

    public List<OrderRecord> selectAll() {
        return orderRecordMapper.selectAll();
    }

    public List<OrderRecord> selectOrderRecordByKey(String key) {
        return orderRecordMapper.selectOrderRecordByKey(key);
    }

    public int deleteByPrimaryKey(String orderId) {
        return orderRecordMapper.deleteByPrimaryKey(orderId);
    }

    public int updateByPrimaryKeySelective(OrderRecord record) {
        return orderRecordMapper.updateByPrimaryKeySelective(record);
    }

    public OrderRecord selectByPrimaryKey(String orderId) {
        return orderRecordMapper.selectByPrimaryKey(orderId);
    }
}
