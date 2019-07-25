package com.niit.dao;

import com.niit.model.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {
    int deleteByPrimaryKey(String goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(String goodsId);

    List<Goods> selectGoodsByKey(@Param("key") String key);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

    List<Goods> selectAll();

    List<Goods> selectByUserAccount(String userAccount);

    List<Goods> selectByText(@Param("type") String type,@Param("brand") String brand,@Param("minPrice") double minPrice,@Param("maxPrice") double maxPrice);
}