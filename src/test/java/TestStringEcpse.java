import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;

/**
 * 字符串转义成html显示
 */
public class TestStringEcpse {
	public static void main(String[] args) {
		System.err.println(StringEscapeUtils.escapeHtml("http://hotwired.lycos.com/webmonkey/reference/special_characters/"));
		System.err.println(StringEscapeUtils.unescapeHtml("http://hotwired.lycos.com/webmonkey/reference/special_characters/"));
	    System.err.println(StringUtils.isEmpty(""));
	    System.err.println(StringUtils.isEmpty(null));
	}
}
