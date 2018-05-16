/*package com.rainsoft.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.swetake.util.Qrcode;
import jp.sourceforge.qrcode.QRCodeDecoder;
import jp.sourceforge.qrcode.data.QRCodeImage;
import jp.sourceforge.qrcode.exception.DecodingFailedException;

*//**
 * 二维码工具
 *//*
public class QRCode {
	private static Log log = LogFactory.getLog(QRCode.class);
	//设置二维码中间logo图片的宽高
	private static int imageWidth = 30;
	private static int imageHeight = 30;
	
    *//**
     * 解析二维码(QRCode)
     * @param imgPath
     * @return
     *//*
    public static  String decoderQRCode(String imgPath) {  
        // QRCode 二维码图片的文件  
        File imageFile = new File(imgPath);  
        BufferedImage bufImg = null;  
        String content = null;  
        try {  
            bufImg = ImageIO.read(imageFile);  
            QRCodeDecoder decoder = new QRCodeDecoder();  
            content = new String(decoder.decode(new QRCodeImageBean(bufImg)), "utf-8");   
        } catch (IOException e) {  
            log.error("decoderQRCode Error: " + e.getMessage());
            e.printStackTrace();  
        } catch (DecodingFailedException dfe) {  
            log.error("decoderQRCode Error: " + dfe.getMessage());
            dfe.printStackTrace();  
        }  
        return content;  
    }  
    *//**  
     * 生成二维码(QRCode)图片  
     * @param content 存储内容  
     * @param imgPath 图片路径  
     * @param imgType 图片类型  
     *//*    
    public static void encoderQRCode(String content, String imgPath, String imgType) {    
        encoderQRCode(content, imgPath, imgType, 7);    
    }  
    *//**  
     * 生成二维码(QRCode)图片  
     * @param content 存储内容  
     * @param imgPath 图片路径  
     * @param imgType 图片类型  
     * @param size 二维码尺寸  
     *//*    
    public static void encoderQRCode(String content, String imgPath, String imgType, int size) {    
        try {    
            BufferedImage bufImg = qRCodeCommon(content,null, size);
            File imgFile = new File(imgPath);    
            // 生成二维码QRCode图片    
            ImageIO.write(bufImg, imgType, imgFile);    
        } catch (Exception e) {    
            e.printStackTrace();    
        }    
    }  
    *//**  
     * 生成二维码(QRCode)图片  
     * @param content 存储内容  
     * @param imgPath 图片路径  
     * @param logoPath 二维码图片中间的logo路径
     * @param imgType 图片类型  
     * @param size 二维码尺寸  
     *//*    
    public static void encoderQRCode(String content, String imgPath,String logoPath, String imgType, int size) {    
        try {    
            BufferedImage bufImg = qRCodeCommon(content,logoPath, size);    
                
            File imgFile = new File(imgPath);    
            // 生成二维码QRCode图片    
            ImageIO.write(bufImg, imgType, imgFile);    
        } catch (Exception e) {    
            e.printStackTrace();    
        }    
    }  
      
    *//**  
     * 生成二维码(QRCode)图片的公共方法  
     * @param content 存储内容  
     * @param imgType 图片类型  
     * @param logoPath 二维码图片中间的logo路径
     * @param size 二维码尺寸  
     * @return  
     *//*    
	public static BufferedImage qRCodeCommon(String content,String logoPath, int size) {    
        BufferedImage bufImg = null;    
        try {    
            Qrcode qrcodeHandler = new Qrcode();    
            // 设置二维码排错率，可选L(7%)、M(15%)、Q(25%)、H(30%)，排错率越高可存储的信息越少，但对二维码清晰度的要求越小    
            qrcodeHandler.setQrcodeErrorCorrect('M');
            qrcodeHandler.setQrcodeEncodeMode('B');    
            // 设置设置二维码尺寸，取值范围1-40，值越大尺寸越大，可存储的信息越大    
            qrcodeHandler.setQrcodeVersion(size);    
            // 获得内容的字节数组，设置编码格式    
            byte[] contentBytes = content.getBytes("utf-8");    
            // 图片尺寸    
            int imgSize = 67 + 12 * (size - 1);    
            bufImg = new BufferedImage(imgSize, imgSize, BufferedImage.TYPE_INT_RGB);    
            Graphics2D gs = bufImg.createGraphics();    
            // 设置背景颜色    
            gs.setBackground(Color.WHITE);    
            gs.clearRect(0, 0, imgSize, imgSize);    
    
            // 设定图像颜色> BLACK    
            gs.setColor(Color.BLACK);    
            // 设置偏移量，不设置可能导致解析出错    
            int pixoff = 2;    
            // 输出内容> 二维码    
            if (contentBytes.length > 0 && contentBytes.length < 800) {    
                boolean[][] codeOut = qrcodeHandler.calQrcode(contentBytes);    
                for (int i = 0; i < codeOut.length; i++) {    
                    for (int j = 0; j < codeOut.length; j++) {    
                        if (codeOut[j][i]) {    
                            gs.fillRect(j * 3 + pixoff, i * 3 + pixoff, 3, 3);    
                        }    
                    }    
                }    
            } else {    
                throw new Exception("QRCode content bytes length = " + contentBytes.length + " not in [0, 800].");    
            } 
            //绘制中间图片
            if(StringUtils.isNotEmpty(logoPath)){
            	//获取bufImg的中间位置
                int centerX = bufImg.getMinX() + bufImg.getWidth()/2 - imageWidth/2;
                int centerY = bufImg.getMinY() + bufImg.getHeight()/2 - imageHeight/2;
            	Image img = ImageIO.read(new File(logoPath));//实例化一个Image对象。
                gs.drawImage(img,centerX,centerY,imageWidth,imageHeight,null);
            }
            gs.dispose();    
            bufImg.flush();    
        } catch (Exception e) {    
            e.printStackTrace();    
            log.error("createQrcode Error:"+e.getMessage());
        }    
        return bufImg;    
    } 
    
    内部Qrcode工具类
    static class QRCodeImageBean implements QRCodeImage {

	    BufferedImage bufImg;  
	    
	    public QRCodeImageBean(BufferedImage bufImg) {  
	        this.bufImg = bufImg;  
	    }  
	    public int getHeight() {  
	        return bufImg.getHeight();  
	    }  
	    public int getPixel(int x, int y) {  
	        return bufImg.getRGB(x, y);  
	    }  
	    public int getWidth() {  
	        return bufImg.getWidth();  
	    }  
	}
    public static void main(String[] args) {  
//        String imgPath = "D:/2.jpg";  
//        QRCode handler = new QRCode();  
//        String qrCon = handler.decoderQRCode(imgPath);
//        System.out.println("decoder success!!!");  
//        System.out.println("二维码内容为:" + qrCon);
//    	  String imgPath = "d:/52itstyle";    
//        String encoderContent = "http://www.52itstyle.com";    
//        QRCode handler = new QRCode();    
//        handler.encoderQRCode(encoderContent, imgPath, "png");    
//        System.out.println("encoder success!!!");  
    }  

}
*/