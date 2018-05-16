package test;

public class TestStatic {
	private static String name = "初始化";

	static{
		name = "砖石写法";
	}
	
	public TestStatic() {
		name = "构造器";
	}

	public static String getName() {
		return name;
	}

	public void setName(String sname) {
		name = sname;
	}
	
	public static void main(String[] args) {
		System.out.println(TestStatic.getName());
	}
}
