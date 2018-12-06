package ticket.dao.face;

import java.util.List;

import ticket.dto.Book;
import ticket.dto.User;

public interface BookDao {

	/**
	 * 2018.12.05
	 * @Method설명:예매 등록
	 * @작성자: 박주희
	 */
	public void insert(Book book);

	/**
	 * 2018.12.05
	 * @Method설명:예매 삭제
	 * @작성자: 박주희
	 */
	public void delete(Book book);

	/**
	 * 2018.12.05
	 * @Method설명:예매 리스트 불러오기
	 * @작성자: 박주희
	 */
	public List<Book> select();

	/**
	 * 2018.12.05
	 * @Method설명: 유저 아이디로 예약 조회
	 * @작성자: 박주희
	 */
	public Book selectByUserId(User u);
	
}
