package com.niit.service.impl;

import com.niit.dao.AdminMapper;
import com.niit.dao.UserMapper;
import com.niit.model.Admin;
import com.niit.model.User;
import com.niit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/6/13.
 */

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private AdminMapper adminMapper;

    public int insertUser(User user) {
        return userMapper.insert(user);
    }

    public User searchOne(String userAccount) {
        return userMapper.selectByPrimaryKey(userAccount);
    }

    public Admin searchAdmin(String adminAccount) {
        return adminMapper.selectByPrimaryKey(adminAccount);
    }

    public List<User> getUserByKey(String key) {
        return userMapper.selectUserByKey(key);
    }

    public List<User> getAllUser() {
        return userMapper.selectAllUser();
    }

    public int deleteUser(String userAccount) {
        return userMapper.deleteByPrimaryKey(userAccount);
    }
}
