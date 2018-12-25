package ticket.service.admin.impl;

import java.util.Date;

public class ttttt {
	public static void main(String[] args) {
		Date today = new Date();
		Date periodS = new Date(today.getTime()); 
		System.out.println(periodS.getTime());
		System.out.println(24* 24 * 60 * 60 * 1000);
		periodS.setTime((long) (periodS.getTime() - (double)25 * 24 * 60 * 60 * 1000));
		// 끝 구간: 오늘
		Date periodE = today; 
		
		System.out.println(periodS);
		System.out.println(periodE);
	}
}
