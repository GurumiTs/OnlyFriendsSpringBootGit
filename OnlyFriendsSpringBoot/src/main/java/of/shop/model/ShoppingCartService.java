package of.shop.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import of.member.model.Member;

@Service
public class ShoppingCartService {
	@Autowired
	private ShopRepository shopRepository;
	
	public CartItem listCartItems(String memberAccount){
		Optional<CartItem> memberAccountOptional =shopRepository.findByMemberAccount(memberAccount);
		return memberAccountOptional.get();
	}
	
	public CartItem insert(CartItem cartItem) {
		return shopRepository.save(cartItem);
	}
	
	public CartItem update(CartItem cartItem) {
		return shopRepository.save(cartItem);
	}
	
	public void deleteById(Integer cartId) {
		shopRepository.deleteById(cartId);
	}
	
	public List<CartItem> findAll(){
		return shopRepository.findAll();
	}
	
}
