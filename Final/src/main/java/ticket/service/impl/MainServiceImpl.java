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
import ticket.dto.Artist;
import ticket.dto.Hall;
import ticket.dto.HallFile;
import ticket.dto.MainBanner;
import ticket.dto.Performance;
import ticket.dto.Poster;
import ticket.service.face.MainService;

@Service
public class MainServiceImpl implements MainService {
//	private static final Logger logger = LoggerFactory.getLogger(MainServiceImpl.class);

	@Autowired MainDao mainDao;

	@Override
	public List<Performance> adminChoiceBannerCon() {
		return mainDao.selectAdminBanCon();
	}

	@Override
	public List<Performance> adminChoiceBannerMu() {
		return mainDao.selectAdminBanMu();
	}

	@Override
	public List<Performance> adminChoiceBannerFam() {
		return mainDao.selectAdminBanFam();
	}

	@Override
	public List getPfmRanking(Performance pfm) {
		return mainDao.selectPfmRanking(pfm);
	}

	@Override
	public List<Performance> getConPfmPoster() {
//		logger.info(mainDao.selectPfmPosterInfo().toString());
		return mainDao.selectConPfmPosterInfo();
	}

	@Override
	public List<Performance> getMuPfmPoster() {
		return mainDao.selectMuPfmPosterInfo();
	}

	@Override
	public List<Performance> getFamPfmPoster() {
		return mainDao.selectFamPfmPosterInfo();
	}

	@Override
	public List<Performance> getpfmThemeChoicePoster(String theme) {
		return mainDao.ThemeChoice(theme);
	}

	@Override
	public List<Performance> getDeadlineList(int genreIdx) {
		return mainDao.selectDeadlindListPfm(genreIdx);
	}

	@Override
	public List<Performance> getLatestList(int genreIdx) {
		return mainDao.selectLatestListPfm(genreIdx);
	}

