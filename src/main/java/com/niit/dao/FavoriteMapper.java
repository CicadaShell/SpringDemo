package com.niit.dao;

import com.niit.model.Favorite;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FavoriteMapper {
    int insert(Favorite record);

    int insertSelective(Favorite record);

    List<Favorite> selectByUserAccount(@Param("userAccount") String userAccount);

    int deleteByGoodsId(@Param("goodsId") String goodsId);
}