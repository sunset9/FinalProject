package ticket.service.face;

import java.util.List;

import ticket.dto.MyChoice;

public interface MyChoiceService {

	
	/**
	 * @Method설명: 찜한 목록 불러오기
	 * @작성자 : 홍나영
	 */
	public List<MyChoice> choiceList(int userIdx);
	
	/**
	 * @Method설명: 찜 클릭 했을 때 추가
	 * @작성자 : 홍나영
	 */
	public void choice();
	
	/**
	 * @Method설명: 찜 취소 할 때 삭제
	 * @작성자 : 홍나영
	 */
	public void cancel(MyChoice myChoice);
	
}
