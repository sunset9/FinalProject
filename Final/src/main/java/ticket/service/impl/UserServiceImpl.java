package ticket.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ticket.dao.face.MyChoiceDao;
import ticket.dao.face.PfmDao;
import ticket.dao.face.UserDao;
import ticket.dto.Artist;
import ticket.dto.PaymentInfo;
import ticket.dto.Performance;
import ticket.dto.PreferTheme;
import ticket.dto.Seat;
import ticket.dto.SeatSection;
import ticket.dto.Shipment;
import ticket.dto.StateOfBook;
import ticket.dto.User;
import ticket.service.face.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private MyChoiceDao myChoiceDao;
	@Autowired
	private PfmDao pfmDao;
	
	@Override
	public int loginCheck(User user, HttpSession session) {
			
		int userIdx =userDao.selectCntUser(user) ;
		
		System.out.println("DAO 실행하고 오시나?");
		
		if(userIdx!= 0) { 
			user.setUserIdx(userIdx);
			session.setAttribute("login", true);
			user = userDao.selectUser(userIdx);
			session.setAttribute("loginUser", user);
			session.setMaxInactiveInterval(60*60);
			
		} else {
			session.setAttribute("login", false);
		}
		return 	userDao.selectCntUser(user);
	}
	

	@Override
	public boolean checkPw(User user) {
		boolean res = false;
		String pass = userDao.selectPwByUserIdx(user);
		
		
		if(pass.equals(user.getPassword())) {
			res = true;
		}
		
		return res;
	}

	@Override
	public User getUser(int userIdx) {
		
		return userDao.selectUser(userIdx);
	}

	@Override
	public void updateNick(User user) {
		userDao.updateNick(user);
	}

	@Override
	public void updatePass(User user) {
		userDao.updatePass(user);
	}

	@Override
	public void updatePhone(User user) {
		userDao.updatePhone(user);
	}
	
	
	@Override
	public void updateAddr(User user) {
		userDao.updateAddr(user);
	}

	@Override
	public int join(User user) {
		return userDao.insert(user);
	}


	@Override
	public int checkSignup(String email) {
		return userDao.selectUserByEmail(email);
	}


	@Override
	public int checkNick(String nick) {
		return userDao.selectUserByNick(nick);
	}



	@Override
	public List<Performance> recommendPfm(List<PreferTheme> ptList) {
		Map map = new HashMap<>();
		map.put("ptList", ptList);
		
		return pfmDao.selectPfmByPreferTheme(map);
	}


	@Override
	public String findEmail(User user) {
		String email = userDao.selectEmailByNameAndPhone(user);
		
		// 이메일 앞 뒤 부분 나누기
		String[] data =email.split("@");
		
		System.out.println("data0 :" +data[0]);
		System.out.println("data1 :" +data[1]);
		
		//앞 4자리까지만 표시해주고 나머지는 *표시로 바꾸기
		email = data[0].substring(0,4);
		for(int i=4; i<data[0].length(); i++ ) {
			email+= "*";
		}
		
		email+= "@" +data[1];
		
		
		return email;
	}


	@Override
	public void changePw(User user) {
		userDao.updatePass(user);
	}


	@Override
	public void updateProfile(ServletContext context, MultipartFile file, User user) {
		
		
		// 파일이 저장될 경로 
		String stored = context.getRealPath("profile");
		
		// 파일 객체 
		File profile = new File (stored);
		
		// 원본이름과 저장이름 지정 
		user.setProfile("/resources/image/profile/"+file.getOriginalFilename());

		try {
			// 파일 저장 (업로드)
			file.transferTo(profile);
		
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 프로필 저장
		userDao.updateProfile(user);
		
	}


	@Override
	public List<StateOfBook> userTicket(User user) {
		return userDao.selectSOB(user);
	}


	@Override
	public StateOfBook getDetailBook(User user, String bookGroup) {
		Map map = new HashMap<>();
		System.out.println("getDetailBook함수 안에 유저인덱스 검사"+user.getUserIdx());
		map.put("userIdx", user.getUserIdx());
		map.put("bookGroup", bookGroup);
		
		return userDao.selectBook(map);
	}


	@Override
	public int getReceive(String bookGroup) {
		return userDao.selectReceive(bookGroup);
	}


	@Override
	public Shipment getShipment(String bookGroup) {
		return userDao.selectShipmet(bookGroup);
	}


	@Override
	public SeatSection selectSeatSection(String bookGroup) {
		return userDao.selectSeat(bookGroup);
	}


	@Override
	public PaymentInfo getPayment(String impUid) {
		return userDao.selectPaymentByimpUid(impUid);
	}


	@Override
	public List<Seat> getSeat(String bookGroup) {
		
		return userDao.selectSeatByBookGroup(bookGroup);
	}


	@Override
	public void cancelBook(String names) {
		userDao.updateStateCancel(names);
		userDao.updateState(names);
	}


	@Override
	public List<SeatSection> getCancelSeat(String names) {
		return userDao.selectCancelSeat(names);
	}


	@Override
	public List<StateOfBook> cancelTicket(User user) {
		return userDao.selectCancelTicket(user);
	}


	@Override
	public int getBook(int userIdx) {
		return userDao.selectCntBook(userIdx);
	}


	@Override
	public int getCancel(int userIdx) {
		return userDao.selectCntCancelBook(userIdx);
	}


	@Override
	public int getCntPreferArtist(int userIdx) {
		return userDao.selectCntPreferArtist(userIdx);
	}


	@Override
	public List<Artist> getArtistName(int userIdx) {
		return userDao.selectArtistName(userIdx);
	}


	@Override
	public int getCancelCnt(String bookGroup) {
		return userDao.selectCntCancel(bookGroup);
	}


	@Override
	public StateOfBook getDetailCancel(User user, String bookGroup) {
		Map map = new HashMap<>();
		map.put("userIdx", user.getUserIdx());
		map.put("bookGroup", bookGroup);
		
		return userDao.selectCancel(map);
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
