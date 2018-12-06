package ticket.service.admin.face;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import ticket.dto.CategoryCon;
import ticket.dto.CategoryFam;
import ticket.dto.CategoryMu;
import ticket.dto.PosterInfo;

public interface AdminPfmService {

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:콘서트 배너 리스트
	 * @작성자:박주희
	 */
	public List<PosterInfo> getListCon();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 가족아동 배너 리스트
	 * @작성자:박주희
	 */
	public List<PosterInfo> getListFam();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 뮤지컬 배너 리스트
	 * @작성자:박주희
	 */
	public List<PosterInfo> getListMu();

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 콘서트 배너 추가
	 * @작성자:박주희
	 */
	public void addCon(CategoryCon con);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명: 가족&아동 공연 배너 추가
	 * @작성자:박주희
	 */
	public void addFam(CategoryFam fam);

	/**
	 * @최종수정일: 2018.12.06
	 * @Method설명:test 중입니다.
	 * @작성자:박주희
	 */
	public void addFamPoster(ServletContext context,
			MultipartFile file);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:뮤지컬공연 배너 추가
	 * @작성자:박주희
	 */
	public void addMu(CategoryMu mu);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(콘서트) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeCon(CategoryCon con);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(가족&아동) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeFam(CategoryCon fam);

	/**
	 * @최종수정일: 2018.12.05
	 * @Method설명:카테고리(뮤지컬) 배너 삭제
	 * @작성자:박주희
	 */
	public void removeMu(CategoryCon mu);

}
