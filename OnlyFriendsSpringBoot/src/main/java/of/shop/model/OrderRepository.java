package of.shop.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<OrderItem,String>{

	@Query(value = "select amount from orderitem o where o.paymentId =?1 and o.proId =?2",nativeQuery = true)
	public int amount(int paymentId,int proId) ;
		
	
}
