package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
    void insert(User user);
    User queryOne(User user);
}
