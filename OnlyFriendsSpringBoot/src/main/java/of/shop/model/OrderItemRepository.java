package of.shop.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderItemRepository extends JpaRepository<OrderItem, String>{

	@Query(value = "update orderitem set amount = ?1 where paymentId = ?2 and proId = ?3", nativeQuery = true)
	public void updateamount(int amount,String paymentId,int proId) ;
}
