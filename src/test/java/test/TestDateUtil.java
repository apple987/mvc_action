package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class TestDateUtil {
	public static void main(String[] args) throws ParseException {
		//模拟规则起始时刻
		String start="20151225163628";
		String exe="20151226184638";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		Date beginTime=sdf.parse(start);
		Date exeTime=sdf.parse(exe);
		/*System.err.println("星期数:"+new SimpleDateFormat("E").format(beginTime));
		System.err.println("自然周开始时刻:"+sdf.format(getDateWeekInfo1(beginTime)[0]));
		System.err.println("自然周截止时刻:"+sdf.format(getDateWeekInfo1(beginTime)[1]));*/
		/*System.err.println("自然月开始时刻:"+sdf.format(getDateMonth(beginTime,true)));
		System.err.println("自然月截止时刻:"+sdf.format(getDateMonth(beginTime,false)));*/
//		System.err.println("当前月是:"+new SimpleDateFormat("MM").format(beginTime));
//		System.err.println("自然年开始时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateYear(beginTime,true)));
//		System.err.println("自然年截止时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateYear(beginTime,false)));
//		System.err.println("自然季度开始时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateQuarter(beginTime,true)));
//		System.err.println("自然季度截止时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateQuarter(beginTime,false)));
		System.err.println("间隔N月起始时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateRangeMonth(beginTime,1)));
		System.err.println("间隔N个季度起始时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateQuarter(getDateRangeMonth(beginTime,3*4),true)));
		System.err.println("间隔N个年起始时刻:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E").format(getDateYear(getDateRangeMonth(beginTime,12*4),true)));
		
	}
	/**
	 * 判断当前时刻是星期几
	 * 返回所在自然周的起始时刻，截止时刻
	 * Date[0]:本周的起始时刻
	 * Date[1]:下周的起始时刻
	 */
	public static Date[] getDateWeekInfo1(Date date){
		Date[] result=new Date[2];
		String flag=new SimpleDateFormat("E").format(date);
		if(flag.equalsIgnoreCase("星期一")){
			result[0]=getDayInfo(date,true);
			result[1]=getDayInfo(getDateRangeDay(date,7),true);
		}else if(flag.equalsIgnoreCase("星期二")){
			result[0]=getDayInfo(getDateRangeDay(date,-1),true);
			result[1]=getDayInfo(getDateRangeDay(date,6),true);
		}else if(flag.equalsIgnoreCase("星期三")){
			result[0]=getDayInfo(getDateRangeDay(date,-2),true);
			result[1]=getDayInfo(getDateRangeDay(date,5),true);
		}else if(flag.equalsIgnoreCase("星期四")){
			result[0]=getDayInfo(getDateRangeDay(date,-3),true);
			result[1]=getDayInfo(getDateRangeDay(date,4),true);
		}else if(flag.equalsIgnoreCase("星期五")){
			result[0]=getDayInfo(getDateRangeDay(date,-4),true);
			result[1]=getDayInfo(getDateRangeDay(date,3),true);
		}else if(flag.equalsIgnoreCase("星期六")){
			result[0]=getDayInfo(getDateRangeDay(date,-5),true);
			result[1]=getDayInfo(getDateRangeDay(date,2),true);
		}else{
			result[0]=getDayInfo(getDateRangeDay(date,-6),true);
			result[1]=getDayInfo(getDateRangeDay(date,1),true);
		}
		return result;
	}
	
	/**
	 * 判断当前时刻是星期几
	 * 返回所在自然周的起始时刻，截止时刻
	 * Object[0]:本周的起始时刻
	 * Object[1]:本周的截止时刻
	 */
	public static Object[] getDateWeekInfo(Date date){
		Object[] result=new Object[2];
		String flag=new SimpleDateFormat("E").format(date);
		if(flag.equalsIgnoreCase("星期一")){
			result[0]=getDayInfo(date,true);
			result[1]=getDayInfo(getDateRangeDay(date,6),false);
		}else if(flag.equalsIgnoreCase("星期二")){
			result[0]=getDayInfo(getDateRangeDay(date,-1),true);
			result[1]=getDayInfo(getDateRangeDay(date,5),false);
		}else if(flag.equalsIgnoreCase("星期三")){
			result[0]=getDayInfo(getDateRangeDay(date,-2),true);
			result[1]=getDayInfo(getDateRangeDay(date,4),false);
		}else if(flag.equalsIgnoreCase("星期四")){
			result[0]=getDayInfo(getDateRangeDay(date,-3),true);
			result[1]=getDayInfo(getDateRangeDay(date,3),false);
		}else if(flag.equalsIgnoreCase("星期五")){
			result[0]=getDayInfo(getDateRangeDay(date,-4),true);
			result[1]=getDayInfo(getDateRangeDay(date,2),false);
		}else if(flag.equalsIgnoreCase("星期六")){
			result[0]=getDayInfo(getDateRangeDay(date,-5),true);
			result[1]=getDayInfo(getDateRangeDay(date,1),false);
		}else{
			result[0]=getDayInfo(getDateRangeDay(date,-6),true);
			result[1]=getDayInfo(date,false);
		}
		return result;
	}
	
	/**
	 *  获得距离某个时刻，指定天数间隔的时间结点
	 *  @param date:输入的起始时刻
	 *  @param day:间隔天数(负数提前,正数滞后) 
	 * @return Date 截止时刻
	 */
	@SuppressWarnings("deprecation")
	public static Date getDateRangeDay(Date date,int day) {
		Calendar ca = Calendar.getInstance();
		ca.setTime(date);
		ca.set(Calendar.DATE, ca.get(Calendar.DATE) + day);
		ca.set(Calendar.HOUR_OF_DAY, date.getHours());
		ca.set(Calendar.MINUTE, date.getMinutes());
		ca.set(Calendar.SECOND, date.getSeconds());
		return ca.getTime();
	}
	
	/**
	 *  获得距离某个时刻，指定月数间隔的时间结点
	 *  @param date:输入的起始时刻
	 *  @param day:间隔月数(负数提前,正数滞后) 
	 * @return Date 截止时刻
	 */
	@SuppressWarnings("deprecation")
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
	 * 获得某一时刻的当天的起始时刻，截止时刻
	 * @param date
	 * @param flag
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static Date getDayInfo(Date date,boolean flag) {
		if(flag){//当前起始时刻
			date.setHours(0);
			date.setMinutes(0);
			date.setSeconds(0);
		}else{//截止时刻
			date.setHours(23);
			date.setMinutes(59);
			date.setSeconds(59);
		}
		return date;
	} 
	
	/**
	 * 获得某时刻所在月
	 *  起始时刻
	 *  截止时刻
	 * @param date
	 * @param flag
	 * @return
	 */
	public static Date getDateMonth(Date date,boolean flag) {
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(date);
		if (flag) {// 时刻所在月的第一天起始时刻
			rightNow.set(GregorianCalendar.DAY_OF_MONTH, 1);
			rightNow.set(Calendar.HOUR_OF_DAY, 0);
			rightNow.set(Calendar.MINUTE, 0);
			rightNow.set(Calendar.SECOND, 0);
		} else {//  时刻所在月的最后一天截止时刻
			rightNow.set(Calendar.DATE, 1);
			rightNow.roll(Calendar.DATE, -1);
			rightNow.set(Calendar.HOUR_OF_DAY, 23);
			rightNow.set(Calendar.MINUTE, 59);
			rightNow.set(Calendar.SECOND, 59);
		}
		return rightNow.getTime();
	} 
	/**
	 * 获得某时刻所在年
	 *  起始时刻
	 *  截止时刻
	 * @param date
	 * @param flag
	 * @return
	 */
	public static Date getDateYear(Date date,boolean flag) {
		String temp=new SimpleDateFormat("yyyy").format(date);
		try {
			if (flag) {// 时刻所在年的第一天起始时刻
				temp=temp+"0101000000";
				date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
			} else {//  时刻所在年的最后一天截止时刻
				temp=temp+"1231235959";
				date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	} 
	/**
	 * 获得某时刻所在季度
	 *  起始时刻
	 *  截止时刻
	 * @param date
	 * @param flag
	 * @return
	 */
	public static Date getDateQuarter(Date date,boolean flag) {
		int quart=Integer.valueOf(new SimpleDateFormat("MM").format(date));
		String temp=new SimpleDateFormat("yyyy").format(date);
		try {
			if (flag) {// 时刻所在季度的第一天起始时刻
				if(quart>0&&quart<4){//一季度1-3
					temp=temp+"0101000000";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}
				else if(quart>3&&quart<7){//一季度4-6
					temp=temp+"0401000000";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}else if(quart>6&&quart<10){//一季度7-9
					temp=temp+"0701000000";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}else if(quart>9&&quart<13){//一季度10-12
					temp=temp+"1001000000";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}
			} else {//  时刻所在季度的最后一天截止时刻
				if(quart>0&&quart<4){//一季度1-3
					temp=temp+"0331235959";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}
				else if(quart>3&&quart<7){//一季度4-6
					temp=temp+"0630235959";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}else if(quart>6&&quart<10){//一季度7-9
					temp=temp+"0930235959";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}else if(quart>9&&quart<13){//一季度10-12
					temp=temp+"1231235959";
					date=new SimpleDateFormat("yyyyMMddHHmmss").parse(temp);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	} 
	
}
