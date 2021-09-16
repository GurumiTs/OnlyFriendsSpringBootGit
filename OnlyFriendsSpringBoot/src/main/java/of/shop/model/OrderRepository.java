package of.shop.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<OrderDetails,String>{

	OrderDetails findByPaymentId(String paymentId);
	
	List<OrderDetails> findByMemberAccount(String memberAccount);
	
	@Query(value = "select sum(total) from orderdetails where orderStatus='已出貨'",nativeQuery = true)
	public Float orderannual();
	
	@Query(value = "select sum(total) from orderdetails where Month(orderTime) =?1 and orderStatus='已出貨'",nativeQuery = true)
	public Float monthordertotal(Integer month);
	
	@Query(value = "select * from orderdetails where orderStatus=?1",nativeQuery = true)
	public List<OrderDetails> orderDetails(String order);
		
	
}
