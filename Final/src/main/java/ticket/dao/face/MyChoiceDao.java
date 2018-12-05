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
	public void insert();
	
	/**
	 * @Method설명: 찜 지우기
	 * @작성자 : 홍나영
	 */
	public void delete(MyChoice myChoice);
}
