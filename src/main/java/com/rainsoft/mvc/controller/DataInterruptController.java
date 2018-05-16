package com.rainsoft.mvc.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.DataInterrupt;
import com.rainsoft.mvc.model.Student;
import com.rainsoft.mvc.service.DataInterruptService;
import com.rainsoft.mvc.service.StudentService;
import com.rainsoft.util.ExcelUtil;
import com.rainsoft.util.Function;

import springfox.documentation.annotations.ApiIgnore;


@ApiIgnore
@Controller
@RequestMapping("/dataInterrupt")
public class DataInterruptController extends BaseController {
	
	
	@Autowired
	DataInterruptService dataInterruptService;
	
	@Autowired
	StudentService studentService;
	
	
	
	@RequestMapping("/init")
	public  String init(HttpServletRequest req,HttpServletResponse resp){
		System.err.println("2222");
		System.err.println(req.getAttribute("name"));
		return "dataInterrupt"; 
	}
	/**
	 *测试freemarker 
	 */
	@RequestMapping("/freemarker")
	public  String freemarker(HttpServletRequest req,HttpServletResponse resp){
		System.err.println("freemarker");
		System.err.println(req.getAttribute("name"));
		List<Student> arr=studentService.selectList(null);
		req.setAttribute("list", arr);
		if(CollectionUtils.isNotEmpty(arr)){
			req.setAttribute("map", arr.get(0));
		}
		return "dataInterrupt1"; 
	}
	
	@RequestMapping("/init1")
	public  String init1(){
		DataInterrupt dt=new DataInterrupt();
		dt.setBreakSource("1");
		dt.setStatus("1");
		dt.setEndTime(new Date());
		dt.setImportTime(new Date());
		dt.setStartTime(new Date());
		dataInterruptService.insert(dt);
		return "dataInterrupt"; 
	}
   /**
    * 查询分页
    * @param request
    * @param response
    * @param param
    * @return
    */
	//@RequestMapping(value="/getPage",headers="Accept=application/x-www-form-urlencoded")
	@RequestMapping(value="/getPage")
	@ResponseBody
	@Function("中断列表")
	public Object getPage(@RequestParam Map<String, Object> param) {
	     return responseSelectPage(dataInterruptService.selectPage(param));
	}
	/**
	 * 强制限制必须采用 application/json方式,其他不支持
	 * @param s
	 * @return
	 */
	/*@RequestMapping(value="/getPage",headers="Accept=application/json")
	//@RequestMapping(value="/getPage")
	@ResponseBody
	@Function("中断列表")
	public Object getPage(@RequestHeader("Accept") String encoding,@RequestBody DataInterrupt param) {
		System.err.println(encoding);
		return responseSelectPage(dataInterruptService.selectPage(param));
	}*/


	
	/**
	 * 处理数据
	 */
	/*@RequestMapping("/update")
	@ResponseBody
	@Function("处理数据")
	public Object update(@RequestParam Map<String,Object> param) {
		DataInterrupt dit=JSON.parseObject(CoreUtil.getNotNullStr(param.get("RowData")), DataInterrupt.class);
		return dataInterruptService.update(dit);
	}*/
	
	@RequestMapping("/update")
	@ResponseBody
	@Function("处理数据")
	public Object update(@RequestBody DataInterrupt dit) {
		return dataInterruptService.update(dit);
	}
	
	
	
