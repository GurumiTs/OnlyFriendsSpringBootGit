package of.shop.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import of.member.model.Member;

@Service
public class ShoppingCartService {
	@Autowired
	private ShopRepository shopRepository;
	
	public List<CartItem> listCatyCartItems(Member memberAccount){
		return shopRepository.findByMemberAccount(memberAccount);
	}
}
