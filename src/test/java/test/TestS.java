package test;


import java.text.ParseException;

import org.apache.log4j.net.SMTPAppender;
/**
 * 测试Apache的DateUtil
 * 使用一些常用的日期信息
 * @author user
 *
 */
public class TestS {
	public static void main(String[] args) throws ParseException {
		/*String merchantId = "9999998885000004400";
		String dest_mchnt_cd = merchantId.substring(merchantId.length() - 15);
		System.out.println("商户号:" + dest_mchnt_cd);*/
//		Date dt=DateUtils.addWeeks(new Date(), 1);//往后推七天
		//后推一个自然月
//		Date dt=DateUtils.addMonths(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2015-12-30 12:05:32"), 2);//往后推1个月
		//往后推1年
//		Date dt=DateUtils.addYears(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2015-12-30 12:05:32"), 1);//往后推1个月
		/*Date dt=DateUtils.addDays(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2015-06-30 12:05:32"), 1);//往后推1个月
		dt=DateUtils.round(dt, Calendar.DAY_OF_WEEK);
		//DateUtils.parseDate(dt, "yyyy-MM-dd HH:mm:ss");
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dt));
		
		*/
		int all=100;
		int row=13;
		int c = all%row==0?all/row:all/row+1;
		System.out.println(c);
		System.out.println("除数:"+all/row+"余数:"+all%row);
		System.out.println(Math.ceil(all/row));
		System.err.println(lcm(15,18));
		SMTPAppender sm=new SMTPAppender();
		System.err.println(TestEnum.state.BH.getVal());
		System.err.println(TestEnum.state.BH.getDesc());
		System.err.println(TestEnum.state.BH.getIndex());
		
	}
	
	 //判断数的大小  
    static int min(int m,int n){  
        if(m > n){  
            return n;  
        }  
        else{  
            return m;  
        }  
    }  
	
    //最大公约数  
    static int gcd(int m,int n){        
        min(m,n);  
        int s = 1;  
        for(int i = 2;i <= min(m,n);i ++){  
            for(int j = 2;j <= i;j++){  
                if(m % j == 0 && n % j == 0){  
                    m = m / j;  
                    n = n / j;  
                    s = s * j;  
                }  
            }     
        }  
        return s;  
          
    }  
    //最小公倍数  
    static int lcm(int m,int n){                    
        int b = gcd(m,n) * (m / gcd(m,n)) * (n / gcd(m,n));  
        return b;  
          
    }  
}
