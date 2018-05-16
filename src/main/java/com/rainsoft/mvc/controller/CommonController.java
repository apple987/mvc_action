package com.rainsoft.mvc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.aspectj.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rainsoft.core.BaseController;
import com.rainsoft.util.ConfigUtils;

import springfox.documentation.annotations.ApiIgnore;
@ApiIgnore
@Controller
@RequestMapping("/")
public class CommonController extends BaseController {
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	/*错误提示页跳转*/
	@RequestMapping("/400")
	public String error400(){
		return "error/500";
	}	
	@RequestMapping("/401")
	public String error401(){
		return "error/401";
	}
	@RequestMapping("/404")
	public String error404(){
		return "error/404";
	}
	@RequestMapping("/406")
	public String error406(){
		return "error/500";
	}	
	@RequestMapping("/500")
	public String error500(){
		return "error/500";
	}
	
	
	@RequestMapping("/")
	public String init(HttpServletRequest req,HttpServletResponse resp) {
		System.err.println(1111);
		req.setAttribute("name", "大神");
		req.setAttribute("fileDirs",FileUtil.listFiles(new File(ConfigUtils.getString("file.dir"))));
		/*return "redirect:/dataInterrupt/init";*/
		return "forward:/dataInterrupt/init";
	}
	/**
	 * 测试freemarker
	 */
	@RequestMapping("/freemarker")
	public String freemarker(HttpServletRequest req,HttpServletResponse resp) {
		System.err.println(1111);
		req.setAttribute("name", "大神");
		req.setAttribute("fileDirs",FileUtil.listFiles(new File(ConfigUtils.getString("file.dir"))));
		/*return "redirect:/dataInterrupt/init";*/
		return "forward:/dataInterrupt/freemarker";
	}
	
