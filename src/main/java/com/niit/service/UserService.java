package com.niit.service;

import com.niit.model.Admin;
import com.niit.model.User;

import java.util.List;

/**
 * Created by Administrator on 2017/6/13.
 */

public interface UserService {

    int insertUser(User user);

    User searchOne(String userAccount);

    Admin searchAdmin(String adminAccount);

    List<User> getUserByKey(String key);

    List<User> getAllUser();

    int deleteUser(String userAccount);
}
