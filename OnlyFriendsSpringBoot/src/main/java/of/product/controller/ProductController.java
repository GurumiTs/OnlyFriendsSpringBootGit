package of.product.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.product.model.Product;
import of.product.model.ProductService;
import of.shop.model.OrderItemService;

@Controller
@SessionAttributes(names= {"proList","product"})
public class ProductController {
	@Autowired 
	private ProductService productService;
	@Autowired
	private Product product;
	@Autowired
	private OrderItemService orderItemService;

	@RequestMapping(path = "/empproductPage.controller", method = RequestMethod.GET)
	public String productMgmtEntry(Model model) {
		return "productpages/productMgmtPage";
	}
	
	
	@GetMapping(path = "/product.controller")
	@ResponseBody
	public Map productEntryAction(Model model){
		List<Product> proList=productService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", proList);
		model.addAttribute("proList",proList);
		return map;
	}
	
	@PostMapping(path="/empproductquery")
	@ResponseBody
	public Product processRestQueryProduct(@RequestParam(name = "Id") Integer Id) {
		Product product = productService.findById(Id);
		return product;
	}
	
	@GetMapping(path="/empinsertProdcut.controller")
	public String insertpage() {
		return "productpages/productCreateForm";
	}
	
	@RequestMapping(path="/empaddProduct.controller",method =RequestMethod.POST )
	public String productAdd(@RequestParam (name = "Id",required = false) Integer Id,
							@RequestParam(name = "Photo",required = false) MultipartFile multipartFile,
							@RequestParam(name = "Name") String Name,
							@RequestParam(name = "Description") String Description,
							@RequestParam(name = "Price") Integer Price,
							@RequestParam(name = "Item") String Item,
							@RequestParam(name = "Num")	Integer Num,
							HttpServletRequest request,
							Model m){
		
		try {
//		product.setProId(Id);
			product.setProName(Name);
			product.setProDescription(Description);
			product.setProPrice(Price);
			product.setProItem(Item);
			product.setProNum(Num);
			
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
			productService.insert(product);
			System.out.println("success");
			return "redirect:/empproductPage.controller";
			
		} catch (Exception e) {
			m.addAttribute("error","update picture failed");
			return "redirect:/empproductPage.controller";
		}
		
	}
	
	@RequestMapping(path="/empaddProductbutton.controller",method =RequestMethod.POST )
	public String productAddbutton(@RequestParam (name = "Id",required = false) Integer Id,
							@RequestParam(name = "Photo",required = false) MultipartFile multipartFile,
							@RequestParam(name = "Name") String Name,
							@RequestParam(name = "Description") String Description,
							@RequestParam(name = "Price") Integer Price,
							@RequestParam(name = "Item") String Item,
							@RequestParam(name = "Num")	Integer Num,
							HttpServletRequest request,
							Model m){
		
		try {
//		product.setProId(Id);
			product.setProName("霞海城隍廟聯名御守");
			product.setProDescription("一年一度七夕即將到來\r\n"
					+ "今年很可惜因為疫情關係，無法親自去到霞海城隍城隍廟\r\n"
					+ "和月下老人祈求緣分也別擔心\r\n"
					+ "在七夕前夕，成立結緣追愛小組\r\n"
					+ "攜手與在地設計師合作，製作出各式七夕月老聯名款禮物\r\n"
					+ "期待在送禮時能讓各地單身、想求姻緣的男女們牽起之間的緣分");
			product.setProPrice(360);
			product.setProItem("幸運小物");
			product.setProNum(25);
			
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
			productService.insert(product);
			System.out.println("success");
			return "redirect:/empproductPage.controller";
			
		} catch (Exception e) {
			m.addAttribute("error","update picture failed");
			return "redirect:/empproductPage.controller";
		}
		
	}
	

	
	
	@RequestMapping(path="/empupdateentryproduct.controller",method = RequestMethod.GET)
	public String updateEntryPage(@RequestParam(name = "Id") Integer Id,Model model) {
		product = productService.findById(Id);
		model.addAttribute("product",product);
		System.out.println(Id);
		return "productpages/productUpdateForm";
	}
	
	
	@RequestMapping(path="/empupdateProduct.controller",method =RequestMethod.POST )
	public String productupdate(@RequestParam (name = "Id",required = false) Integer proId,
								@RequestParam(name = "Photo",required = false) MultipartFile multipartFile,
								@RequestParam(name = "Name") String proName,
								@RequestParam(name = "Description") String proDescription,
								@RequestParam(name = "Price") Integer proPrice,
								@RequestParam(name = "Item") String proItem,
								@RequestParam(name = "Num")	Integer proNum,
								HttpServletRequest request,
								Model m){
		try {
			
			product.setProId(proId);
			product.setProName(proName);
			product.setProDescription(proDescription);
			product.setProPrice(proPrice);
			product.setProItem(proItem);
			product.setProNum(proNum);
			
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
			
			return "redirect:/empproductPage.controller";
		} catch (Exception e) {
			m.addAttribute("error","update picture failed");
			return "redirect:/empproductPage.controller";
		}
		
	}
	
	@PostMapping(path="/empdeleteentry.controller/{Id}")
	@ResponseBody
	public void deleteEntryPage(@PathVariable("Id") Integer Id) {
		System.out.println("Id"+Id);
		
		boolean delete=productService.checkproId(Id);
		if (delete) {
			productService.deleteById(Id);
		}
		orderItemService.deleteFindByProId(Id);
	}


}
