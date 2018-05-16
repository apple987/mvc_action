package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


public class TestDateRANGE {
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		Date d= sdf.parse("20151123163553");
		Date now=new Date();
/*		System.err.println(isLeapYear(d.getYear()));
//		d.setYear(d.getYear()+2);
		System.err.println("输入时刻为:"+sdf.format(d));
		System.err.println("输入时刻延后7天:"+sdf.format(getDateFromToday(d,7)));
		//System.out.println("输入时间延后7天:"+sdf.format(DateUtil.getDateFromToday(d,7)));
		//System.err.println(DateUtil.getDateMap("1"));
		System.err.println("输入时刻延迟1月:"+sdf.format(getDateRangeMonth(d,1)));
		System.err.println("输入时刻延迟1年:"+sdf.format(getDateRangeYear(d,2)));*/
		Date end=getDateRangeMonth(d,1);
		System.err.println("起始时刻:"+new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(d));
		System.err.println("截止时刻:"+new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(end));
		System.err.println("服务执行时刻:"+new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(now));
		if(now.compareTo(d)==-1||now.compareTo(end)==1){//不符合
			System.out.println("不合格");
		}
		System.out.println(compareTo(now,d));
		System.out.println(compareTo(now,end));
		
	}
	/*public static int compareTo(Date anotherDate) {
	  long thisTime = getMillisOf(this);
      long anotherTime = getMillisOf(anotherDate);
      return (thisTime<anotherTime ? -1 : (thisTime==anotherTime ? 0 : 1));
	}*/
	/**
	 * 比较前面时间跟后面时间的大小
	 * @param begin
	 * @param end
	 * @return A>B:1  A=B:0 A<B:-1
	 */
	public static int compareTo(Date begin,Date end) {
		  int result=0;
		  long thisTime = begin.getTime();
	      long anotherTime =end.getTime();
	      //return (thisTime<anotherTime ? -1 : (thisTime==anotherTime ? 0 : 1));
	      if(thisTime>anotherTime){
	    	  result=1;
	      }else if(thisTime<anotherTime){
	    	  result=-1;
	      }else{
	    	  result=0;
	      }
	      return result;
		}
	/**
	 * 延后多少天
	 * @param date
	 * @param day
	 * @return
	 */
	public static Date getDateFromToday(Date date,int day) {
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.set(Calendar.DATE, ca.get(Calendar.DATE) + day);
		ca.set(Calendar.HOUR_OF_DAY, date.getHours());
		ca.set(Calendar.MINUTE, date.getMinutes());
		ca.set(Calendar.SECOND, date.getSeconds());
		return ca.getTime();
	}
	/**
	 * 计算输入时刻date
	 *  间隔range个月
	 *   截止时刻
	 * @param date:输入时刻
	 * @param range：间隔几个月
	 */
	public static Date getDateRangeMonth(Date date,int range){
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.add(Calendar.MONTH, range);
		ca.set(Calendar.HOUR_OF_DAY, date.getHours());
		ca.set(Calendar.MINUTE, date.getMinutes());
		ca.set(Calendar.SECOND, date.getSeconds());
		return ca.getTime();
	}
	/**
	 * 判断是不是闰年
	 * @param year
	 * @return
	 */
    public static boolean isLeapYear(int year){
    	return  (year%400 == 0 || (year%4 == 0 && year%100 != 0));
    	
    }
	/**
	 * 计算输入时刻date
	 *  间隔range个年
	 *   截止时刻
	 * @param date:输入时刻
	 * @param range：间隔多少年
	 */
	public static Date getDateRangeYear(Date date,int range){
		/*int beginYear=date.getYear();
		System.out.println("年:"+beginYear);
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.set(Calendar.YEAR, range);
		ca.set(Calendar.MONTH, date.getMonth());
		ca.set(Calendar.HOUR_OF_DAY, date.getHours());
		ca.set(Calendar.MINUTE, date.getMinutes());
		ca.set(Calendar.SECOND, date.getSeconds());
		return ca.getTime();*/
		return getDateRangeMonth(date,range*12);
	}
}
