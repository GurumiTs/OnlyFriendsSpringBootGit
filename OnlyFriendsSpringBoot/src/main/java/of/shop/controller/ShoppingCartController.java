package of.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

import of.member.model.MemberService;
import of.paypal.model.PaypalService;
import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.CartItem;
import of.shop.model.OrderDetails;
import of.shop.model.OrderService;

@Controller
@SessionAttributes(names = { "cartlist" })
public class ShoppingCartController {

	@Autowired
	private MemberService memberServie;

	@Autowired
	private ProductService productService;

	@Autowired
	private Product product;
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaypalService paypalService;

	@RequestMapping(path = "/entryshoppingcart.controller")
	public String shoppinCartEntry() {
		return "";
	}

	@PostMapping(path = "/cart")
	@ResponseBody
	public List<CartItem> InsertItemToCart(@RequestParam(name = "proId") Integer proId,
			@RequestParam(name = "amount") Integer amount, Model model, HttpSession session,
			HttpServletRequest request) {
//		System.out.println("step1");
		List<CartItem> sessionlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
//		System.out.println("1");
		Product product = productService.findById(proId);
//		System.out.println("2");
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
//				System.out.println("存在的ID"+cartfindproid);
//				System.out.println("新ID"+proId);
	
				
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
			sessionlist.size();
//			System.out.println(sessionlist.size());
		}
		return sessionlist;
	}

	@RequestMapping(path = "/getShoppingCars", method = RequestMethod.POST)
	@ResponseBody
	public List<CartItem> getShoppingCars(Model model, HttpServletRequest request) {

		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
//		System.out.println("y");
		return cartlist;
	}
	
	@RequestMapping(path = "/getorder", method = RequestMethod.POST)
	@ResponseBody
	public List<CartItem> getorder(Model model, HttpServletRequest request) {

		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");
		System.out.println("y");
		return cartlist;
	}
	

	@RequestMapping(path = "/getcartitemcounts", method = RequestMethod.POST)
	public Integer getCartItemCounts(@RequestParam(name = "proId") Integer proId, Model model,
			HttpServletRequest request) {
		List<CartItem> cartlist = (List<CartItem>) request.getSession().getAttribute("cartlist");


		for (CartItem c : cartlist) {
			Integer cartfindproid = c.getProduct().getProId();

			CartItem cartItem = new CartItem();
			Integer a = c.getAmount() + cartItem.getAmount();
			if (cartfindproid.equals(cartItem.getProduct().getProId())) {
			}
		}

		return 1;
	}
	
	@PostMapping(path = "/shoppingcartnumber")
	@ResponseBody
	public String shoppingcartnumber(Model model,HttpServletRequest request) {
		List<CartItem> sessionlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
		Integer shopcartnum=sessionlist.size();
		String numberString = String.valueOf(shopcartnum);
		return numberString;
	}
	
	@GetMapping(path = "/shopcarttotal")
	@ResponseBody
	public Integer shoppingcarttotal(Model model,HttpServletRequest request) {
		List<CartItem> sessionlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
		Integer finaltotal=0;
		for (CartItem c : sessionlist) {
			finaltotal+=c.getProduct().getProPrice()*c.getAmount();
		}
		return finaltotal;
	}

	@GetMapping(path = "/shoppingnumber")
	@ResponseBody
	public List<Integer> shoppingnumber(Model model,HttpServletRequest request) {
		List<CartItem> sessionlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
		List<Integer> amoumtList = new ArrayList<Integer>();
		for(CartItem cartItem:sessionlist) {
			amoumtList.add(cartItem.getAmount());
		}
		return amoumtList;
	}
	
	@GetMapping(path = "/minusshopcart")
	@ResponseBody
	public List<CartItem> minusshopcart(Model model,HttpServletRequest request,@RequestParam("proId") Integer proId) {
		List<CartItem> sessionlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
		for(CartItem cartItem:sessionlist) {
			if(cartItem.getProduct().getProId()== proId) {
				
				if(cartItem.getAmount()<=1) {	
					break;
				}else {
					Integer minusitemnum = cartItem.getAmount() - 1;
					cartItem.setAmount(minusitemnum);				
				}
			}
		}
		model.addAttribute("sessionlist",sessionlist);
		return sessionlist;
	}
	
	@GetMapping(path = "/deleteshopcartitem")
	@ResponseBody
	public List<CartItem> Deleteshopcartitem(Model model,HttpServletRequest request,@RequestParam("proId") Integer proId) {
		List<CartItem> sessionlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
		for(CartItem cartItem:sessionlist) {
			if(cartItem.getProduct().getProId()== proId) {
				sessionlist.remove(cartItem);
				break;
			}
		}
		model.addAttribute("sessionlist",sessionlist);
		return sessionlist;
	}
	
	
	
	
	@GetMapping(path = "/plusshopcart")
	@ResponseBody
	public List<CartItem> plusshopcart(Model model,HttpServletRequest request,@RequestParam("proId") Integer proId) {
		List<CartItem> sessionlist=(List<CartItem>) request.getSession().getAttribute("cartlist");
		for(CartItem cartItem:sessionlist) {
			if(cartItem.getProduct().getProId()== proId) {
				
					Integer minusitemnum = cartItem.getAmount() + 1;
					cartItem.setAmount(minusitemnum);				
			}
		}
		model.addAttribute("sessionlist",sessionlist);
		return sessionlist;
	}
	
	@RequestMapping(path = "/orderpage", method = RequestMethod.GET)
	public String userorderpage(Model model) {
		return "productpages/invoice";
	}
	
	
	
}
