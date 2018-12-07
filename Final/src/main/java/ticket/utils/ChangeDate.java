package ticket.utils;

import java.sql.Date;

public class ChangeDate {

	// 년, 월, 일이 각각 입력되었을 경우 Date로 변경하는 메서드
	public Date changeformDate(String year, String month, String day) {
		
		String date = year + "-" + month + "-" + day;
		Date d = Date.valueOf(date);

		return d;
	}

}
