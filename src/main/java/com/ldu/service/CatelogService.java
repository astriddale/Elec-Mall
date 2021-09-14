package com.ldu.service;

import java.util.List;

import com.ldu.pojo.Catelog;

/**
 * Created by swx on 2021/3/9.
 */
public interface CatelogService {
    public List<Catelog> getAllCatelog();
    public int getCount(Catelog catelog);
    Catelog selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(Catelog record);
    int updateCatelogNum(Integer id,Integer number);
}
