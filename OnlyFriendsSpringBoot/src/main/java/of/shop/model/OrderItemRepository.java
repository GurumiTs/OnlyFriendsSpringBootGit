package of.shop.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.lang.String;
import of.shop.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, String>{

	@Query(value = "update orderitem set amount = ?1 where paymentId = ?2 and proId = ?3", nativeQuery = true)
	public void updateamount(int amount,String paymentId,int proId) ;

	
	@Query(value = "select proId from orderitem o where o.paymentId = ?1", nativeQuery = true)
	public List<Integer> orderproIdlist(String paymentId);
	
	
	public List<OrderItem> findByPaymentId(String paymentIdString);
}
