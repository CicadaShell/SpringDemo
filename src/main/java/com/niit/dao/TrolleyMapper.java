package com.niit.dao;

import com.niit.model.Trolley;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrolleyMapper {
    int insert(Trolley record);

    int insertSelective(Trolley record);

    List<Trolley> selectByUserAccount(@Param("userAccount") String userAccount);

    int deleteByGoodsId(@Param("goodsId") String goodsId);
}