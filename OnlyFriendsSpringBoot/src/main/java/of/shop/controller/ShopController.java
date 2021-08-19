package of.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.emp.model.Employee;
import of.product.model.Product;
import of.product.model.ProductService;

@Controller
@SessionAttributes(names= {"proList","product","totalPages","totalElements"})
public class ShopController {
	@Autowired 
	private ProductService productService;
	@Autowired
	private Product product;
	
	@RequestMapping(path = "/usershopentrypage", method = RequestMethod.GET)
	public String userproductMgmtEntry(Model model) {
		return "productpages/shopPage";
	}
	
	@PostMapping(path = "/usershoppage.controller/{pageNo}")
	@ResponseBody
	public List<Product> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		
		int pageSize = 2;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Product> page = productService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}

}
