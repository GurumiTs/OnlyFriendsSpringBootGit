package of.shop.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.member.model.Member;
import of.member.model.MemberService;
import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.CartItem;
import of.shop.model.ShopRepository;
import of.shop.model.ShoppingCartService;

@Controller
@SessionAttributes(names = {"shopList"})
public class ShoppingCartController {
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private MemberService memberServie;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(path = "/cart")
	public String InsertItemToCart(@RequestParam(name = "cartId") Integer cartId,
									@RequestParam(name = "proId")Integer proId,
									@RequestParam(name = "amount")Integer amount,
									@RequestParam(name = "orderdate")Timestamp orderdate,
									Model model ) {
		Timestamp ts=new Timestamp(System.currentTimeMillis());
		System.out.println("UpdateTime:"+ts);
		
		Product product=productService.findById(proId);
		
		CartItem cart = new CartItem();
		cart.setCartId(1099093);
		Map<Product,Integer> map = new HashMap<Product, Integer>();
		List<Map> shopList = new ArrayList<Map>();
		map.put(product, amount);
		shopList.add(map);
		model.addAttribute("shopList",shopList);

//		newItem.setCartId(cartId);//亂數
//		newItem.setProId(product);
//		newItem.setAmount(amount);
//		newItem.setOrderdate(ts);
//		System.out.println("Insert time"+ts);
//		shoppingCartService.insert(newItem);
//		model.addAttribute("pageTitle", "Shopping Cart");
		
		return "shopcart";
	}

	@GetMapping(path = "/shoppingListtojson")
	@ResponseBody
	public Map shoppingList(Model model) {
		List<CartItem> cartItems=shoppingCartService.findAll();
		Map<String, Object> map=new HashMap();
		map.put("data", cartItems);
		return map;
	}
	
	@PostMapping(path = "/shoplist")
	@ResponseBody
	public CartItem shoplistQuery(@RequestParam(name = "cartId")Integer cartId) {
		CartItem cartItem=shoppingCartService.listCartItems(cartId);
		return cartItem;
	}
}
