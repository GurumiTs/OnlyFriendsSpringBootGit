package of.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.member.model.MemberService;
import of.product.model.Product;
import of.shop.model.ShopRepository;
import of.shop.model.ShoppingCartService;

@Controller
@SessionAttributes(names = {})
public class ShoppingCartController {
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private MemberService memberServie;
	
	@GetMapping(path = "/cart")
	public String InsertItemToCart(Model model,@AuthenticationPrincipal Authentication authentication ) {
		return "shopping_cart";
	}
	
}
