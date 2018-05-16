
import org.apache.commons.codec.binary.Base64;
import org.springframework.util.Base64Utils;


/**
 * base64加密解密
 * 1.采用spring的方式
 * 2.采用apache-common-codec工具类,来实现
 * 针对base64之类的加密解密操作,本处不推荐自己写一个加密解密util工具类
 * 推荐直接采用apache-common-codec或者spring自带的base64加密解密工具
 *
 */
public class TestBase64 {
	public static void main(String[] args) {
		System.err.println(Base64Utils.encodeToString("apple".getBytes()));
		System.err.println(new String(Base64Utils.decodeFromString(Base64Utils.encodeToString("apple".getBytes()))));
		//加密
		String str= "abc"; // abc为要加密的字符串
		byte[] b = Base64.encodeBase64(str.getBytes(), true);
		System.out.println(new String(b));

		//解密
		String str1 = "YWJj"; // YWJj为要解密的字符串
		byte[] b1 = Base64.decodeBase64(str1.getBytes());
		System.out.println(new String(b1));
	}
}
