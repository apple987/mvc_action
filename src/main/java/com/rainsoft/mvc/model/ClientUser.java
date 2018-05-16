package com.rainsoft.mvc.model;

import java.util.Date;


import org.springframework.format.annotation.DateTimeFormat;

import com.rainsoft.util.MutiSort;

import io.swagger.annotations.ApiModel;

import io.swagger.annotations.ApiModelProperty;

/**
  *该代码由付为地的编码机器人自动生成
  *时间：2017-12-28 21:14:09
*/
@ApiModel(value = "用户", description = "ClientUser实体类") 
public class ClientUser  extends MutiSort {

    private static final long serialVersionUID = 1L;

    // Fields

    @ApiModelProperty(value = "pkid", required = true) 
    private String pkid;
    @ApiModelProperty(value = "用户名", required = true) 
    private String uname;//用户名
    @ApiModelProperty(value = "登录密码(MD5加密）", required = true) 
    private String password;//登录密码(MD5加密）
    @ApiModelProperty(value = "用户状态0:冻结1 启用 2注销 3未激活", required = false) 
    private String status;//用户状态0:冻结1 启用 2注销 3未激活
    @ApiModelProperty(value = "备注信息", required = false) 
    private String memo;//备注信息
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "用户创建时间", required = false) 
    private Date createDate;//用户创建时间
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "最近登录时间", required = false) 
    private Date loginDate;//最近登录时间
    @ApiModelProperty(value = "用户邮箱", required = false) 
    private String email;//用户邮箱
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "账号激活时间", required = false) 
    private Date activedate;//账号激活时间
    @ApiModelProperty(value = "邮箱激活的验证码", required = false) 
    private String remark;//邮箱激活的验证码
    @ApiModelProperty(value = "忘记密码时，存储用户唯一操作码", required = false) 
    private String remark1;//忘记密码时，存储用户唯一操作码
    @ApiModelProperty(value = "备用字段2", required = false) 
    private String remark2;//备用字段2
    @ApiModelProperty(value = "备用字段3", required = false) 
    private String remark3;//备用字段3
    
    // Constructors

    /** default constructor */
    public ClientUser() {
    }

    // Property accessors

    public void setPkid(String pkid) {
        this.pkid = pkid;
    }

    public String getPkid() {
        return this.pkid;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUname() {
        return this.uname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return this.password;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return this.status;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getMemo() {
        return this.memo;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public Date getLoginDate() {
        return this.loginDate;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setActivedate(Date activedate) {
        this.activedate = activedate;
    }

    public Date getActivedate() {
        return this.activedate;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setRemark1(String remark1) {
        this.remark1 = remark1;
    }

    public String getRemark1() {
        return this.remark1;
    }

    public void setRemark2(String remark2) {
        this.remark2 = remark2;
    }

    public String getRemark2() {
        return this.remark2;
    }

    public void setRemark3(String remark3) {
        this.remark3 = remark3;
    }

    public String getRemark3() {
        return this.remark3;
    }

}