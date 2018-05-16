


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	/**
	 * 得到加密的MD5
	 * @param str
	 * @return
	 */
	public static String getMD5Str(String str) {  
        byte[] byteArray = getMD5(str);  
        StringBuffer md5StrBuff = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++) {              
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)  
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));  
            else  
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));  
        }  
        return md5StrBuff.toString();  
    } 
	
	public static byte[] getMD5(String str) {  
        MessageDigest messageDigest = null;  
        try {  
            messageDigest = MessageDigest.getInstance("MD5");  
            messageDigest.reset();  
            messageDigest.update(str.getBytes("UTF-8"));  
        } catch (NoSuchAlgorithmException e) {  
        	e.printStackTrace();
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        } 
        
        return messageDigest.digest();  
    }
	
	public static String getMD5Str(byte[] b) {  
        MessageDigest messageDigest = null;  
        try {  
            messageDigest = MessageDigest.getInstance("MD5");  
            messageDigest.reset();  
            messageDigest.update(b);  
        } catch (NoSuchAlgorithmException e) {  
        	e.printStackTrace();
        }
        byte[] byteArray = messageDigest.digest();  
        StringBuffer md5StrBuff = new StringBuffer();  
        for (int i = 0; i < byteArray.length; i++) {              
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)  
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));  
            else  
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));  
        }  
        return md5StrBuff.toString();  
    }
	/**
     * 填充80数据，首先在数据块的右边追加一个'80',如果结果数据块是8的倍数，不再进行追加,如果不是,追加0x00到数据块的右边，直到数据块的长度是8的倍数。
     *
     * @param data 待填充80的数据
     * @return
     */
	public static String padding80(String data) {
        int padlen = 8 - (data.length() / 2) % 8;
        String padstr = "";
        for (int i = 0; i < padlen - 1; i++)
            padstr += "00";
        data = data + "80" + padstr;
        return data;
    }
	public static void main(String []args){
	/*	System.out.println(new MD5().getMD5Str("KEY=123456&ORDER_ID=12380844&MERCHANT_ID=82141101&MERCHANT_NAME=礼无忧&TERMINAL_ID=11223344&SP_ID=1123&KEY=123456"));
		System.out.println(new MD5().getMD5Str("123456"));
		System.out.println(new MD5().getMD5Str("张三").length());
		System.out.println(new Date().toString());*/
        //System.out.println(new MD5().getMD5Str("赵翔"));
		System.out.println(MD5.getMD5Str("123Apk#"));
	}
}
