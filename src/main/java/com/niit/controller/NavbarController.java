package com.niit.controller;

import com.niit.model.Admin;
import com.niit.model.User;
import com.niit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

/**
 * Created by Administrator on 2017/6/13.
 */

@Controller
@RequestMapping("/navbar")
public class NavbarController {

    @Autowired
    private UserService userService;


    @RequestMapping("/verificationUser")
    @ResponseBody
    public boolean verificationUser(HttpServletRequest request, @ModelAttribute User user) {

        User user2 = userService.searchOne(user.getTel());

        if ( !(user2==null) ) {
            return false;
        }

        return true;
    }

    @RequestMapping("/register")
    public String registerUser(HttpServletRequest request, @ModelAttribute User user) {

        user.setUserAccount(user.getTel());
        userService.insertUser(user);

        return "homepage";
    }

    @RequestMapping("/verification")
    @ResponseBody
    public boolean verificationLogin(HttpServletRequest request) {

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        User user = userService.searchOne(userName);
        Admin admin = userService.searchAdmin(userName);

        if ( user==null && admin==null ) {
            return false;
        }

        if ( user!=null && user.getUserAccount().equals(userName)
                && user.getUserPassword().equals(password) ) {
            return true ;
        }

        if ( admin!=null && admin.getAdminAccount().equals(userName)
                && admin.getAdminPassword().equals(password) ) {
            return true;
        }

        return false;
    }

    @RequestMapping("/login")
    public String loginUser(HttpServletRequest request, HttpSession session) {

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        String userName = request.getParameter("username");
        Admin admin = userService.searchAdmin(userName);

        if ( admin!=null && admin.getAdminAccount().equals(userName)) {
            return "adminManger";
        }

        User user = userService.searchOne(userName);
        session.setAttribute("loginName",user.getNickname() );
        session.setAttribute("loginAccount",user.getUserAccount() );
        return "homepage";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpSession session) {

        session.invalidate();

        return "homepage";
    }

}
