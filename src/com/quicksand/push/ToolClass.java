package com.quicksand.push;

import java.io.IOException;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StreamUtils;

import com.jiubo.erp.rygl.vo.UserFamily;

import net.sf.json.JSONObject;

public class ToolClass {
	
	/**
	 * 接口数据转化成map
	 * @param dataStr
	 * @return
	 */
	public static Map<String, String> mapShiftStr(HttpServletRequest request) {
		String s;
		try {
			s = StreamUtils.copyToString(request.getInputStream(), Charset.forName("UTF-8"));
			System.out.println("--------字符串-------"+s);
			JSONObject jsonObject = JSONObject.fromObject(s);
			System.out.println("--------字符串-------"+s);
			Map<String, String> mapList = (Map<String, String>)jsonObject;
			return mapList;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	//比较两个时间字符串的大小
	public static int compare_date(String DATE1, String DATE2) {
	        
	    DATE1 = DATE1+"00"; 
	    DATE2 = DATE2+"00";
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.000"); //加上时间
	    try {
	    	Date dt1 = df.parse(DATE1);
	    	Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() > dt2.getTime()) {
//	                System.out.println("1"+dt1+"--"+dt2);
	                return 1;
	            } else if (dt1.getTime() < dt2.getTime()) {
//	                System.out.println("2"+dt1+"--"+dt2);
	                return -1;
	            } else {
	            	System.out.println("3"+dt1+"--"+dt2);
	                return 0;
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return 0;
	}
	
	public static String judgeStr(String string) {
		if (string.equals("")||string.equals("0")||string=="0") {
			return "";
		}
		return string;
	}
	/**
	 * 时间字符串格式化
	 * @param dateStr
	 * @return
	 */
	public static String strDateTimeStr(Date date) {
		
        SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.000"); //加上时间
//        SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd"); //加上时间
        String sDate=sDateFormat.format(date);
        System.out.println("-------时间转换--------------------------"+sDate);
		return sDate;
		
	}
	
	/**
	 * 时间字符串格式化
	 * @param dateStr
	 * @return
	 */
	public static String strDateTimeShiftStr(String str , Integer timeIndex) {
		
        SimpleDateFormat sDateFormat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.000"); //加上时间
        SimpleDateFormat sDateFormat2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.000"); //加上时间
        Date strDate;
		try {
			strDate = sDateFormat1.parse(str);
			Date dateStr = new Date(strDate.getTime()+timeIndex*60*1000);
			String sDate=sDateFormat2.format(dateStr);
			System.out.println("-------时间转换--------------------------"+dateStr);
			return sDate;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return str;
		}	
	}
	
	
	/**
	 * 时间转化，将带有时分秒的年月日字符串时间格式化成年月日
	 * @param dateStr
	 * @return
	 */
	public static Date dateTimeDate(Date date) {
		
		SimpleDateFormat sDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:000"); //加上时间
        
		try {
		    String sDate=sDateFormat.format(date);
		    Date newDate=sDateFormat.parse(sDate);
	        System.out.println(date);
	        return newDate;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
	}
	/**
	 * 将不带时分秒的字符串时间转化成年月日
	 * @param dateStr
	 * @return
	 */
	public Date dateStr(String dateStr) {
		
      SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
      //必须捕获异常
      try {
          Date date=simpleDateFormat.parse(dateStr);
          return date;
      } catch(ParseException px) {
          px.printStackTrace();
      }
      return null;
	}
	
	/**
	 * 判断一个时间是否在一个时间段之内
	 * @param nowTime
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static boolean isEffectiveDate(Date nowTime, Date startTime, Date endTime) {
        if (nowTime.getTime() == startTime.getTime()
                || nowTime.getTime() == endTime.getTime()) {
            return true;
        }

        Calendar date = Calendar.getInstance();
        date.setTime(nowTime);

        Calendar begin = Calendar.getInstance();
        begin.setTime(startTime);

        Calendar end = Calendar.getInstance();
        end.setTime(endTime);

        if (date.after(begin) && date.before(end)) {
            return true;
        } else {
            return false;
        }
    }
	/**
	 * 获取当前的时间
	 * @return
	 */
	public static String inquirNowDateTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:0");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String newDate = df.format(new Date());
		return newDate;
	}
	
	/**
	 * 获取当前的时间
	 * @return
	 */
	public static String inquirNowDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String newDate = df.format(new Date());
		return newDate;
	}
}
