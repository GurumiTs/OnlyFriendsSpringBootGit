package of.shop.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(path="/shopitementrypage",method = RequestMethod.GET)
	public String shopItemEntry(@RequestParam(name = "Id") Integer Id,Model model) {
		product = productService.findById(Id);
		System.out.println(Id);
		return "productpages/shopitem";
	}
	
	@RequestMapping(path="/shopitempage.controller",method =RequestMethod.POST )
	public String productupdate(@RequestParam (name = "Id",required = false) Integer proId,
								@RequestParam(name = "Photo",required = false) MultipartFile multipartFile,
								@RequestParam(name = "Name") String proName,
								@RequestParam(name = "Description") String proDescription,
								@RequestParam(name = "Price") Integer proPrice,
								@RequestParam(name = "Item") String proItem,
								@RequestParam(name = "Num")	Integer proNum,
								@RequestParam(name = "Shipping") Integer proShipping,HttpServletRequest request,
								Model m){
		try {
			
			product.setProId(proId);
			product.setProName(proName);
			product.setProDescription(proDescription);
			product.setProPrice(proPrice);
			product.setProItem(proItem);
			product.setProNum(proNum);
			product.setProShipping(proShipping);
			System.out.println(proId);
			System.out.println(proName);
			System.out.println(proDescription);
			System.out.println(proPrice);
			System.out.println(proNum);
			System.out.println(proShipping);
			
			String fileName=multipartFile.getOriginalFilename();
			System.out.println("filename:"+fileName);
			String path1=ResourceUtils.getURL("classpath:static/images/productPic").getPath();
			System.out.println(path1);
			String filepath=path1+"/"+fileName;
			File saveFile=new File(filepath);
			System.out.println("1");
			multipartFile.transferTo(saveFile);
			System.out.println("2");
			product.setProPhoto("images/productPic/"+fileName);
			System.out.println("3");
			productService.update(product);
//			List<Product> proList=productService.findAll();
//			m.addAttribute("proList",proList);
			
			return "redirect:/usershopentrypage";
		} catch (Exception e) {
			m.addAttribute("error","update picture failed");
			return "redirect:/usershopentrypage";
		}
		
	}

}
