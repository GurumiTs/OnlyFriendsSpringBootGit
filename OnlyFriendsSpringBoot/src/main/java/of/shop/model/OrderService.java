package of.shop.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	

	public void insert(OrderDetails orderDetails) {
		orderRepository.save(orderDetails);
	}
	
	public OrderDetails findByPaymentId(String paymentId) {
		OrderDetails orders=orderRepository.findByPaymentId(paymentId);
		return orders;
	}
	
	public List<OrderDetails> findAll(){
		return orderRepository.findAll();
	}
	
	public void update(OrderDetails orderDetails) {
		orderRepository.save(orderDetails);
	}
	
	public List<OrderDetails> findByMemberAccount(String memberAccount) {
		List<OrderDetails> orderDetails = orderRepository.findByMemberAccount(memberAccount);
		return orderDetails;
	}

}
