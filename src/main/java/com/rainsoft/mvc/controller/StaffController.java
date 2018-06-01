package com.rainsoft.mvc.controller;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.rainsoft.core.BaseController;
import com.rainsoft.mvc.model.Staff;
import com.rainsoft.mvc.service.StaffService;
import com.rainsoft.util.ConfigUtils;
import com.rainsoft.util.Function;
import com.rainsoft.util.SerialNo;
import com.rainsoft.util.ZxingQRCode;

import springfox.documentation.annotations.ApiIgnore;

/**
 * TODO 本代码由代码生成工具生成
 * @付为地
 * @date 2017-04-17 10:00:04
 */
@ApiIgnore
@Controller
@RequestMapping("/staff")
public class StaffController extends BaseController{
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
    @Resource(name="staffService")
	private StaffService staffService;
    
    @Resource(name = "javaMailSender")
	private JavaMailSenderImpl  javaMailSender;
	
	@Resource(name = "mailInfo")
	private Properties  mailInfo;
	
	
	/**
	 *  初始化页面
	 */
	@RequestMapping("/init")
	public String init(HttpServletRequest request,HttpServletResponse response){
		return "staff/selectStaff";
	}
        
    /**
	 * StaffController查询表格数据
	 * @param param
	 */
    @RequestMapping("/selectPage")
	@ResponseBody
	@Function("staff列表")
	public Object selectPage(@RequestParam Map<String, Object> param) {
	     return responseSelectPage(staffService.selectPage(param));
	}
    
	/**
	 * 跳转添加
	*/
    @RequestMapping(value="/preInsert",method=RequestMethod.GET)
	public String preInsert(HttpServletRequest req){
		return "staff/insertStaff";
	} 
    
