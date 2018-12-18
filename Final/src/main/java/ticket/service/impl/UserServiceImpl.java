package ticket.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MyChoiceDao;
import ticket.dao.face.PfmDao;
import ticket.dao.face.UserDao;
import ticket.dto.MyChoice;
import ticket.dto.Performance;
import ticket.dto.PreferTheme;
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
		if(userIdx!= 0) { 
			user.setUserIdx(userIdx);
			session.setAttribute("login", true);
			user = userDao.selectUser(userIdx);
			session.setAttribute("loginUser", user);
			
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







}
