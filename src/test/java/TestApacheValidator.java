import java.util.Date;

import org.apache.commons.lang.ClassUtils;
import org.apache.commons.validator.routines.DateValidator;
import org.apache.commons.validator.routines.RegexValidator;

public class TestApacheValidator {
	public static void main(String[] args) {

		/* 验证日期 */
		// 获取日期验证
		DateValidator dvalidator = DateValidator.getInstance();
		// 验证/转换日期
		Date fooDate = dvalidator.validate("20141141111", "dd/MM/yyyy");
		if (fooDate == null) {
			// 错误 不是日期
			System.err.println("不是日期");
		}
		// 设置参数
		boolean caseSensitive = false;
		String regex1 = "^([A-Z]*)(?:\\-)([A-Z]*)*$";
		String regex2 = "^([A-Z]*)$";
		String[] regexs = new String[] { regex1, regex2 };
		// 创建验证
		RegexValidator validator = new RegexValidator(regexs, caseSensitive);
		// 验证返回boolean
		boolean valid = validator.isValid("abc-def");
		System.err.println(valid);
		// 验证返回字符串
		String result = validator.validate("abc-def");
		System.err.println(result);
		// 验证返回数组
		String[] groups = validator.match("abc-def");
		System.err.println(groups);
		   //4.取得类名  
	       System.out.println(ClassUtils.getShortClassName(TestApacheValidator.class));  
	       //取得其包名  
	       System.out.println(ClassUtils.getPackageName(TestApacheValidator.class));  
	}

}
