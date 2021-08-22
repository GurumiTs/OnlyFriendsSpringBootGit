package of.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.member.model.Member;
import of.member.model.MemberService;
import of.product.model.Product;
import of.shop.model.CartItem;
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
	public String InsertItemToCart(@RequestParam (name = "account")String account,Model model ) {
		Member member=memberServie.findByMemberAccount(account);
		List<CartItem> cartItems=shoppingCartService.listCatyCartItems(member);
		
		model.addAttribute("cartItems", cartItems);
		model.addAttribute("pageTitle", "Shopping Cart");
		
		
		return "shopping_cart";
	}
	
}
