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
	public List<Performance> getpfmThemeChoicePoster(String theme, String genreIdx) {
		return mainDao.ThemeChoice(theme, genreIdx);
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
		
		// 조회 구간 설정
		// 시작 구간: 30일 전
		Date start = new Date(today.getTime()); 
		start.setTime((long) (start.getTime() - (double)30 * 24 * 60 * 60 * 1000));
		// 끝 구간: 오늘
		Date end = today; 
		
		resPfmList = mainDao.selectAllRankByGenre(start, end, genreIdx);
		return resPfmList;
	}

	@Override
	public List<MainBanner> mainBannerList() {
		return mainDao.selectMainbannerList();
	}

	@Override
	public List<Performance> getnewPoster() {
		return mainDao.selectNewPfmList();
	}

	@Override
	public List<Performance> getconPoster() {
		return mainDao.selectConTabList();
	}

	@Override
	public List<Performance> getMuPoster() {
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
	public List<Performance> getTopRankByPeriod(String type) {
		final int RANK = 10;
		
		Date today = new Date();
		
		List<Performance> topTen = new ArrayList<Performance>();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date start = null;
		Date end = null;
		
		// 조회 구간 설정
		switch (type) {
			case "daily":
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
						start = new Date(tempTodayStart.getTime() - 1);
						// 어제 00시 00분
						end = dateFormat.parse(dateFormat.format(start));
						
					} catch (ParseException e) {
						e.printStackTrace();
					}
				// 오전 10시 30분 이후인 경우, 현재-24시간 ~ 현재를 범위로 함
				}else {
					start = new Date(today.getTime() - 24 * 60 * 60 * 1000);
					end = today;
				}
				
				break;
					
			case "weekly":
				// 시작 구간: 6일 전
				start = new Date(today.getTime()); 
				start.setTime(start.getTime() - 6 * 24 * 60 * 60 * 1000);
				// 끝 구간: 오늘
				end = today; 
				
				break;
					
		}// end switch
		
		topTen = mainDao.selectRankByPeriod(RANK, start, end);
		
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
		final int RANK = 5;
			
		Date today = new Date();

		List<Performance> topFive = new ArrayList<Performance>();

		// 조회 구간 설정
		// 시작 구간: 6일 전
		Date start = new Date(today.getTime()); 
		start.setTime(start.getTime() - 6 * 24 * 60 * 60 * 1000);
		// 끝 구간: 오늘
		Date end = today; 

		int genre = 0;
		if("CON".equals(genreStr)) genre = 1;
		else if("MU".equals(genreStr)) genre = 2;
		else if("FAM".equals(genreStr)) genre = 3;
		
		topFive = mainDao.selectRankByGenre(RANK, start, end, genre);
		
		return topFive;
	}
}