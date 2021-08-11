package of.common.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvert{

	public static long dateToLong(String d) {
		Date date = null;
		long longDate = 0;
		try {
			//System.out.println(d);
			date = new SimpleDateFormat("yyyy/MM/dd").parse(d);
			longDate = date.getTime();
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("date format error");
		}
		return longDate;
	}
	
	// 加日期轉換方法
	
	
}
