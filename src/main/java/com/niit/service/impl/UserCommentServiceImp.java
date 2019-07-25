package com.niit.service.impl;

import com.niit.dao.UserCommentsMapper;
import com.niit.model.UserComments;
import com.niit.service.UserCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by robot on 2017/6/21.
 */
@Service
public class UserCommentServiceImp implements UserCommentService{
    @Autowired
    private UserCommentsMapper userCommentsMapper;

    public int deleteUserComments(String userCommentsId) {
        return userCommentsMapper.deleteByPrimaryKey(userCommentsId);
    }

    public List<UserComments> selectAll() {
        return userCommentsMapper.selectAll();
    }

    public List<UserComments> selectUserCommentsByKey(String key) {
        return userCommentsMapper.selectUserCommentsByKey(key);
    }
}
