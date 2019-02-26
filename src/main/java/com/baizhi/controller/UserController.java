package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/queryOne")
    public @ResponseBody String queryOne(User user){
        User user1 = userService.queryOne(user);
        if (user1!=null){
            return "back/main/main";
        }
        return "back/main/login";
    }
}
