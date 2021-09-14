package com.ldu.service;

import com.ldu.pojo.Catelog;
import com.ldu.pojo.Comments;

import java.util.List;

/**
 * Created by swx on 2021/3/9.
 */
public interface CommentsService {
    int deleteByPrimaryKey(Integer id);

    int insert(Comments record);

    int insertSelective(Comments record);

    Comments selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comments record);

    int updateByPrimaryKeyWithBLOBs(Comments record);

    int updateByPrimaryKey(Comments record);
}
