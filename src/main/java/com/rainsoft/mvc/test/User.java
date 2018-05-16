package com.rainsoft.mvc.test;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 用户对象,添加swagger属性描述支持
 * 参考资料:https://jakubstas.com/spring-jersey-swagger-create-documentation/
 */
@ApiModel(value = "用户对象", description = "用户实体类")
public class User implements Serializable{

	private static final long serialVersionUID = -986960169531607635L;
	
	
	@ApiModelProperty(value = "商品信息", required = true)
	private String name;
	@ApiModelProperty(value = "密码", required = true)
	private String password;

	@ApiModelProperty(value = "性别",hidden=true)
	private Integer sex;
	@ApiModelProperty(value = "令牌", required = true)
	private String token;

	public User() {
		super();
	}

	public User(String name, String password, Integer sex, String token) {
		super();
		this.name = name;
		this.password = password;
		this.sex = sex;
		this.token = token;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

}
