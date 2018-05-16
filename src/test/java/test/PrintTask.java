package test;

public class PrintTask implements Runnable {
    private String name;
    
	public PrintTask(String name) {
		this.name = name;
	}
	@Override
	public void run() {
		System.err.println(name);
		
	}

}
