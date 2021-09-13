package of.shop.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import of.product.model.Product;
import of.product.model.ProductService;

@Service
@Transactional
public class OrderItemService {

	@Autowired
	private OrderItemRepository orderItemRepository;
	
	public void updateamount(int amount,String paymentId,int proId) {
		orderItemRepository.updateamount(amount,paymentId,proId);
	}
	
	public OrderItem findbyOrderItem(String paymentId,int proId) {
		return orderItemRepository.findorderitem(paymentId, proId);
	}
	 
}
