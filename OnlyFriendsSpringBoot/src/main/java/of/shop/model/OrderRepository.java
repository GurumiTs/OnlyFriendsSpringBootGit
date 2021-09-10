package of.shop.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<OrderDetails,String>{

	OrderDetails findByPaymentId(String paymentId);
		
	
}
