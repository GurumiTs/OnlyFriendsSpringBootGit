package of.shop.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.coupon.model.Coupon;
import of.product.model.Product;
import of.product.model.ProductService;

@Controller
@SessionAttributes(names = { "proList", "product", "totalPages", "totalElements" })
public class ShopController {
	@Autowired
	private ProductService productService;
	@Autowired
	private Product product;

	@RequestMapping(path = "/addtoshopchart", method = RequestMethod.GET)
	public String shopCar(@RequestParam(name = "Id") Integer Id, HttpSession session, Model model) {
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
		model.addAttribute("shopcart", shopcart);
		return "";
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