    /**
     * 添加数据
     */
	@RequestMapping(value="/insert",method=RequestMethod.PUT)
	@ResponseBody
	@Function("添加")
	public Boolean insert(@RequestBody Staff entity) {
		entity.setPkid(SerialNo.getUNID());
		return staffService.insert(entity)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
    /**
	 * 跳转更新
	*/
    @RequestMapping(value="/preUpdate",method=RequestMethod.GET)
	public String preUpdate(HttpServletRequest request){
	    request.setAttribute("staff", staffService.view(request.getParameter("pkid")));
		return "staff/updateStaff";
	} 
    
    /**
     * 更新数据
     */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	@Function("更新")
	public Boolean update(Staff entity) {
		return staffService.update(entity)>0?Boolean.TRUE:Boolean.FALSE;
	}
	
    /**
     * 删除数据
     */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	@Function("删除")
	public Boolean delete(@RequestBody List<Staff> ids) {
		if(!CollectionUtils.isEmpty(ids)){
			String[] arr=new String[ids.size()];
			for (int i = 0; i < ids.size(); i++) {
				arr[i]=ids.get(i).getPkid();
			}
			return staffService.delete(arr)>0?Boolean.TRUE:Boolean.FALSE;
		}
		return Boolean.TRUE;
		
		
	}
   /*************************************************staff页面方法****************************************************************/
    /**
	* 初始化页面
	*/
	@RequestMapping("/")
	public String welcome(HttpServletRequest request,HttpServletResponse response){
		return "staff";
	}
    /**
   	 * StaffController添加数据
   	 * @param param
   	 */
       @RequestMapping("/insertStaff")
   	@ResponseBody
   	@Function("staff添加")
   	public Object insert(@RequestParam Map<String, Object> param) {
   	     Staff bean=JSON.parseObject(JSON.toJSONString(param), Staff.class);
   	     return staffService.insert(bean);
   	}
    /**
   	 * StaffController更新数据
   	 * @param param
   	 */
       @RequestMapping("/updateStaff")
   	@ResponseBody
   	@Function("staff更新")
   	public Object update(@RequestParam Map<String, Object> param) {
   	     Staff bean=JSON.parseObject(JSON.toJSONString(param), Staff.class);
   	     return staffService.update(bean);
   	}

       /**
   	 * StaffController删除数据
   	 * @param param
   	 */
       @RequestMapping("/deleteStaff")
   	@ResponseBody
   	@Function("staff删除")
   	public Object delete(@RequestParam Map<String, Object> param) {
       	 Staff bean=JSON.parseObject(JSON.toJSONString(param), Staff.class);
   	     return staffService.delete(bean.getPkid());//主键;
   	}   
       
       
       
	@RequestMapping("/toQrcode")
	public String toQrcode(HttpServletRequest request,
			HttpServletResponse response) {
		String content="apple95272591234";
		request.getSession().setAttribute("qrdata", content);
		return "qr_code";
	}
	
	/*@RequestMapping("/getQrcode")
	public void getQrcode(HttpServletRequest request,
			HttpServletResponse response) {
		log.debug("执行生成二维码: StaffController.getQrcode()");
		try {
			String content=(String) request.getSession().getAttribute("qrdata");
			//生成带图标的二维码
			BufferedImage img=QRCode.qRCodeCommon(content,ConfigUtils.getString("qrcode.logo"),28);
			//生成二维码QRCode图片  
            ImageIO.write(img, "jpg", response.getOutputStream());
		} catch (Exception e) {
			log.error("执行生成二维码: StaffController.getQrcode() 异常", e);
		}
		log.info("执行生成二维码: StaffController.getQrcode() 完毕");
	}*/
	
	@RequestMapping("/toZxingQrcode")
	public String toZxingQrcode(HttpServletRequest request,
			HttpServletResponse response) {
		String content="apple95272591234";
		request.getSession().setAttribute("qrdata", content);
		return "zxing_qr_code";
	}
	@RequestMapping("/getZxingQrcode")
	public void getZxingQrcode(HttpServletRequest request,
			HttpServletResponse response) {
		log.debug("执行生成二维码: StaffController.getZxingQrcode()");
		try {
			String content=(String) request.getSession().getAttribute("qrdata");
			//生成带图标的二维码
			/*BufferedImage img=ZxingQRCode.genBarcode(content, 512, 512, ConfigUtils.getString("qrcode.logo"));*/
			BufferedImage img=ZxingQRCode.genBarcode(content, 38, ConfigUtils.getString("qrcode.logo"));
			//生成二维码QRCode图片  
            ImageIO.write(img, "jpg", response.getOutputStream());
		} catch (Exception e) {
			log.error("执行生成二维码: StaffController.getZxingQrcode() 异常", e);
		}
		log.info("执行生成二维码: StaffController.getZxingQrcode() 完毕");
	}
	/**
	 *发送邮件，可以发送简单文本，歌曲，图片，视频(太大，暂时发送不成功)
	 * @param args
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	@RequestMapping("/sendEMail")
	@ResponseBody
	public Object baseMailTest() {
		Map<String,Object> result=getRootMap();
		try {
			System.out.println("配置属性是:" + mailInfo);
			Session session = Session.getInstance(mailInfo);
			javaMailSender.setSession(session); // 为发送器指定会话
			MimeMessage msg = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			helper.setFrom(mailInfo.getProperty("mail.username"));//来源方
			helper.setTo("chenhuijun@17money.com");//目标方
			helper.setTo("1335157415@qq.com");//目标方
			helper.setText(
					"<font color='red'>萌妹纸邀请你,一起听歌曲! http://music.baidu.com/?from=new_mp3</font>",
					true);//邮件文本内容
			helper.setSubject(">王大锤<邀请你一起听歌曲");//邮件主题
			// 增加zip 附件
//			FileSystemResource zip = new FileSystemResource(new File("D:\\mail\\paykey.zip"));
//			helper.addAttachment("paykey.zip", zip);
			// 增加zip 附件
//			FileSystemResource txt = new FileSystemResource(new File("D:\\mail\\广发响应.txt"));
//			helper.addAttachment("广发响应.txt", txt);
			//增加歌曲
//			FileSystemResource mp3 = new FileSystemResource(new File("D:\\mail\\A.mp3"));
//			helper.addAttachment("A.mp3", mp3);
			FileSystemResource mp31 = new FileSystemResource(new File("D:\\mail\\B.mp3"));
			helper.addAttachment("王大锤.mp3", mp31);
			//增加图片
//			FileSystemResource img1 = new FileSystemResource(new File("D:\\mail\\img1.jpg"));
//			helper.addAttachment("img1.jpg", img1);
//			FileSystemResource img2 = new FileSystemResource(new File("D:\\mail\\img2.jpg"));
//			helper.addAttachment("img2.jpg", img1);
			//增加视频
//			FileSystemResource vedio = new FileSystemResource(new File("D:\\mail\\dance.mp4"));
//			helper.addAttachment("dance.mp4", vedio);
			javaMailSender.send(msg);
			System.out.println("email send ok");
			result.put("status", "200");
		} catch (MessagingException e) {
			System.out.println("send fail");
			e.printStackTrace();
			result.put("status", "400");
		}
		return result;
	}
}
