package test;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
public class MailTest extends TimerTask{
	
	public MailTest(){
		//baseMailTest();
	}

	/**
	 *发送邮件，可以发送简单文本，歌曲，图片，视频(太大，暂时发送不成功)
	 * @param args
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static void baseMailTest() {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext(
					new String[] { "classpath:spring/spring-*",
							"classpath:spring-mvc.xml" });
			JavaMailSenderImpl sender = (JavaMailSenderImpl) ctx
					.getBean("javaMailSender");
			Properties props = (Properties) ctx.getBean("mailInfo");
			System.out.println("读取的属性是:" + sender.getHost() + "\t"
					+ sender.getPort() + "\t" + sender.getUsername() + "\t"
					+ sender.getPassword());
			;
			System.out.println("配置属性是:" + props);
			Session session = Session.getInstance(props);
			sender.setSession(session); // 为发送器指定会话
			MimeMessage msg = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			helper.setFrom(props.getProperty("mail.username"));//来源方
//			helper.setTo("chenhuijun@17money.com");//目标方
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
			
			sender.send(msg);
			System.out.println("email send ok");

		} catch (MessagingException e) {
			System.out.println("send fail");
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws UnsupportedEncodingException, InterruptedException {
//		MailTest.baseMailTest();
//		Timer timer = new Timer(); 
//		timer.schedule(new MailTest(), new Date(), 1000*60);//5分钟发一次
		while(true){
			baseMailTest();
			Thread.sleep(10000);
		}
	}

	/**
	 * 扩展发送邮件
	 */
	public static void extendMailTest() {
		try {
			ApplicationContext ctx = new ClassPathXmlApplicationContext(
					new String[] { "classpath:spring/applicationContext*",
							"classpath:springMVC.xml" });
			JavaMailSenderImpl sender = (JavaMailSenderImpl) ctx
					.getBean("javaMailSender");
			Properties props = (Properties) ctx.getBean("mailInfo");
			System.out.println("读取的属性是:" + sender.getHost() + "\t"
					+ sender.getPort() + "\t" + sender.getUsername() + "\t"
					+ sender.getPassword());
			;
			System.out.println("配置属性是:" + props);
			Session session = Session.getInstance(props);
			sender.setSession(session); // 为发送器指定会话
			MimeMessage msg = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
			/*
			 * helper.setFrom(props.getProperty("mail.username"));
			 * helper.setTo("1335157415@qq.com"); helper.setText(
			 * "<font color='red'>帅锅锅邀请你,这是一个SpringMVC的简单,邮件发送示例!</font>",
			 * true); helper.setSubject("测试邮件标题");
			 */
			// 正文
			MimeBodyPart body = new MimeBodyPart();
			body.setContent("我勒个去一天", "text/html;charset=utf-8");
			MimeMultipart multipart = helper.getMimeMultipart();
			multipart.addBodyPart(body);
			msg.saveChanges();
			msg.setContent(multipart);
			Transport.send(msg);
			sender.send(msg);
			System.out.println("email send ok");

		} catch (MessagingException e) {
			System.out.println("send fail");
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		System.out.println("run 一把!");
    	baseMailTest();
	}

}
