package com.ldu.pojo;

import org.springframework.web.multipart.MultipartFile;

/**
 * 用户
 * @author swx
 *
 */
public class User{
    private Integer id;//ID

    private String phone;//手机号

    private String username;//昵称

    private String password;//密码

    private String qq;//QQ号

    private String createAt;//创建时间

    private Integer goodsNum;//电动车数量

    private Integer power;//信用积分

    private String lastLogin;//登录时间

    private Byte status;//状态

    private MultipartFile pic;
    private Integer sh;
    private MultipartFile pic2;
    private String picPath;
    private String picPath2;

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public MultipartFile getPic2() {
        return pic2;
    }

    public void setPic2(MultipartFile pic2) {
        this.pic2 = pic2;
    }

    public Integer getSh() {
        return sh;
    }

    public void setSh(Integer sh) {
        this.sh = sh;
    }

    public MultipartFile getPic() {
        return pic;
    }

    public void setPic(MultipartFile pic) {
        this.pic = pic;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt == null ? null : createAt.trim();
    }

    public Integer getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(Integer goodsNum) {
        this.goodsNum = goodsNum;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin == null ? null : lastLogin.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", phone=" + phone + ", username=" + username + ", password=" + password + ", qq="
				+ qq + ", createAt=" + createAt + ", goodsNum=" + goodsNum + ", power=" + power + ", lastLogin="
				+ lastLogin + ", status=" + status + "]";
	}



    
    
}