
package ticket.service.admin.impl;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import ticket.controller.admin.AdminUserController;
import ticket.dao.face.PaymentDao;
import ticket.dao.face.UserDao;
import ticket.dto.PaymentInfo;
import ticket.dto.StateOfBook;
import ticket.dto.User;
import ticket.service.admin.face.AdminUserService;
import ticket.utils.Paging;
import ticket.utils.com.siot.IamportRestClient.IamportClient;
import ticket.utils.com.siot.IamportRestClient.exception.IamportResponseException;
import ticket.utils.com.siot.IamportRestClient.request.CancelData;
import ticket.utils.com.siot.IamportRestClient.response.AccessToken;
import ticket.utils.com.siot.IamportRestClient.response.IamportResponse;
import ticket.utils.com.siot.IamportRestClient.response.Payment;

@Service
public class AdminUserServiceImpl implements AdminUserService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminUserServiceImpl.class);
	
	@Autowired UserDao uDao;
	@Autowired PaymentDao pDao;

	@Override
	public String getSearch(HttpServletRequest req) {
		String search = req.getParameter("userListSearch");
		return search;
	}

	@Override
	public int getTotalUser(String search) {
		return uDao.selectCntUserBySearch(search);
	}

	@Override
	public void changeUserGrade(int currUser, int currUserGrade) {
		uDao.updateUserGrade(currUser, currUserGrade);
	}

	@Override
	public List<StateOfBook> getBookDetail(User user) {
		System.out.println("파라미터 유저: "+user);
		System.out.println("DAO결과:"+uDao.selectSOB(user));
		
		return uDao.selectSOB(user);
	}

	@Override
	public int getConnectUser() {
		 
		return 0;
	}

	@Override
	public int getUnanswered() {
		 
		return 0;
	}

	@Override
	public List<User> getPagingListByPaging(Paging paging) {
		return uDao.selectPagingUserListByPaging(paging);
	}

	@Override
	public User getUserByUserIdx(User user) {
		return uDao.selectUserGrade(user);
	}

	@Override
	public int getTotalBook(String search) {
		return uDao.selectCntSobBySearch(search);
	}

	@Override
	public List<StateOfBook> getSobListByPaging(Paging paging) {
		return uDao.selectSobListByPaging(paging);
	}

	@Override
	public List<PaymentInfo> getImpUid(String bookGroup) {
		return uDao.selectImpUidByBookGroup(bookGroup);
	}

	@Override
	public String paymentCancel(List<PaymentInfo> pay) {
		//imp_uid랑 sec_pay 담겨져 있는 리스트
		System.out.println("AdminUserServiceImpl에 List 확인 : "+pay);
		
		Gson jsonParser = new Gson();
		
		IamportClient client;
		String api_key = "3927322193332266";
		String api_secret = "YprBYXKjT13iigqeCLCQ2hxxeTOqHY4Fnvgls0Em2IEkZ4yBPasSr0pFTe6AcafzGwV9xAvzi9ThesT3";
		client = new IamportClient(api_key, api_secret);
		try {
			IamportResponse<AccessToken> auth_response = client.getAuth();

		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());

			switch (e.getHttpStatusCode()) {
			case 401:
				return jsonParser.toJson("인증에 실패하였습니다. API키와 secret을 확인하세요");
//	            break;
			case 500:
				return jsonParser.toJson("실패");
//	            break;
			}
		} catch (IOException e) {
			// 서버 연결 실패
			e.printStackTrace();
		}
		/////////////////////////

		int sumSecPay = 0;
		
		// for문 돌리기
		// String already_cancelled_imp_uid=rp.getImpUid();
		for(int i=0; i<pay.size(); i++) {	
			String already_cancelled_imp_uid = pay.get(i).getImpUid();
			
			CancelData cancel_data = new CancelData(already_cancelled_imp_uid, true, BigDecimal.valueOf(pay.get(i).getSecPay())); // imp_uid를 통한 전액취소
			System.out.println("취소금액 확인 : "+pay.get(i).getSecPay());
			try {
				IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
	
			} catch (IamportResponseException e) {
				System.out.println(e.getMessage());
	
				switch (e.getHttpStatusCode()) {
				case 401:
					return jsonParser.toJson("Unauthorized");
	//	            break;
				case 500:
					return jsonParser.toJson("실패");
	//	            break;
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			sumSecPay += pay.get(i).getSecPay();
			//DB삭제
			uDao.deleteBook(pay.get(i)); //예매내역삭제
			uDao.deleteSeat(pay.get(i)); //좌석 취소
			pDao.updatePayment(pay.get(i)); //paid_amount에서 취소값 빼주기
			
		}
		
		if(pay.get(0).getPaidAmount() - sumSecPay == 0) {
			//DB에서 Payment삭제
			pDao.deletePayment(pay.get(0));	
		}
		
		return jsonParser.toJson("결제가 취소 되었습니다.");
	}

	@Override
	public int getTotalSob(String search) {
		// 예매현황 count 구하기
		return uDao.selectTotalSob(search);
	}
}
	
