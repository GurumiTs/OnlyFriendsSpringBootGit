package of.shop.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.security.core.authority.mapping.MapBasedAttributes2GrantedAuthoritiesMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;


import of.member.model.MemberService;
import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.CartItem;
import of.shop.model.CartResponse;


@Controller
@SessionAttributes(names = {"cartlist"})
public class ShoppingCartController {
	
	
	@Autowired
	private MemberService memberServie;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private Product product;
	
	@GetMapping(path = "/cart")
	@ResponseBody
	public List<CartItem> InsertItemToCart(@RequestParam (name = "amount")Integer amount,Model model,HttpSession session,HttpServletRequest request ) {
		List<CartItem> sessionlist = (List<CartItem>) request.getSession().getAttribute("cartListMap");
//		if( sessionlist.size() == 0) {
			List<CartItem> cartlist = new ArrayList<CartItem>();
//			//add item
//			Product product=productService.findById(proId);
			CartItem cartItem=new CartItem();
//			
			cartItem.setProduct(product);
			cartItem.setAmount(amount);
			cartlist.add(cartItem);
			
//			try {
//				String urlString = "http://localhost:8080/OnlyFriends/cart?amount=1";
//				URL connUrl  = new URL(urlString);
//				System.out.println("AA");
//				HttpURLConnection conn = (HttpURLConnection) connUrl.openConnection();
//				System.out.println("BB");
//				BufferedReader br  = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//				StringBuilder sb = new StringBuilder();
//				String lineString;
//				System.out.println("開始做是");
//				while( (lineString = br.readLine())!= null) {
//					sb.append(lineString);
//					System.out.println("進來嗎?");
//				}
//				br.close();
//			}catch (Exception e) {
//				e.printStackTrace();
//			}
			
			
//			model.addAttribute("cartListMap", list);
//			
//			return list;
//		}
		
		
			
			
//		Product p1 = productService.findById(1);
//		CartItem c = new CartItem();
//		c.setProduct(p1);
//		c.setAmount(2);
//		
//		Product p2 = productService.findById(2);
//		CartItem c2 = new CartItem();
//		c2.setProduct(p2);
//		c2.setAmount(5);
//		
//		List<CartItem> list = new ArrayList<CartItem>();
//		list.add(c2);
//		list.add(c);

		model.addAttribute("cartlist", cartlist);
		
		return cartlist;
	}

//	@GetMapping(path = "/shoppingListtojson")
//	@ResponseBody
//	public List<CartItem> shoppingList(Model model,HttpServletRequest request) {
//		
//		List<CartItem> list = (List<CartItem>) request.getSession().getAttribute("cartListMap");
//		return list ;
//	}
	
//	@PostMapping(path = "/shoplist")
//	@ResponseBody
//	public CartItem shoplistQuery(@RequestParam(name = "cartId")Integer cartId) {
//		CartItem cartItem=shoppingCartService.listCartItems(cartId);
//		return cartItem;
//	}
}
