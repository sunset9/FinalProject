package ticket.utils.com.siot.IamportRestClient;


import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Header;
import retrofit2.http.POST;
import retrofit2.http.Path;
import ticket.utils.com.siot.IamportRestClient.request.payco.OrderStatusData;
import ticket.utils.com.siot.IamportRestClient.response.IamportResponse;
import ticket.utils.com.siot.IamportRestClient.response.payco.OrderStatus;

public interface PaycoImpl {

	@POST("/payco/orders/status/{imp_uid}")
	Call<IamportResponse<OrderStatus>> updateStatus(
		@Header("Authorization") String token,
		@Path("imp_uid") String imp_uid,
		@Body OrderStatusData statusData
	);
	
}