	/**
	 * 文件上传 
	 * @param file
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/fileupload")
	@ResponseBody
	public Object fileupload(@RequestParam("vitalPeople") MultipartFile file,HttpServletRequest req,HttpServletResponse resp) {
		Map<String, Object> result=getRootMap();
		String out=ConfigUtils.getString("file.dir");
		if(file!=null){
			File dist=new File(out+"/"+file.getOriginalFilename());
			if(!dist.exists()){
				dist.mkdir();
			}
			try {
				file.transferTo(dist);
				result.put("status", "成功");
				result.put("msg", "成功上传");
			} catch (IllegalStateException e) {
				e.printStackTrace();
				result.put("status", "失败");
				result.put("msg", e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				result.put("status", "失败");
				result.put("msg", e.getMessage());
			}
		}
		result.put("total", 1);
		return result;
	}
	/**
	 * 文件下载
	 * @param req
	 * @param resp
	 * @param fileId
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/downLoad")
	public void downLoad(HttpServletRequest req, HttpServletResponse resp, String fileId) throws ServletException, IOException {
		try {
			/*fileId = Base64Utils.decode(fileId.getBytes(), "UTF-8");*/
			/*fileId = new String(Base64Utils.decode(fileId.getBytes()));*/
			InputStream is = new FileInputStream(new File(ConfigUtils.getString("file.dir")+"/"+ fileId));
			String fileName = fileId.substring(fileId.lastIndexOf("/") + 1);
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "UTF-8"));
			resp.setCharacterEncoding("UTF-8");
			IOUtils.copy(is, resp.getOutputStream());
			is.close();
		} catch (Exception e) {
			req.getRequestDispatcher(req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/error/404").forward(req, resp);
			log.error("文件下载异常:"+e.getMessage());
		}
	}
	
	
	/*public Object uploadAndSaveVitalPeople(MultipartFile file, String handerUri, HttpServletRequest request) {
		List<SerKeyAreaPerson> alarmPersonValuesList=new ArrayList<SerKeyAreaPerson>();
		Map<String, Object> status = new HashMap<>();
		if(null!=file){
			Long lotime=saveFiletoPath(file);
			alarmPersonValuesList=getVitalPeopleFile(lotime.toString()+file.getOriginalFilename());
		}
		if(alarmPersonValuesList.size()>0){
				try{
					for(SerKeyAreaPerson keyPerson: alarmPersonValuesList){
					    featurePeoplesDao.insertVitalPeople(keyPerson);
					}
					int total =alarmPersonValuesList.size();
					long start=System.currentTimeMillis();
					log.info("重点人口导入,总数据量:"+total+"条,开始时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S").format(new Date(start)));
					int pageSize = 50000;//每50000条一批执行
					if(total%pageSize==0){
						for (int i = 0; i < total/pageSize; i++) {
								jdbcVitalPersonInsert(alarmPersonValuesList.subList(i*pageSize, (i+1)*pageSize));
						}
					}else{
						if(total/pageSize==0){
								jdbcVitalPersonInsert(alarmPersonValuesList);
						}else{
							for (int i = 0; i < total/pageSize; i++) {
								jdbcVitalPersonInsert(alarmPersonValuesList.subList(i*pageSize, (i+1)*pageSize));
							}
						}
					}
					long end=System.currentTimeMillis();
					log.info("重点人口导入,执行完毕，结束时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S").format(new Date(end)));
					log.info("重点人口导入,执行完毕，总共历时:"+(end-start)+"毫秒");
					alarmPersonValuesList=(List<SerKeyAreaPerson>) commonDao.batchInsert("com.rainsoft.dao.mybatis.FeaturePeoplesDao.insertVitalPeople", alarmPersonValuesList);
					featurePeoplesDao.updateSysParameter(System.currentTimeMillis());
				} catch (Exception e) {
					e.printStackTrace();
					status.put("error", true);
					status.put("data", "失败");
					return status;
		        }
		}
		Object oa = Array.newInstance(SerKeyAreaPerson.class, alarmPersonValuesList.size());
		for(int i=0; i<alarmPersonValuesList.size(); ++i){
			Array.set(oa, i, alarmPersonValuesList.get(i));
		}
		return oa;
	}*/
	
	/*public List<SerKeyAreaPerson> getVitalPeopleFile(String str){
		List<SerKeyAreaPerson> resArr=new ArrayList<SerKeyAreaPerson>();
		Map<String,Object> temp=new HashMap<String,Object>();
		try {
			File file=new File(Constants.UPLOAD_PATH+str);
			if(file!=null){
				 LineIterator line= IOUtils.lineIterator(new BOMInputStream(FileUtils.openInputStream(file)), "UTF-8");
				 //MAP来执行去除重复/manage_name/certificate_code 联合去重复,必须去掉UTF-8文件开头的BOM标志
				 while(line.hasNext()){//得到一行数据
					 String row=line.next();
					 if(!isEmpty(row)){
						 String[] arr=row.split(",");
						 String key=arr[0].trim()+"_"+arr[1].trim();
						 if(checkFormat(row)&&!temp.containsKey(key)){
							List<Map<String,Object>> areas= featurePeoplesDao.checkAreaName(arr[0].trim());
							if(areas.size()==1){
								arr[0]=(String) areas.get(0).get("ID");
								temp.put(key, arr);
							}
						 }
					 }
				 }
				 Iterator it=temp.keySet().iterator();
				 while(it.hasNext()){
					 //验证行数据是不是正确/验证通过时，再次执行
					  manageName/certificateCode/userName/sex/people/country
					 String key= (String) it.next();
					 String[] arr=(String[]) temp.get(key);
					 SerKeyAreaPerson sk=new SerKeyAreaPerson();
					 sk.setManageId(arr[0].trim());
					 sk.setCertificateCode(arr[1].trim());
					 sk.setUserName(arr[2].trim());
					 sk.setSex(arr[3].trim());
					 sk.setPeople(arr[4].trim());
					 sk.setCountry(arr[5].trim());
					 sk.setCertificateType("111");//默认身份证
					 sk.setDataSource("1");//数据来源、导入 
					 resArr.add(sk);
				 }
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return resArr;
	}*/
	// 重点人单次导入5万每次
	/*	public int jdbcVitalPersonInsert(List<?> arr) throws ClassNotFoundException {
			try {
				String insertOrUpdatePerson = "merge into ser_key_area_person a using (select ? manage_id, '111' certificate_type, ? certificate_code from dual ) b on (a.certificate_code=b.certificate_code and a.certificate_type=b.certificate_type and a.manage_id=b.manage_id ) when matched then update set a.user_name = ?, a.sex = ?, a.birthday=?, a.people=UPPER(?), a.country=?, a.data_source=? when not matched then insert (a.manage_id, a.certificate_type, a.certificate_code, a.user_name, a.sex, a.birthday, a.people, a.country, a.data_source ) values (?,?,?, ?,?,?, UPPER(?),?,?)";
				
				 * String
				 * insertOrUpdatePerson="insert into ser_key_area_person(MANAGE_ID,CERTIFICATE_TYPE,CERTIFICATE_CODE,USER_NAME,SEX,BIRTHDAY,PEOPLE,COUNTRY,DATA_SOURCE)  values (?,?,?, ?,?,?, UPPER(?),?,?)"
				 * ;
				 
//				Object[] conf = commonDao.getJdbcConfig(insertOrUpdatePerson);
				Connection con = datasource.getConnection();
				PreparedStatement prest=con.prepareStatement(insertOrUpdatePerson,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
//				PreparedStatement prest = (PreparedStatement) conf[1];
				for (int i = 0; i < arr.size(); i++) {
					SerKeyAreaPerson skap = (SerKeyAreaPerson) arr.get(i);
					prest.setString(1, skap.getManageId());
					prest.setString(2, skap.getCertificateCode());
					// update
					prest.setString(3, skap.getUserName());
					prest.setString(4, skap.getSex());
					if (isEmpty(skap.getBirthday())) {
						prest.setDate(5, null);
					} else {
						prest.setDate(5, new java.sql.Date(skap.getBirthday().getTime()));
					}
					prest.setString(6, skap.getPeople());
					prest.setString(7, skap.getCountry());
					prest.setString(8, skap.getDataSource());
					// insert
					prest.setString(9, skap.getManageId());
					prest.setString(10, skap.getCertificateType());
					prest.setString(11, skap.getCertificateCode());
					prest.setString(12, skap.getUserName());
					prest.setString(13, skap.getSex());
					if (isEmpty(skap.getBirthday())) {
						prest.setDate(14, null);
					} else {
						prest.setDate(14, new java.sql.Date(skap.getBirthday().getTime()));
					}
					prest.setString(15, skap.getPeople());
					prest.setString(16, skap.getCountry());
					prest.setString(17, skap.getDataSource());
					prest.addBatch();
				}
				prest.executeBatch();
				con.commit();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return arr.size();
		}*/
}
