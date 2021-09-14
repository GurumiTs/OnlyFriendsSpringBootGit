package of.shop.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import java.lang.String;
import of.shop.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, String>{

	@Query(value = "update orderitem set amount = ?1 where paymentId = ?2 and proId = ?3", nativeQuery = true)
	@Modifying
	public void updateamount(int amount,String paymentId,int proId) ;

	
	@Query(value = "select proId from orderitem o where o.paymentId = ?1", nativeQuery = true)
	public List<Integer> orderproIdlist(String paymentId);
	
	@Query(value = "select * from orderitem where paymentId = ?1 and proId = ?2", nativeQuery = true)
	public OrderItem findorderitem(String paymentId,int proId);
	
	public List<OrderItem> findByPaymentId(String paymentIdString);
	
	@Query(value = "select amount from orderitem where paymentId=?1 and proId = ?2",nativeQuery = true)
	public Integer orderAmountlist(String paymentId,int proId);
}
