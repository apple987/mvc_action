package com.rainsoft.mvc.model;

import java.io.Serializable;

import java.util.Date;

/**
  *该代码由付为地的编码机器人自动生成
  *时间：2017-04-17 22:00:05
*/
public class Staff  implements  Serializable {

   private static final long serialVersionUID = 1L;

    // Fields

    private String pkid;
    private String sname;
    private String sex;
    private Integer age;
    private Date createDate;
    private String createby;
    private Date updateDate;
    private byte[] police;
    private String updateby;
    
    // Constructors

    /** default constructor */
    public Staff() {
    }

    // Property accessors

    public void setPkid(String pkid) {
        this.pkid = pkid;
    }

    public String getPkid() {
        return this.pkid;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSname() {
        return this.sname;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSex() {
        return this.sex;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getAge() {
        return this.age;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

    public String getCreateby() {
        return this.createby;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setPolice(byte[] police) {
        this.police = police;
    }

    public byte[] getPolice() {
        return this.police;
    }

    public void setUpdateby(String updateby) {
        this.updateby = updateby;
    }

    public String getUpdateby() {
        return this.updateby;
    }

}