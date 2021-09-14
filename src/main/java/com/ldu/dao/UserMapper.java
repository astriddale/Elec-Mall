package com.ldu.dao;

import org.apache.ibatis.annotations.Param;

import com.ldu.pojo.User;

import java.util.List;

public interface UserMapper{
    //根据主键删除
    int deleteByPrimaryKey(Integer id);
    //插入用户
    int insert(User record);
    //
    int insertSelective(User record);
    //根据主键查询
    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    //通过手机号查询用户
    User getUserByPhone(String phone);
    //更改用户的商品数量
    int updateGoodsNum(@Param("id") Integer id, @Param("goodsNum") Integer goodsNum);
    //获取所有用户
    public List<User> getUserList();

	int findCount();

	User getUserById(int id);

	List<User> getUserListByUser(@Param("phone") String phone,@Param("username") String username,@Param("qq") String qq);

	List<User> getUserListOrderByCreateAt();
}