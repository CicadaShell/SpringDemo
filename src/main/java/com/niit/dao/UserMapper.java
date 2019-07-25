package com.niit.dao;

import com.niit.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(String userAccount);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userAccount);

    List<User> selectUserByKey(@Param("key") String key);

    List<User> selectAllUser();

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}