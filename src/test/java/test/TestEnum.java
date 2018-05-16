package test;

/**
 * 
 * @author 付为地 
 *     简单使用枚举,统一抽取系统的常量,在此配置
 *
 */
public class TestEnum {

	public enum state {
		GX("10", "审批中", "1"), BH("20", "审批不通过", "2"), CG("30", "审批成功", "3");
		String val;
		String desc;
		String index;

		state(String val, String desc, String index) {
			this.val = val;
			this.desc = desc;
			this.index = index;
		}

		public String getVal() {
			return this.val;
		}

		public String getDesc() {
			return this.desc;
		}

		public String getIndex() {
			return index;
		}
	}

}
