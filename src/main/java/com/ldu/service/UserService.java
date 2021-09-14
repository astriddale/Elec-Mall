package com.ldu.service;

import java.util.List;

import com.ldu.pojo.User;

public interface UserService {
	//添加用户
	public void addUser(User user);

	//根据手机号查找用户
	public User getUserByPhone(String phone);

	//更新用户名
	public void updateUserName(User user);

	//更新订单数量
	int updateGoodsNum(Integer id, Integer goodsNum);

	//根据ID查询用户
	User selectByPrimaryKey(Integer id);

	//获取当前页面的用户
	public List<User> getPageUser(int pageNum, int pageSize);

	//获取用户的数量
	public int getUserNum();

	public int getUserNum(String username);

	//获取页数
	public List<User> getPageUser(int pageNum, int pageSize, String username);

	public User getUserById(int id);

	//根据ID删除用户
	public void deleteUserById(String idArr);

	public List<User> getPageUserByUser(String phone, String username, String qq, int pageNum, int pageSize);

	public List<User> getUserOrderByDate(int size);

}