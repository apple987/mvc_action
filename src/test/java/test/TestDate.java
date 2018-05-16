package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestDate {
	public static void main(String[] args) throws ParseException {
        String s="20151223015850";
        s="20151223152336";
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        Date d=sdf.parse(s);
        System.err.println(sdf.format(d));
	}
}
