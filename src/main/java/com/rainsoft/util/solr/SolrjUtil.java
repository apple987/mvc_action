package com.rainsoft.util.solr;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SolrjUtil {
	
	//定义http的solr服务
	@Autowired
    private HttpSolrServer httpSolrServer;

	public SolrjUtil(HttpSolrServer httpSolrServer) {
		this.httpSolrServer = httpSolrServer;
	}
  
	/**
	 * 新增或更新数据到solr服务
	 * 当Foo
	 */
	public void merge(Foo foo) throws Exception{
		this.httpSolrServer.addBean(foo);
		this.httpSolrServer.commit();
	}
	/**
	 * 删除
	 */
	public void delete(List<String> ids) throws Exception{
		this.httpSolrServer.deleteById(ids);;
		this.httpSolrServer.commit();
	}
	
	/**
	 * 查询
	 * @keywords:关键字
	 */
	public List<Foo> search(String keywords,Integer page,Integer rows) throws Exception{
		SolrQuery solrQuery=new SolrQuery();
		/*solrQuery.setQuery("title:"+keywords);//搜索关键字,不指定就使用默认字段查询*/
		solrQuery.setQuery(keywords);//搜索关键字,不指定就使用默认字段查询
		solrQuery.setStart((Math.max(page,1)-1)*rows);
		solrQuery.setRows(rows);
		//是否需要高亮
		boolean isHighlighting=!StringUtils.equals("*", keywords)&&StringUtils.isNotEmpty(keywords);
		if(isHighlighting){
			//设置高亮
			solrQuery.setHighlight(Boolean.TRUE);//开启高亮
			solrQuery.addHighlightField("title");//设置高亮字段
			solrQuery.setHighlightSimplePre("<em>");//标记高亮关键字前缀
			solrQuery.setHighlightSimplePost("</em>");//标记高亮关键字后缀
		}
		//执行查询
		QueryResponse queryResponse=this.httpSolrServer.query(solrQuery);
	    List<Foo> foos=queryResponse.getBeans(Foo.class);
	    if(isHighlighting){
	    	//将高亮标题数据写入数据对象中
	    	Map<String,Map<String,List<String>>> map=queryResponse.getHighlighting();
	    	for(Map.Entry<String,Map<String,List<String>>> highlighting:map.entrySet()){
	    		for(Foo foo:foos){
	    			if(!highlighting.getKey().equals(foo.getId().toString())){
	    				continue;
	    			}
	    			foo.setTitle(StringUtils.join(highlighting.getValue().get("title"),""));
	    			break;
	    		}
	    	}
	    }
		return foos;
	}
	
	/**
	 * 删除查询结果
	 * query格式如下
	 *  field:keywords
	 *  删除全部 *:*
	 */
	public void deleteByQuery(String query) throws Exception{
		this.httpSolrServer.deleteByQuery(query);
		this.httpSolrServer.commit();
	}
	
	
}
