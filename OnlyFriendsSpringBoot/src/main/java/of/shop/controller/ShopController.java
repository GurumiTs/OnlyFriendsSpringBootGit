package of.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
	


	
	@RequestMapping(path = "/shopentrypage", method = RequestMethod.GET)
	public String userproductMgmtEntry(Model model) {
		return "productpages/shopPage";
	}

	@PostMapping(path = "/shoppage.controller/{pageNo}")
	@ResponseBody
	public List<Product> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		
		int pageSize = 8;

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
	public List<Product> shopProducts() {
		List<Product> products = productService.findAll();
		return products;
	}

	//Luckyitem
	@PostMapping("/queryallLuckyItem")
	@ResponseBody
	public List<Product> queryallLuckyItem(@RequestParam String luckyItem){
		
		List<Product> products = productService.findByItemList("幸運小物");
		return products;
	}
	
	//candle
	@PostMapping("/queryallcadleItem")
	@ResponseBody
	public List<Product> queryallCandleItem(@RequestParam String candleItem){
		List<Product> products = productService.findByItemList("香氛類");
		return products;
	}
	
	//Other
	@PostMapping("/queryallOtherItem")
	@ResponseBody
	public List<Product> queryallOtherItem(@RequestParam String otherItem){
		List<Product> products = productService.findByItemList("其他");
		return products;
	}
	
	@GetMapping("/releteproductItem")
	@ResponseBody
	public List<Product> releteProductItem(@RequestParam String proName) {
		List<Product> products = productService.findByitemLike("%小物");
		
		
		System.out.println(proName);
		System.out.println(product);
		return products;
	}
}
