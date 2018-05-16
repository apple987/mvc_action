package test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class TestTimerTask {
	public static void main(String[] args) {
		// 1分钟之后，自动失效链接地址
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S");
		System.err.println("发送的忘记密码邮件，生成的时间是:" + sdf.format(dt));
		Calendar now = Calendar.getInstance();
		now.setTime(dt);
		now.add(Calendar.MINUTE, 2);
		Date uuEndDate = new Date(now.getTimeInMillis());
		System.err.println("忘记密码的邮件定时器，执行时间是:" + sdf.format(uuEndDate));
		Timer timer = new Timer();
		timer.schedule(new MyTask(timer), uuEndDate);
	}

	/**
	 * 辅助定时器，回收机制
	 * 
	 * @author user
	 */
	static class MyTask extends java.util.TimerTask {
		private Timer timer;

		public MyTask(Timer timer2) {
			this.timer=timer2;
		}

		public void run() {
			System.err.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss S").format(new Date())+" MyTask执行一次");
			timer.cancel();
		}
	}
}