	@Override
	public List<Performance> getPopularityList(int genreIdx) {
		List<Performance> resPfmList = new ArrayList<>();
		
		// 오늘 날짜
		Date today = new Date();
		
		// 0. '조회 구간' 설정
		// 시작 구간: 30일 전
		Date periodS = new Date(today.getTime()); 
		periodS.setTime((long) (periodS.getTime() - (double)30 * 24 * 60 * 60 * 1000));
		// 끝 구간: 오늘
		Date periodE = today; 
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		// Date -> String 변환
		String startStr = dateFormat.format(periodS);
		String endStr = dateFormat.format(periodE);
		
		// 1. 예매율 구하려는 공연 목록 가져옴
		List<Performance> pfmList = mainDao.selectPfmListByPeriodNGenre(startStr, endStr, genreIdx);
		
		// 2. 공연 리스트 반복문으로 돌면서, 예매율 계산할 구간 구하기
		for(Performance pfm : pfmList) {
			// 최종 조회 범위
			Date startDate = periodS;
			Date endDate = periodE;
			
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
			
			// 3.3 해당 공연의 공연 횟수 구하기 
			int pfmDbtCnt = mainDao.selectPfmDbtCntByPfmIdx(pfm, startDate, endDate);
			System.out.println(pfmDbtCnt);
			
			// 3.4 예매율 계산
			float bookRate = 0;
			if(bookSeatCnt != 0) {
				bookRate = (((float)bookSeatCnt/pfmDbtCnt) / totalSeatCnt) * 100;
			}
			System.out.println("예매율:" + bookRate);
			
			// 예매율 필드에 삽입
			pfm.setBookingRate(bookRate);
			
			// 예매순으로 결과 리스트에 삽입
			for(int i = 0; i<resPfmList.size(); i++) {
				if(pfm.getBookingRate() >= resPfmList.get(i).getBookingRate()) {
					resPfmList.add(i, pfm);
					break;
				}
			}
			
			// 첫 번째 요소인 경우 무조건 삽입
			if(resPfmList.size() == 0) {
				resPfmList.add(pfm);
			}
			
		} // end for
		return resPfmList;
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
	public List<Performance> getTopRank(String type) {
		Date today = new Date();
		
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
				// 0. '조회 구간' 설정
				Calendar todayCal = Calendar.getInstance();
				todayCal.setTime(today);
				
				// 오전 10시 30분 이전인 경우, 전날 24시간을 범위로 함
				// yyyy-mm-dd 00:00:00 ~ yyyy-mm-dd 23:59:59
				if(todayCal.get(Calendar.HOUR_OF_DAY) <= 10 
						|| (todayCal.get(Calendar.HOUR_OF_DAY) == 10 && todayCal.get(Calendar.MINUTE) < 30)){
					try {
						// 오늘 00시 00분
						Date tempTodayStart = dateFormat.parse(dateFormat.format(today));
						// 어제 23시 59분 59초 999
						periodS = new Date(tempTodayStart.getTime() - 1);
						// 어제 00시 00분
						periodE = dateFormat.parse(dateFormat.format(periodS));
						
						// 1. 예매율 구하려는 공연 목록 가져옴
						pfmList = mainDao.selectPfmListByOneDay(dateFormat.format(periodS));
					
					} catch (ParseException e) {
						e.printStackTrace();
					}
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
				
				break;
					
			case "weekly":
				// 0. '조회 구간' 설정
				// 시작 구간: 6일 전
				periodS = new Date(today.getTime()); 
				periodS.setTime(periodS.getTime() - 6 * 24 * 60 * 60 * 1000);
				// 끝 구간: 오늘
				periodE = today; 
				
				// Date -> String 변환
				startStr = dateFormat.format(periodS);
				endStr = dateFormat.format(periodE);
				
				// 1. 예매율 구하려는 공연 목록 가져옴
				pfmList = mainDao.selectPfmListByPeriod(startStr, endStr);
				
				break;
					
		}// end switch
		
		// 2. 공연 리스트 반복문으로 돌면서, 예매율 계산할 구간 구하기
		for(Performance pfm : pfmList) {
			// 조회 범위 초기화
			startDate = periodS;
			endDate =  periodE;
			
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
			
			// 3.3 해당 공연의 공연 횟수 구하기 
			int pfmDbtCnt = mainDao.selectPfmDbtCntByPfmIdx(pfm, startDate, endDate);
			System.out.println(pfmDbtCnt);
			
			// 3.4 예매율 계산
			float bookRate = 0;
			if(bookSeatCnt != 0) {
				bookRate = (((float)bookSeatCnt/pfmDbtCnt) / totalSeatCnt) * 100;
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

	@Override
	public List<Performance> getOpenSerchList(String opentext) {
		return mainDao.selectOpenSearchList(opentext);
	}

	@Override
	public List<Poster> getFitPfmList(String userIdx) {
		return mainDao.selectFitPfmList(userIdx);
	}

	@Override
	public List<Poster> getSearchPfmList(String top_searchh) {
		return mainDao.selectSearchPfmList(top_searchh);
	}

	@Override
	public List<Artist> getSearchArtList(String top_searchh) {
		return mainDao.selectSearchArtList(top_searchh);
	}

	@Override
	public List<HallFile> getSearchHallList(String top_searchh) {
		return mainDao.selectSearchHallList(top_searchh);
	}

	@Override
	public List<Hall> getSearchHallNameList(String top_searchh) {
		return mainDao.selectSearchHallNameList(top_searchh);
	}

	@Override
	public int getPfmCount(String top_searchh) {
		int cnt = mainDao.selectPfmCount(top_searchh);
		
		return cnt;
	}

	@Override
	public int getArtCount(String top_searchh) {
		int cnt = mainDao.selectArtCount(top_searchh);
		
		return cnt;
	}

	@Override
	public int getHallCount(String top_searchh) {
		int cnt = mainDao.selectHallCount(top_searchh);
		
		return cnt;
	}

	@Override
	public List<Performance> getOpenSelectSearchList(String genreIdx, String opentext) {
		return mainDao.selectOpenSelectSearchList(genreIdx, opentext);
	}
	
	@Override
	public List<Performance> getTopRankByGenre(String genreStr) {
		Date today = new Date();

		List<Performance> topFive = new ArrayList<Performance>();

		// 0. '조회 구간' 설정
		// 시작 구간: 6일 전
		Date periodS = new Date(today.getTime()); 
		periodS.setTime(periodS.getTime() - 6 * 24 * 60 * 60 * 1000);
		// 끝 구간: 오늘
		Date periodE = today; 

		// Date -> String 변환
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String startStr = dateFormat.format(periodS);
		String endStr = dateFormat.format(periodE);

		// 1. 예매율 구하려는 공연 목록 가져옴
		int genre = 0;
		if("CON".equals(genreStr)) genre = 1;
		else if("MU".equals(genreStr)) genre = 2;
		else if("FAM".equals(genreStr)) genre = 3;

		List<Performance> pfmList = mainDao.selectPfmListByPeriodNGenre(startStr, endStr, genre);

		// 2. 공연 리스트 반복문으로 돌면서, 예매율 계산할 구간 구하기
		for(Performance pfm : pfmList) {
			// 조회 범위 초기화
			Date startDate = periodS;
			Date endDate = periodE;

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

			// 3.3 해당 공연의 공연 횟수 구하기 
			int pfmDbtCnt = mainDao.selectPfmDbtCntByPfmIdx(pfm, startDate, endDate);
			System.out.println(pfmDbtCnt);

			// 3.4 예매율 계산
			float bookRate = 0;
			if(bookSeatCnt != 0) {
				bookRate = (((float)bookSeatCnt/pfmDbtCnt) / totalSeatCnt) * 100;
			}
			System.out.println("예매율:" + bookRate);

			// 예매율 필드에 삽입
			pfm.setBookingRate(bookRate);

			// top5 판단
			for(int i = 0; i<topFive.size(); i++) {
				// 기존 top5 후보보다 예매율이 크면 그 자리에 새로 후보로 삽입
				if(pfm.getBookingRate() >= topFive.get(i).getBookingRate()) {
					topFive.add(i, pfm);
					break;
				}
			}

			// 첫 번째 요소인 경우 무조건 삽입
			if(topFive.size() == 0) {
				topFive.add(pfm);
			}

		}

		// 5개 이상인 경우 5번째까지 자름
		if(topFive.size() > 5) {
			topFive.subList(0, 5);
		}

		return topFive;
	}
}