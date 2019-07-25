package com.niit.dao;

import com.niit.model.OrderRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRecordMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(OrderRecord record);

    int insertSelective(OrderRecord record);

    OrderRecord selectByPrimaryKey(String orderId);

    List<OrderRecord> selectAll();

    List<OrderRecord> selectOrderRecordByKey(@Param("key") String key);

    List<OrderRecord> selectByGoodsId(@Param("goodsId")String goodsId);

    List<OrderRecord> selectByUserBuyAccount(@Param("userAccount")String userAccount);

    int updateByPrimaryKeySelective(OrderRecord record);

    int updateByPrimaryKey(OrderRecord record);
}