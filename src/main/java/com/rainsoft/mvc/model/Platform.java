package com.rainsoft.mvc.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.rainsoft.util.MutiSort;

/**
  *该代码由付为地的编码机器人自动生成
  *时间：2017-07-11 10:55:12
*/
public class Platform  extends MutiSort {

    private static final long serialVersionUID = 1L;

    // Fields

    private Integer id;
    private String platformName;//平台名称
    private String platformAbout;//平台简介
    private String platformSite;//平台官网
    private String onlineTime;//平台上线时间
    private String companyName;//公司名称
    private String legal;//公司法人
    private String registerCapita;//注册资金
    private String scale;//公司规模
    private String address;//公司地址
    private String qqGroup;//QQ群
    private String trusteeship;//资金托管
    private String kefuPhone;//客服电话
    private String logo;//公司logo
    private String province;//省份
    private String city;//城市
    private String sta;//状态（0：终止合作 1：合作）
    private String bankBg;//银行背景
    private String vcBg;//风投背景
    private String icpBg;//ICP背景
    private String gzBg;//国资背景
    private String marketBg;//上市公司背景
    private String myBg;//民营背景
    private String bdAttorn;//可否转让（标的流动性 ）
    private String bdInterestDay;//起息时间（标的流动性 ）
    private String bdAuto;//自动投标（标的流动性 ）
    private String bdExit;//退出方式（标的流动性 ）
    private String withCahDay;//提现到账时间（标的流动性 ）
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createDate;//创建时间
    private String createBy;//创建人
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateDate;//修改时间
    private String updateBy;//修改人
    
    // Constructors

    /** default constructor */
    public Platform() {
    }

    // Property accessors

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return this.id;
    }

    public void setPlatformName(String platformName) {
        this.platformName = platformName;
    }

    public String getPlatformName() {
        return this.platformName;
    }

    public void setPlatformAbout(String platformAbout) {
        this.platformAbout = platformAbout;
    }

    public String getPlatformAbout() {
        return this.platformAbout;
    }

    public void setPlatformSite(String platformSite) {
        this.platformSite = platformSite;
    }

    public String getPlatformSite() {
        return this.platformSite;
    }

    public void setOnlineTime(String onlineTime) {
        this.onlineTime = onlineTime;
    }

    public String getOnlineTime() {
        return this.onlineTime;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyName() {
        return this.companyName;
    }

    public void setLegal(String legal) {
        this.legal = legal;
    }

    public String getLegal() {
        return this.legal;
    }

    public void setRegisterCapita(String registerCapita) {
        this.registerCapita = registerCapita;
    }

    public String getRegisterCapita() {
        return this.registerCapita;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getScale() {
        return this.scale;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return this.address;
    }

    public void setQqGroup(String qqGroup) {
        this.qqGroup = qqGroup;
    }

    public String getQqGroup() {
        return this.qqGroup;
    }

    public void setTrusteeship(String trusteeship) {
        this.trusteeship = trusteeship;
    }

    public String getTrusteeship() {
        return this.trusteeship;
    }

    public void setKefuPhone(String kefuPhone) {
        this.kefuPhone = kefuPhone;
    }

    public String getKefuPhone() {
        return this.kefuPhone;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getLogo() {
        return this.logo;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getProvince() {
        return this.province;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return this.city;
    }

    public void setSta(String sta) {
        this.sta = sta;
    }

    public String getSta() {
        return this.sta;
    }

    public void setBankBg(String bankBg) {
        this.bankBg = bankBg;
    }

    public String getBankBg() {
        return this.bankBg;
    }

    public void setVcBg(String vcBg) {
        this.vcBg = vcBg;
    }

    public String getVcBg() {
        return this.vcBg;
    }

    public void setIcpBg(String icpBg) {
        this.icpBg = icpBg;
    }

    public String getIcpBg() {
        return this.icpBg;
    }

    public void setGzBg(String gzBg) {
        this.gzBg = gzBg;
    }

    public String getGzBg() {
        return this.gzBg;
    }

    public void setMarketBg(String marketBg) {
        this.marketBg = marketBg;
    }

    public String getMarketBg() {
        return this.marketBg;
    }

    public void setMyBg(String myBg) {
        this.myBg = myBg;
    }

    public String getMyBg() {
        return this.myBg;
    }

    public void setBdAttorn(String bdAttorn) {
        this.bdAttorn = bdAttorn;
    }

    public String getBdAttorn() {
        return this.bdAttorn;
    }

    public void setBdInterestDay(String bdInterestDay) {
        this.bdInterestDay = bdInterestDay;
    }

    public String getBdInterestDay() {
        return this.bdInterestDay;
    }

    public void setBdAuto(String bdAuto) {
        this.bdAuto = bdAuto;
    }

    public String getBdAuto() {
        return this.bdAuto;
    }

    public void setBdExit(String bdExit) {
        this.bdExit = bdExit;
    }

    public String getBdExit() {
        return this.bdExit;
    }

    public void setWithCahDay(String withCahDay) {
        this.withCahDay = withCahDay;
    }

    public String getWithCahDay() {
        return this.withCahDay;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateBy() {
        return this.createBy;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

}