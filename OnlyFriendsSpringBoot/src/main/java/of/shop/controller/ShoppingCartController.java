package of.shop.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.Flags.Flag;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Connection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.security.core.authority.mapping.MapBasedAttributes2GrantedAuthoritiesMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.google.gson.JsonArray;
import com.nimbusds.jose.shaded.json.JSONArray;

import of.member.model.MemberService;
import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.CartItem;
import of.shop.model.CartResponse;

@Controller
@SessionAttributes(names = { "cartlist" })
public class ShoppingCartController {

	@Autowired
	private MemberService memberServie;

	@Autowired
	private ProductService productService;

	@Autowired
	private Product product;

	@RequestMapping(path = "/entryshoppingcart.controller")
	public String shoppinCartEntry() {
		return "";
	}

	@PostMapping(path = "/cart")
	@ResponseBody
	public List<CartItem> InsertItemToCart(@RequestParam(name = "proId") Integer proId,
			@RequestParam(name = "amount") Integer amount, Model model, HttpSession session,
			HttpServletRequest request) {
		System.out.println("step1");
		List<CartItem> sessionlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
		System.out.println("1");
		Product product = productService.findById(proId);
		System.out.println("2");
//		System.out.println(sessionlist.size());
		Boolean sessionexistornot = CollectionUtils.isEmpty(sessionlist);
		if (sessionexistornot) {

			// add item
			List<CartItem> cartlist = new ArrayList<CartItem>();
			CartItem cartItem = new CartItem();
			cartItem.setAmount(amount);
			cartItem.setProduct(product);
			cartItem.setTotal(productService.findIdToGetPrice(proId) * amount);
			cartlist.add(cartItem);

			model.addAttribute("cartlist", cartlist);
			return cartlist;

		} else {
			CartItem newcartItem = new CartItem();
			newcartItem.setAmount(amount);
			newcartItem.setProduct(product);
			newcartItem.setTotal(productService.findIdToGetPrice(proId) * amount);
			
			boolean flag = true ;
			for (CartItem c : sessionlist) {
				Integer cartfindproid = c.getProduct().getProId();
				System.out.println("存在的ID"+cartfindproid);
				System.out.println("新ID"+proId);
	
				
				if (cartfindproid.equals(proId)) {				
					Integer a = c.getAmount() + amount;
					c.setAmount(a);
					c.setTotal(productService.findIdToGetPrice(proId)*a);
					flag = true;			
				}else if(!cartfindproid.equals(proId)) {
					flag = false;
				}
				
			}
			
			if(flag == false) {
				sessionlist.add(newcartItem);
			}
			model.addAttribute("cartlist", sessionlist);
		}
		return sessionlist;
	}

	@RequestMapping(path = "/getShoppingCars", method = RequestMethod.POST)
	@ResponseBody
	public List<CartItem> getShoppingCars(Model model, HttpServletRequest request) {

		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
		return cartlist;
	}

	@RequestMapping(path = "/getcartitemcounts", method = RequestMethod.POST)
	public Integer getCartItemCounts(@RequestParam(name = "proId") Integer proId, Model model,
			HttpServletRequest request) {
		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");

		System.out.println(request.getAttributeNames());

		for (CartItem c : cartlist) {
			Integer cartfindproid = c.getProduct().getProId();

			CartItem cartItem = new CartItem();
			Integer a = c.getAmount() + cartItem.getAmount();
			System.out.println(a);
			if (cartfindproid.equals(cartItem.getProduct().getProId())) {
//				cartlist.add(c.get(proId).getAmount()+cartItem.getAmount());
				System.out.println("起床囉兄弟");
			}
		}

		return 1;
	}

//	public List<CartItem> deleteCartItems(Integer proId,Model model,HttpServletRequest request){
//		productService.deleteById(proId);
//		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartListMap");
//		return cartlist ;
//	}
}
