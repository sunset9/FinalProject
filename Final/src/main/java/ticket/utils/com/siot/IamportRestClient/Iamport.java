package ticket.utils.com.siot.IamportRestClient;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.Header;
import retrofit2.http.POST;
import retrofit2.http.Path;
import ticket.utils.com.siot.IamportRestClient.request.AgainPaymentData;
import ticket.utils.com.siot.IamportRestClient.request.AuthData;
import ticket.utils.com.siot.IamportRestClient.request.CancelData;
import ticket.utils.com.siot.IamportRestClient.request.OnetimePaymentData;
import ticket.utils.com.siot.IamportRestClient.request.ScheduleData;
import ticket.utils.com.siot.IamportRestClient.request.UnscheduleData;
import ticket.utils.com.siot.IamportRestClient.request.escrow.EscrowLogisData;
import ticket.utils.com.siot.IamportRestClient.request.naver.NaverCancelData;
import ticket.utils.com.siot.IamportRestClient.request.naver.NaverPlaceData;
import ticket.utils.com.siot.IamportRestClient.request.naver.NaverShipData;
import ticket.utils.com.siot.IamportRestClient.response.AccessToken;
import ticket.utils.com.siot.IamportRestClient.response.Certification;
import ticket.utils.com.siot.IamportRestClient.response.IamportResponse;
import ticket.utils.com.siot.IamportRestClient.response.PagedDataList;
import ticket.utils.com.siot.IamportRestClient.response.Payment;
import ticket.utils.com.siot.IamportRestClient.response.PaymentBalance;
import ticket.utils.com.siot.IamportRestClient.response.Schedule;
import ticket.utils.com.siot.IamportRestClient.response.escrow.EscrowLogisInvoice;
import ticket.utils.com.siot.IamportRestClient.response.naver.NaverProductOrder;
import ticket.utils.com.siot.IamportRestClient.response.naver.NaverReview;

public interface Iamport {

	@POST("/users/getToken")
	Call<IamportResponse<AccessToken>> token(
		@Body AuthData auth);
	
	@GET("/payments/{imp_uid}/balance")
    Call<IamportResponse<PaymentBalance>> balance_by_imp_uid(
    	@Header("Authorization") String token,
        @Path("imp_uid") String imp_uid
    );
	
	@GET("/payments/{imp_uid}")
    Call<IamportResponse<Payment>> payment_by_imp_uid(
    	@Header("Authorization") String token,
        @Path("imp_uid") String imp_uid
    );
	
	@GET("/payments/status/{payment_status}")
    Call<IamportResponse<PagedDataList<Payment>>> payments_by_status(
    	@Header("Authorization") String token,
        @Path("payment_status") String payment_status
    );
	
	@POST("/payments/cancel")
	Call<IamportResponse<Payment>> cancel_payment(
		@Header("Authorization") String token,
		@Body CancelData cancel_data
	);
	
	@POST("/subscribe/payments/onetime")
	Call<IamportResponse<Payment>> onetime_payment(
		@Header("Authorization") String token,
		@Body OnetimePaymentData onetime_data
	);
	
	@POST("/subscribe/payments/again")
	Call<IamportResponse<Payment>> again_payment(
		@Header("Authorization") String token,
		@Body AgainPaymentData again_data
	);
	
	@POST("/subscribe/payments/schedule")
	Call<IamportResponse<List<Schedule>>> schedule_subscription(
		@Header("Authorization") String token,
		@Body ScheduleData schedule_data
	);
	
	@POST("/subscribe/payments/unschedule")
	Call<IamportResponse<List<Schedule>>> unschedule_subscription(
		@Header("Authorization") String token,
		@Body UnscheduleData unschedule_data
	);
	
	/* 본인인증 결과 (certification result) */
	@GET("/certifications/{imp_uid}")
    Call<IamportResponse<Certification>> certification_by_imp_uid(
    	@Header("Authorization") String token,
        @Path("imp_uid") String imp_uid
    );
	
	@POST("/escrows/logis/{imp_uid}")
	Call<IamportResponse<EscrowLogisInvoice>> post_escrow_logis(
		@Header("Authorization") String token,
		@Path("imp_uid") String imp_uid,
		@Body EscrowLogisData logis_data
	);

	@GET("/payments/{imp_uid}/naver/product-orders")
	Call<IamportResponse<List<NaverProductOrder>>> naver_product_orders(
		@Header("Authorization") String token,
		@Path("imp_uid") String imp_uid
	);
	
	@GET("/naver/product-orders/{product_order_id}")
	Call<IamportResponse<NaverProductOrder>> naver_single_product_order(
		@Header("Authorization") String token,
		@Path("product_order_id") String product_order_id
	);
	
	@GET("/naver/reviews")
	Call<IamportResponse<List<NaverReview>>> naver_reviews(
		@Header("Authorization") String token
	);
	
	@POST("/payments/{imp_uid}/naver/cancel")
	Call<IamportResponse<List<NaverProductOrder>>> naver_cancel(
		@Header("Authorization") String token,
		@Path("imp_uid") String imp_uid,
		@Body NaverCancelData naver_cancel_data
	);
	
	@POST("/payments/{imp_uid}/naver/ship")
	Call<IamportResponse<List<NaverProductOrder>>> naver_ship(
		@Header("Authorization") String token,
		@Path("imp_uid") String imp_uid,
		@Body NaverShipData naver_ship_data
	);
	
	@POST("/payments/{imp_uid}/naver/place")
	Call<IamportResponse<List<NaverProductOrder>>> naver_place(
		@Header("Authorization") String token,
		@Path("imp_uid") String imp_uid,
		@Body NaverPlaceData naver_place_data
	);
}
