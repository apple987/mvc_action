package com.rainsoft.util;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

import javax.servlet.http.HttpServletRequest;




/**
 * 创建导出word文件 操作类
 *  改进2015/10/10：
 *   1.将模本ftl文件全部配置到webApp的一个文件里面读取
 *   2.原版的是将所有的ftl模本文件，放在程序的一个包目录下
 *   3.两者对比发现，第二种相对安全性会高一些，ftl在包目录下时，浏览器不能直接访问该目录下的ftl文件
 *     相反，浏览器确可以直接访问在webapp文件下的ftl文件。不知道当ftl模板过多时，哪一种性能会更高一下
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class WordUtil{
	private static Configuration configuration = null;
	private static Map<String, Template> allTemplates = null;
	private static String tempDir = "/com/fwd/common/util";// 所有的ftl模板默认包:
	private static HttpServletRequest request=null;

	@SuppressWarnings("deprecation")
	public static void init(HttpServletRequest request) {
		WordUtil.request = request;
		tempDir = getFtlPath(WordUtil.request);// 动态得到包的所在路径
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
		allTemplates = new HashMap();
		//自动将tempDir文件夹下面所有的.ftl文件都加载到allTemplates里面去
		try {
			File temp_file = new File(tempDir);
			configuration.setDirectoryForTemplateLoading(temp_file);
			configuration.setObjectWrapper(new DefaultObjectWrapper());
			File[] arr = temp_file.listFiles();
			for (int i = 0; i < arr.length; i++) {
				if (arr[i].getName().endsWith(".ftl")) {
					String allName = arr[i].getName();
					String keyName = allName.substring(0,allName.lastIndexOf(".ftl"));
					//ftl模板
					Template temp =configuration.getTemplate(allName);
					temp.setEncoding("utf-8");
					allTemplates.put(keyName,temp);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} 
	}
	
	private WordUtil() {
		throw new AssertionError();
	}
	/**
	 * 自动获取项目的freemark文件
	 *      目录下面的ftl模本文件路径
	 * @param request
	 * @return
	 */
	public static String getFtlPath(HttpServletRequest request) {
		String temPath=request.getSession().getServletContext().getRealPath("/") + "freemark";
		return temPath;
	}

	public static File createDoc(Map<?, ?> dataMap, String wordTempKey) {
		String temp_name = wordTempKey + (int) (Math.random() * 100000)+ ".doc";
		File tempFile = new File(temp_name);
		Template t = allTemplates.get(wordTempKey);
		try {
			// 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
			Writer w = new OutputStreamWriter(new FileOutputStream(tempFile),"utf-8");
			t.process(dataMap, w);
			w.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
		return tempFile;
	}
	
}
