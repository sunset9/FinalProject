package ticket.dao.face;

import java.util.List;

import ticket.dto.MyChoice;

public interface MyChoiceDao {
	
	/**
	 * @Method설명: 찜 리스트 얻어오기
	 * @작성자 : 홍나영
	 */
	public List<MyChoice> selectChoiceList(int userIdx);
	
	/**
	 * @Method설명: 찜 추가하기
	 * @작성자 : 홍나영
	 */
	public void insert(MyChoice myChoice);
	
	/**
	 * @Method설명: 찜 지우기
	 * @작성자 : 홍나영
	 */
	public void delete(MyChoice myChoice);
	
	
	/**
	 * @최종수정일: 2019.01.09
	 * @Method설명: 해당 공연 찜해논 이력이 있는지 체크
	 * @작성자:홍나영
	 */
	public int selectCntChoice(MyChoice myChoice);
}
