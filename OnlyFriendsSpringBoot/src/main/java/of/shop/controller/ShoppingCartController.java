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
import org.springframework.web.bind.annotation.PathVariable;
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
@SessionAttributes(names = {"cartlist"})
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
	
	@GetMapping(path = "/cart")
	@ResponseBody
	public List<CartItem> InsertItemToCart(@RequestParam(name = "proId")Integer proId,
											@RequestParam (name = "amount")Integer amount,
											Model model,HttpSession session,HttpServletRequest request ) {
		
		List<CartItem> sessionlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
		CartItem cartItem=(CartItem)session.getAttribute("cartlist");
		List<CartItem> cartlist = new ArrayList<CartItem>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		if(cartItem ==null) {
			//add item
			Product product=productService.findById(proId);
			cartItem=new CartItem();
			
			cartItem.setProduct(product);
			cartItem.setAmount(amount);
			cartItem.setTotal(productService.findIdToGetPrice(proId)*amount);
			cartlist.add(cartItem);
			resultMap.put("result", cartlist);
			
		}else {
			cartItem.setAmount(cartItem.getAmount()+amount);
			cartItem.setTotal(productService.findIdToGetPrice(proId)*cartItem.getAmount());
			
		}

		model.addAttribute("cartlist", cartlist);
		
		return cartlist;
		
	}
	
	

	@RequestMapping(path = "/getShoppingCars",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getShoppingCars(Model model,HttpServletRequest request) {
		
		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
//		String shoppingcartlist=JSONArray.toJSONString(cartlist);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", cartlist);
		return resultMap ;
	}
	
	@RequestMapping(path = "/getcartitemcounts",method = RequestMethod.POST)
	public Integer getCartItemCounts(@RequestParam(name = "proId") Integer proId,Model model,HttpServletRequest request) {
		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
		
		
		
		System.out.println(request.getAttributeNames());
		
		
		for(CartItem c:cartlist) {
			Integer cartfindproid =c.getProduct().getProId();
//			if(cartfindproid==cartlist.get(proId)){
//				
//			}
		}
		
		
		return 1;
	}
	
//	public List<CartItem> deleteCartItems(Integer proId,Model model,HttpServletRequest request){
//		productService.deleteById(proId);
//		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartListMap");
//		return cartlist ;
//	}
}