	@RequestMapping("/test")
	/*@CrossOrigin(origins = "http://kbiao.me",maxAge=3600)*/
	@CrossOrigin(origins = "*",maxAge=3600)
	@ResponseBody
	@SuppressWarnings("unchecked")
	public Object test(@RequestParam Map<String, Object> param) {
		System.err.println("获取参数"+param);
		Map<String, Object> arg=new HashMap<String, Object>();
		arg.put("status", 1);
		//测试启用驼峰转换
		List<DataInterrupt> res= (List<DataInterrupt>) dataInterruptService.queryData(arg);
		//测试mybatis查询数据库,直接配置resultType="java.util.HashMap"时,显示的key全部是大写(以前项目Oracle会出现,本处Mysql暂时没有看到)
	    /*Map<String,Object> res=dataInterruptService.testCase(param);*/
	    return res;
	}
	
	
	@RequestMapping("/exportCsv")
	public void exportCsv(HttpServletResponse response) throws UnsupportedEncodingException {
			
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String csvFileName = "场所列表"+format.format(new Date())+".csv";
		csvFileName=new String(csvFileName.getBytes("GB2312"), "8859_1");
		response.setContentType("text/html;charset=GBK");
		// createsmockdata
		String headerKey = "Content-Disposition";
		String headerValue = String.format("attachment;filename=\"%s\"",
				csvFileName);
		response.setHeader(headerKey, headerValue);
		// CSV文件头
		Object[] FILE_HEADER = { "数据类型", "中断开始时间", "中断结束时间", "处理状态"};
		CSVPrinter csvFilePrinter = null;
		// 创建CSVFormat
		CSVFormat csvFileFormat = CSVFormat.DEFAULT.withRecordSeparator("\n");
		try {
			// 初始化CSVPrinter
			csvFilePrinter = new CSVPrinter(response.getWriter(), csvFileFormat);
			// 创建CSV文件头
			csvFilePrinter.printRecord(FILE_HEADER);

			// 用户对象放入List
			@SuppressWarnings("unchecked")
			List<DataInterrupt> list =(List<DataInterrupt>) dataInterruptService.selectList(null);

			// 遍历List写入CSV
			for (DataInterrupt dt : list) {
				List<Object> record = new ArrayList<Object>();
				record.add(JSON.toJSONStringWithDateFormat(dt.getBreakSource(),"yyyy-MM-dd HH:mm:ss"));
				record.add(JSON.toJSONStringWithDateFormat(dt.getStartTime(),"yyyy-MM-dd HH:mm:ss"));
				record.add(JSON.toJSONStringWithDateFormat(dt.getEndTime(),"yyyy-MM-dd HH:mm:ss"));
				record.add(dt.getStatus());
				csvFilePrinter.printRecord(record);
			}
		} catch (Exception e) {

		}finally{
			try {
				csvFilePrinter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	/**
	 * 导出Excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportPoiExcel")
	public void exportPoiExcel(HttpServletRequest request, HttpServletResponse response) {
		try {

			int size = 50000;
			int totalPageNum = 0;
			int total = 0;
			
			/*if(!StringUtils.isBlank(userId)|| null!=userId || !StringUtils.isBlank(userPhone) || null!=userPhone || !StringUtils.isBlank(status) || null!=status || !StringUtils.isBlank(realname) || null!=realname || !StringUtils.isBlank(idNumber) || null!=idNumber|| !StringUtils.isBlank(createTime) || null!=createTime || !StringUtils.isBlank(beginTime) || null!=beginTime){
				totalPageNum = userService.selectUserCount(params);
				if (totalPageNum > 0) {
					if (totalPageNum % size > 0) {
						total = totalPageNum / size + 1;
					} else {
						total = totalPageNum / size;
					}
				}
			}*/
			totalPageNum =50000*3;
			if (totalPageNum > 0) {
				if (totalPageNum % size > 0) {
					total = totalPageNum / size + 1;
				} else {
					total = totalPageNum / size;
				}
			}
			OutputStream os = response.getOutputStream();
			response.reset();// 清空输出流
			ExcelUtil.setFileDownloadHeader(request, response, "用户列表.xls");
			response.setContentType("application/msexcel");// 定义输出类型
			SXSSFWorkbook workbook = new SXSSFWorkbook(15000);
			
			
			String[] titles = { "数据类型", "中断开始时间", "中断结束时间", "处理状态"};
			for (int i = 1; i <= total; i++) {
				List<DataInterrupt> userList =(List<DataInterrupt>) dataInterruptService.selectList(null);
				List<Object[]> contents = new ArrayList<Object[]>();
				for (DataInterrupt data : userList) {
					Object[] conList = new Object[titles.length];
					conList[0] = data.getBreakSource();
					conList[1] = data.getStartTime();
					conList[2] = data.getEndTime();
					conList[3] = data.getStatus();
					contents.add(conList);
				}
				ExcelUtil.buildExcel(workbook, "POI用户列表", titles, contents, i, total, os);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		
}
