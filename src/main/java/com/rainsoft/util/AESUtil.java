package com.rainsoft.util;
import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.codec.Hex;
import org.apache.shiro.crypto.AesCipherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.bytebuddy.asm.Advice.This; 

/**
 * @author AES工具类
 */
public class AESUtil {
	private static final Logger logger = LoggerFactory.getLogger(This.class);
	
	
	public final static String KEY = "!@#$%^&*(";

	/**
	 * AES加密
	 * @param content
	 * @param Aeskey
	 * @return
	 */
	public static synchronized String encrypt(String content, String Aeskey) {
		logger.info("执行AESUtil.encrypt加密,传入参数:content=["+content+"] Aeskey=["+Aeskey+"]");
		try {
			if (StringUtils.isBlank(Aeskey)) {
				Aeskey = KEY;
			}
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");
			secureRandom.setSeed(Aeskey.getBytes());
			kgen.init(128, secureRandom);
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			byte[] byteContent = content.getBytes("utf-8");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] result = cipher.doFinal(byteContent);
			return byteArr2HexStr(result);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("执行AESUtil.encrypt加密时异常:"+e);
		}
		return null;
	}
    /**
     * AES解密
     * @param content
     * @param Aeskey
     * @return
     */
	public static synchronized String decrypt(String content, String Aeskey) {
		logger.info("执行AESUtil.decrypt解密,传入参数:content=["+content+"] Aeskey=["+Aeskey+"]");
		try {
			if (StringUtils.isBlank(Aeskey)) {
				Aeskey = KEY;
			}
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			SecureRandom secureRandom = SecureRandom.getInstance("SHA1PRNG");// 修复linux系统报错问题
			secureRandom.setSeed(Aeskey.getBytes());
			kgen.init(128, secureRandom);
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] result = cipher.doFinal(hexStr2ByteArr(content));
			return new String(result, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("执行AESUtil.decrypt解时异常:"+e);
		}
		return null;
	}
	
	
	/*
	 * 将表示16进制值的字符串转换为byte数组， 和public static String byteArr2HexStr(byte[] arrB)
	 * 互为可逆的转换过程
	 */
    private static synchronized byte[] hexStr2ByteArr(String strIn) throws Exception {  
        byte[] arrB = strIn.getBytes();  
        int iLen = arrB.length;  
        byte[] arrOut = new byte[iLen / 2];  
        for (int i = 0; i < iLen; i = i + 2) {  
            String strTmp = new String(arrB, i, 2);  
            arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);  
        }  
        return arrOut;  
    } 
    
    /*
     * 将byte数组转换为表示16进制值的字符串
     * hexStr2ByteArr(String strIn)
     */

    private static synchronized String byteArr2HexStr(byte[] arrB) throws Exception {   
        int iLen = arrB.length;  
        StringBuffer sb = new StringBuffer(iLen * 2);  
        for (int i = 0; i < iLen; i++) {  
            int intTmp = arrB[i];  
            while (intTmp < 0) {  
                intTmp = intTmp + 256;  
            }  
            if (intTmp < 16) {  
                sb.append("0");  
            }  
            sb.append(Integer.toString(intTmp, 16));  
        }  
        String result = sb.toString();  
        return result;  
    } 
    
    
    
    public static void main(String[] args) {

		AesCipherService aesCipherService = new AesCipherService();    
        aesCipherService.setKeySize(128); //设置key长度    
        //生成key    
        Key key = aesCipherService.generateNewKey();  
        System.out.println("key = " + key);  
        String text = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMjM0NTYiLCJpYXQiOjE1MTYzMjQ5MzQsImV4cCI6MTUxNjkyOTczNH0.Ykf0G3F3q_1B7KeKPr2ksSPIYAShonjADWaHvMegfdN9s5mp4ipQqF8Pthgm0BA4fS-MVCOPqMd807VysNA7xA";    
        //加密    
        String encrptText =  aesCipherService.encrypt(text.getBytes(), key.getEncoded()).toHex();    
        //解密    
        String text2 = new String(aesCipherService.decrypt(Hex.decode(encrptText), key.getEncoded()).getBytes());  
        System.err.println("采用shiro使用AES原始值 : " + text+" \t 长度:"+text.length());  
        System.err.println("采用shiro使用AES加密值 : " + encrptText+" \t 长度:"+encrptText.length());  
        System.err.println("采用shiro使用AES解密值 : " + text2+" \t 长度:"+text2.length());  
	
        /*****************/
        System.err.println("加密:"+new String(encrypt(text,KEY)));
        System.err.println("解密:"+new String(decrypt(new String(encrypt(text,KEY)), KEY)));
        System.err.println("加密:"+new String(encrypt(text,new String(key.getEncoded()))));
        System.err.println("解密:"+new String(decrypt(new String(encrypt(text,new String(key.getEncoded()))), new String(key.getEncoded()))));
        
	}

}