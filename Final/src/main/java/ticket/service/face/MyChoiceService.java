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
	public boolean cancel(MyChoice myChoice);
	
	
	/**
	 * @최종수정일: 2019.01.09
	 * @Method설명: 해당 공연을 찜해놓았는지 확인
	 * @작성자:홍나영
	 */
	public int check(int userIdx, int pfmIdx);
	
	
	/**
	 * @최종수정일: 2019.01.10
	 * @Method설명:공연 찜한거 추가하기
	 * @작성자:홍나영
	 */
//	public boolean addPfmChoice(int userIdx, int pfmIdx);
}
