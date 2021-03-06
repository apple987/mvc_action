package com.rainsoft.util.solr;

import java.io.Serializable;
import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "SolrJ实体类", description = "SolrJ实体类")
public class Foo  implements Serializable{
     
	private static final long serialVersionUID = -1359428391586519332L;
	//@Field注解标记对应字段跟solr的schema.xml配置项对应起来
	@Field("id") 
	@ApiModelProperty(value = "主键", position=2,required = true)
	private String id;
	@Field("title")
	@ApiModelProperty(value = "标题",position=1, required = true)
	private String title;
	@Field("price") 
	@ApiModelProperty(value = "价格",allowableValues="100,200,300",example="100",position=0, required = true)
	private Long price;
	@Field("name") 
	@ApiModelProperty(value = "名称",position=5, required = true)
	private String name;
	@Field("createTime")
	@ApiModelProperty(value = "创建时间",position=4, required = true)	
    private Date createTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString(){
		StringBuilder builder=new StringBuilder();
		builder.append("Foo [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", price=");
		builder.append(price);
		builder.append(", name=");
		builder.append(name);
		builder.append(", createTime=");
		builder.append(createTime);
		builder.append("]");
		return  builder.toString();
	 }
	
}
