package of.shop.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	public int amount(int paymentId,int proId) {
		return orderRepository.amount(paymentId, proId);
	}
}
