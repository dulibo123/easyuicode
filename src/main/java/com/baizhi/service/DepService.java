package com.baizhi.service;

import com.baizhi.entity.Dep;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepService {
    void save(Dep dep);
    void delete(String id);
    void deleteAllEmp(String[] ids);
    void update(Dep dep);
    Dep queryOne(String id);


    //第一个参数代表起始条数，第二个代表每页显示的记录数
    List<Dep> findByPage(Integer page, Integer rows);
    Long findTotal();
}
