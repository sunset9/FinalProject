package ticket.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.dao.face.MyChoiceDao;
import ticket.dto.MyChoice;
import ticket.service.face.MyChoiceService;

@Service
public class MyChoiceServiceImpl implements MyChoiceService{

	@Autowired
	private MyChoiceDao myChoiceDao;
	
	@Override
	public List<MyChoice> choicePfmList(int userIdx) {
		return myChoiceDao.selectChoiceList(userIdx);
	}

	@Override
	public void choice(int userIdx, int pfmIdx) {
		MyChoice myChoice = new MyChoice();
		myChoice.setPfmIdx(pfmIdx);
		myChoice.setUserIdx(userIdx);
		
		myChoiceDao.insert(myChoice);
	}

	@Override
	public void cancel(MyChoice myChoice) {
		myChoiceDao.delete(myChoice);
	}


}
