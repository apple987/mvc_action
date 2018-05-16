package test;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class TestMutiSort {
    public static void main(String[] args) {
    	Map<String,Object> param=new HashMap<String,Object>();
		param.put("sort", "");
		param.put("order", "asc");
		param.put("offset", 0);
		param.put("limit", 1);
		param.put("multiSort[0][sortName]", "endTime");
		param.put("multiSort[0][sortOrder]", "asc");
		param.put("multiSort[1][sortName]", "startTime");
		param.put("multiSort[1][sortOrder]", "desc");
		String json=JSON.toJSONString(param);
		Sort s=JSON.parseObject(json, Sort.class);
		System.err.println(s.getOrder()+"\t"+s.getSort()+"\t"+JSON.toJSONString(s.getMultiSort()));
	}
}
