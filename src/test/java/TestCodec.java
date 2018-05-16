import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;

public class TestCodec {
	public static void main(String[] args) {
		encodeTest("apple");
		decodeTest(encodeTest("apple"));
		System.err.println("md5加密:"+org.apache.commons.codec.digest.DigestUtils.md5Hex("apple"));
		System.err.println(org.apache.commons.codec.digest.DigestUtils.md5Hex("apple").equals(MD5.getMD5Str("apple")));
		
		
	}

	// Base64编解码
	private static String encodeTest(String str) {
		Base64 base64 = new Base64();
		try {
			str = base64.encodeToString(str.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		System.out.println("Base64 编码后：" + str);
		return str;
	}

	private static void decodeTest(String str) {
		Base64 base64 = new Base64();
		str = new String(Base64.decodeBase64(str));
		System.out.println("Base64 解码后：" + str);
	}
}
