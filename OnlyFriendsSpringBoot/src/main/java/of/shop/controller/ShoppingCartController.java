package of.shop.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.member.model.MemberService;
import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.CartItem;
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
	
	@Autowired
	private Product product;
	
	@GetMapping(path = "/cart")
	@ResponseBody
	public String InsertItemToCart(@RequestParam(name = "cartId") Integer cartId,
									Model model,HttpSession session ) {
		
		
		CartItem cart = new CartItem();
		cart.setCartId(1099093);
		
		List<Product> shopList=new ArrayList<Product>();
		Map<Product, Integer> shopcartMap=(Map<Product, Integer>)session.getAttribute("shopList");
		cart.setItems(shopList);
		if(shopList==null) {
			shopcartMap=new HashMap<Product, Integer>();
		}if(shopList!=null) {
			int number=shopcartMap.get(cartId);
			shopcartMap.put(product, number+1);
		}
		model.addAttribute("shopList",shopList);

		
		return "y";
	}

//	@GetMapping(path = "/shoppingListtojson")
//	@ResponseBody
//	public Map shoppingList(Model model) {
//		List<CartItem> cartItems=shoppingCartService.findAll();
//		Map<String, Object> map=new HashMap();
//		map.put("data", cartItems);
////		return map;
//	}
//	
//	@PostMapping(path = "/shoplist")
//	@ResponseBody
//	public CartItem shoplistQuery(@RequestParam(name = "cartId")Integer cartId) {
//		CartItem cartItem=shoppingCartService.listCartItems(cartId);
//		return cartItem;
//	}
}
