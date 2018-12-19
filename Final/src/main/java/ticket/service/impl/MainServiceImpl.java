package ticket.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	public List<Performance> getRank(String sort, Date today) {
		switch (sort) {
			case "daily":
				break;
			case "weekly":
				// 0. '조회 구간' 설정
				// 시작 구간: 6일 전
				Date periodS = new Date(today.getTime()); 
				periodS.setTime(periodS.getTime() - 6 * 24 * 60 * 60 * 1000);
				// 끝 구간: 오늘
				Date periodE = today; 
				
				// Date -> String 변환
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String start = dateFormat.format(periodS);
				String end = dateFormat.format(periodE);

				// 1. 예매율 구하려는 공연 목록 가져옴
				List<Performance> pfmList = mainDao.selectPfmListByPeriod(start, end);
				System.out.println(pfmList);
				
				// 2. 공연 리스트 반복문으로 돌면서, 예매율 계산할 구간 구하기
				for(Performance pfm : pfmList) {
					try {
						Date startDate = dateFormat.parse(start);
						Date endDate =  dateFormat.parse(end);
						
						// '티켓' 시작일이 '조회 구간' 시작일 보다 느린 경우, '계산 구간' 시작일 = '티켓' 시작일
						if(pfm.getTicketStart().getTime() - startDate.getTime() >= 0) {
							startDate = pfm.getTicketStart();
						}
						// '티켓' 종료일이 '조회 구간' 마지막일 보다 느린 경우, '계산 구간' 마지막일 = '조회 구간' 마지막일
						if(pfm.getTicketEnd().getTime() - endDate.getTime() >= 0) {
							endDate = pfm.getTicketEnd();
						}
						
						// 3.1 해당 공연의 총 좌석 수 구하기
						int totalSeatCnt = mainDao.selectCntAllSeatByHallIdx(pfm);
						
						// 3.2 계산 구간에 예매한 좌석 수 구하기
						int bookSeatCnt = mainDao.selectCntBookSeatBypfmIdx(pfm);
						
						// 3.3 예매율 계산
						
						
						
						
						
						
						
						
					} catch (ParseException e) {
						e.printStackTrace();
					}
					
					
					
				}
				
				break;
		}
		return null;
	}

}
