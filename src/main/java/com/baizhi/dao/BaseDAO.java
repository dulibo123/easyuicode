package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDAO<T> {
    void save(T t);
    void delete(String id);

    void update(T t);
    T queryOne(String id);
    T query(T t);

    //第一个参数代表起始条数，第二个代表每页显示的记录数
    List<T> findByPage(@Param("start") Integer start, @Param("rows") Integer rows);
    Long findTotal();
}
