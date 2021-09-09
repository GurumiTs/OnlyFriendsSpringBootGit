package of.shop.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class OrderItemService {

	@Autowired
	private OrderItemRepository orderItemRepository;
	
	public void updateamount(int amount,String paymentId,int proId) {
		orderItemRepository.updateamount(amount,paymentId,proId);
	}
}
