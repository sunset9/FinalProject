package ticket.service.face;

import java.util.List;

import ticket.dto.MyChoice;

public interface MyChoiceService {

	
	/**
	 * @최종수정일: 2018.12.14
	 * @Method설명: 유저가 찜해놓은 공연 불러오기!
	 * @작성자:홍나영
	 */
	public List<MyChoice> choicePfmList(int userIdx);
	/**
	 * @Method설명: 찜 클릭 했을 때 추가
	 * @작성자 : 홍나영
	 */
	public void choice(int userIdx, int pfmIdx);
	
	/**
	 * @Method설명: 찜 취소 할 때 삭제
	 * @작성자 : 홍나영
	 */
	public void cancel(MyChoice myChoice);
	
	
	
}
