package of.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.product.model.Product;
import of.product.model.ProductService;

@Controller
@SessionAttributes(names = { "proList", "product", "totalPages", "totalElements" })
public class ShopController {
	@Autowired
	private ProductService productService;
	@Autowired
	private Product product;
	
	@Autowired
	private static List<Product> list=new ArrayList<Product>();

	@RequestMapping(path = "/addtoshopchart", method = RequestMethod.GET)
	public String shopCar(@RequestParam(name = "Id") Integer Id, HttpServletResponse response,HttpSession session, Model model) {
		
		//獲取商品物件
		Product product=list.get(Id-1);
		//儲存至購物車
		Map<Integer, Integer> shopcart = (Map<Integer, Integer>) session.getAttribute("shopcart");
		// 如果session沒有購物車
		if (shopcart == null) {
			shopcart = new HashMap<Integer, Integer>();
		}
		if (shopcart.containsKey(Id)) {// 判斷商品是否存在購物車中
			int number = shopcart.get(Id);
			// 存在=>數量加一
			shopcart.put(Id, number + 1);
		} else {
			shopcart.put(Id, 1);
		}
		session.setAttribute("shopcart", shopcart);
		
		//為了讓購物車存的時間久一點 現在需要手動設定cookie
		Cookie cookie =new Cookie("JsessionId", session.getId());
		cookie.setMaxAge(60*60*24*7);
		response.addCookie(cookie);
		
		//跳轉頁面
		return "redirect:productpages/transfer";
	}
	
	@RequestMapping(path = "/toCart",method = RequestMethod.GET)
	public String toCart() {
		return "productpages/shopcart";
	}
	
	//顯示商品列表
	@RequestMapping(path="/listproduct")
	public String listProduct(Model model) {
		//準備商品 存商品
		model.addAttribute("list",list);
		return "list";
	}

	@RequestMapping(path = "/shopentrypage", method = RequestMethod.GET)
	public String userproductMgmtEntry(Model model) {
		return "productpages/shopPage";
	}

	@PostMapping(path = "/shoppage.controller/{pageNo}")
	@ResponseBody
	public List<Product> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {

		int pageSize = 4;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = productService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);

		return page.getContent();
	}

	@GetMapping("/shopitementrypage")
	public String shopItemEntry(@RequestParam Integer proId) {

		return "productpages/shopitem";
	}

	@GetMapping("/shopitempage.controller")
	@ResponseBody
	public List<Product> shopCouponItem() {
		List<Product> products = productService.findAll();
		return products;
	}

}
