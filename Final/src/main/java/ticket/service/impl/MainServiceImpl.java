package ticket.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MainDao;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
//	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);

	@Autowired MainDao mainDao;

	@Override
	public List<Poster> adminChoiceBannerCon() {
		return mainDao.selectAdminBanCon();
	}

	@Override
	public List<Poster> adminChoiceBannerMu() {
		return mainDao.selectAdminBanMu();
	}

	@Override
	public List<Poster> adminChoiceBannerFam() {
		return mainDao.selectAdminBanFam();
	}

	@Override
	public List getPfmRanking(Performance pfm) {
		return mainDao.selectPfmRanking(pfm);
	}

	@Override
	public List<Poster> getConPfmPoster() {
//		logger.info(mainDao.selectPfmPosterInfo().toString());
		return mainDao.selectConPfmPosterInfo();
	}

	@Override
	public List<Poster> getMuPfmPoster() {
		return mainDao.selectMuPfmPosterInfo();
	}

	@Override
	public List<Poster> getFamPfmPoster() {
		return mainDao.selectFamPfmPosterInfo();
	}

	@Override
	public List<Poster> getpfmThemeChoicePoster(String theme) {
		return mainDao.ConThemeChoice(theme);
	}

	@Override
	public List<Poster> getDeadlineList() {
		return mainDao.selectDeadlindListPfm();
	}

	@Override
	public List<Poster> getLatestList() {
		return mainDao.selectLatestListPfm();
	}

	@Override
	public List<Poster> getPopularityList() {
		return mainDao.selectPopularityListPfm();
	}

	@Override
	public List<MainBanner> mainBannerList() {
		return mainDao.selectMainbannerList();
	}

	@Override
	public List<Poster> getnewPoster() {
		return mainDao.selectNewPfmList();
	}

	@Override
	public List<Poster> getTestList() {
		return mainDao.selectTestList();
	}

	@Override
	public List<Poster> getconPoster() {
		return mainDao.selectConTabList();
	}

	@Override
	public List<Poster> getMuPoster() {
		return mainDao.selectMuTabList();
	}

	@Override
	public List<Performance> ticketOpenList() {
		return mainDao.selectTicketOpenList();
	}

	@Override
	public List<Performance> ticketOpenPfmList() {
		return mainDao.selectTicketOpenPfmList();
	}

	@Override
	public List<Performance> ticketOpenDayList() {
		return mainDao.selectOpenDayPfmList();
	}

	@Override
	public List<Performance> getTopRank(String type, Date today) {
		if(today == null) {
			today = new Date();
		}
		List<Performance> pfmList = new ArrayList<Performance>();;
		List<Performance> topTen = new ArrayList<Performance>();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		// 처음 공연 리스트 필터링 범위
		Date periodS = null;
		Date periodE = null;
		
		String startStr = "";
		String endStr = "";
		
		// 최종 조회 범위
		Date startDate = null;
		Date endDate = null;

		switch (type) {
			case "daily":
				try {
					// 0. '조회 구간' 설정
					Calendar todayCal = Calendar.getInstance();
					todayCal.setTime(today);
					
					// 오전 10시 30분 이전인 경우, 전날 24시간을 범위로 함
					// yyyy-mm-dd 00:00:00 ~ yyyy-mm-dd 23:59:59
					if(todayCal.get(Calendar.HOUR_OF_DAY) <= 10 
							|| (todayCal.get(Calendar.HOUR_OF_DAY) == 10 && todayCal.get(Calendar.MINUTE) < 30)){
						// 오늘 00시 00분
						Date tempTodayStart = dateFormat.parse(dateFormat.format(today));
						// 어제 23시 59분 59초 999
						periodS = new Date(tempTodayStart.getTime() - 1);
						// 어제 00시 00분
						periodE = dateFormat.parse(dateFormat.format(periodS));
						
						// 1. 예매율 구하려는 공연 목록 가져옴
						pfmList = mainDao.selectPfmListByOneDay(dateFormat.format(periodS));
						
					// 오전 10시 30분 이후인 경우, 현재-24시간 ~ 현재를 범위로 함
					}else {
						periodS = new Date(today.getTime() - 24 * 60 * 60 * 1000);
						periodE = today;
						
						// Date -> String 변환
						startStr = dateFormat.format(periodS);
						endStr = dateFormat.format(periodE);
						
						// 1. 예매율 구하려는 공연 목록 가져옴
						pfmList = mainDao.selectPfmListByPeriod(startStr, endStr);
					}
					
					
					// 조회 시작일
					startDate = periodS;
					// 조회 마지막일
					endDate =  periodE;
					
					System.out.println("--------------");
					System.out.println(startDate);
					System.out.println(endDate);
					
					break;
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
			case "weekly":
				try {
					// 0. '조회 구간' 설정
					// 시작 구간: 6일 전
					periodS = new Date(today.getTime()); 
					periodS.setTime(periodS.getTime() - 6 * 24 * 60 * 60 * 1000);
					// 끝 구간: 오늘
					periodE = today; 
					
					// Date -> String 변환
					startStr = dateFormat.format(periodS);
					endStr = dateFormat.format(periodE);
					
					// yyyy-mm-dd 형태
					startDate = dateFormat.parse(startStr);
					endDate =  dateFormat.parse(endStr);
					
					// 1. 예매율 구하려는 공연 목록 가져옴
					pfmList = mainDao.selectPfmListByPeriod(startStr, endStr);
					
					break;
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
		}// end switch
		
		// 2. 공연 리스트 반복문으로 돌면서, 예매율 계산할 구간 구하기
		for(Performance pfm : pfmList) {
			// '티켓' 시작일이 '조회 구간' 시작일 보다 느린 경우, '계산 구간' 시작일 = '티켓' 시작일
			if(pfm.getTicketStart().getTime() - startDate.getTime() >= 0) {
				startDate = pfm.getTicketStart();
			}
			// '조회 구간' 마지막일이 '티켓' 종료일 보다 느린 경우, '계산 구간' 마지막일 = '조회 구간' 마지막일
			if(endDate.getTime() - pfm.getTicketEnd().getTime() >= 0) {
				endDate = pfm.getTicketEnd();
			}
			
			// 3.1 해당 공연의 총 좌석 수 구하기
			int totalSeatCnt = mainDao.selectCntAllSeatByHallIdx(pfm);
			System.out.println(totalSeatCnt);
			
			System.out.println(startDate);
			System.out.println(endDate);
			
			// 3.2 계산 구간에 예매한 좌석 수 구하기
			int bookSeatCnt = mainDao.selectCntBookSeatBypfmIdx(pfm, startDate, endDate);
			System.out.println(bookSeatCnt);
			
			// 3.3 예매율 계산
			float bookRate = 0;
			if(bookSeatCnt != 0) {
				bookRate = ((float)bookSeatCnt/totalSeatCnt) * 100;
			}
			System.out.println("예매율:" + bookRate);
			
			// 예매율 필드에 삽입
			pfm.setBookingRate(bookRate);
			
			// top10 판단
			for(int i = 0; i<topTen.size(); i++) {
				// 기존 top10 후보보다 예매율이 크면 그 자리에 새로 후보로 삽입
				if(pfm.getBookingRate() >= topTen.get(i).getBookingRate()) {
					topTen.add(i, pfm);
					break;
				}
			}
			
			// 첫 번째 요소인 경우 무조건 삽입
			if(topTen.size() == 0) {
				topTen.add(pfm);
			}
		}
		
		// 10개 이상인 경우 10번째까지 자름
		if(topTen.size() > 10) {
			topTen.subList(0, 10);
		}
		
		return topTen;
	}

}
