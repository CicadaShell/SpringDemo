package com.niit.dao;

import com.niit.model.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
    Admin selectByPrimaryKey(String adminAccount);
}