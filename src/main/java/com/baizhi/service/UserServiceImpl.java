package com.baizhi.service;

import com.baizhi.dao.UserDAO;
import com.baizhi.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements  UserService {
    @Autowired
    private UserDAO userDAO;
    @Override
    public void insert(User user) {

    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)

    public User queryOne(User user) {
        return userDAO.query(user);
    }
}
