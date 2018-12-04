package com.zs.pms.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期工具类 final类型 表示该类不可被继承
 * 
 * @author gavin
 * 
 */
public final class DateUtil {

	/**
	 * 根据日期获得字符串:日期--->字符串
	 * 
	 * @param date
	 * @return XXXX年XX月XX日
	 */
	public static String getStrDate(Date date) {
		// 创建了一个日期对象
		Calendar calendar = Calendar.getInstance();

		// 设置传入的日期
		calendar.setTime(date);

		// 获得年
		int y = calendar.get(Calendar.YEAR);
		// 获得月
		int m = calendar.get(Calendar.MONTH) + 1;

		// 获得日期
		int d = calendar.get(Calendar.DAY_OF_MONTH);

		return y + "-" + m + "-" + d;
	}

	/**
	 * 根据日期获得字符串: 日期时间--->字符串
	 * 
	 * @param date
	 * @return XXXX年XX月XX日 xx:xx:xx
	 */
	public static String getStrDateTime(Date date) {
		// 创建了一个日期对象
		Calendar calendar = Calendar.getInstance();

		// 设置传入的日期
		calendar.setTime(date);

		// 获得年
		int y = calendar.get(Calendar.YEAR);
		// 获得月
		int m = calendar.get(Calendar.MONTH) + 1;

		// 获得日期
		int d = calendar.get(Calendar.DAY_OF_MONTH);

		// 获得小时
		int h = calendar.get(Calendar.HOUR_OF_DAY);
		// 获得分钟
		int mm = calendar.get(Calendar.MINUTE);

		// 获得秒
		int s = calendar.get(Calendar.SECOND);

		return y + "年" + m + "月" + d + "日" + " " + h + ":" + mm + ":" + s;
	}

	/**
	 * 根据字符串获得日期：字符串-->日期
	 * 
	 * @param date
	 * @param format
	 *            : yyyy-MM-dd yyyy-MM-dd HH:mm:ss
	 * @return
	 * @throws ParseException
	 */
	public static Date getDateStr(String date, String format) {
		// 创建一个日期格式对象
		DateFormat df = new SimpleDateFormat(format);

		Date date2 = null;
		try {
			date2 = df.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return date2;

	}

	public static void main(String[] args) {

		System.out.println(getStrDateTime(getDateStr("2013-12-23 12:12:12",
				"yyyy-MM-dd HH:mm:ss")));

	}

}
