package com.niit.service;

import com.niit.model.UserComments;

import java.util.List;

/**
 * Created by robot on 2017/6/21.
 */
public interface UserCommentService {
    int deleteUserComments(String userCommentsId);

    List<UserComments> selectAll();

    List<UserComments> selectUserCommentsByKey(String key);
}
