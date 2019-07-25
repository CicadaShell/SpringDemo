package com.niit.dao;

import com.niit.model.UserComments;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserCommentsMapper {
    int deleteByPrimaryKey(String commentId);

    int insert(UserComments record);

    int insertSelective(UserComments record);

    UserComments selectByPrimaryKey(String commentId);

    List<UserComments> selectAll();

    List<UserComments> selectUserCommentsByKey(@Param("key") String key);

    int updateByPrimaryKeySelective(UserComments record);

    int updateByPrimaryKey(UserComments record);
}