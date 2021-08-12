package of.product.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.product.model.Product;
import of.product.model.ProductService;

@Controller
@SessionAttributes(names= {"proList","product"})
public class ProductController {
	@Autowired 
	private ProductService productService;
	@Autowired
	private Product product;
	
	@RequestMapping(path = "/productPage.controller",method = RequestMethod.GET)
	public String productEntryAction(Model model){
		List<Product> proList=productService.findAll();
		model.addAttribute("proList",proList);
		return "productpages/productMgmtPage";
	}
	
	@RequestMapping(path="/insertProdcut.controller",method = RequestMethod.GET)
	public String insertpage() {
		return "productpages/productCreateForm";
	}
	
	@PostMapping(path="/addProduct.controller")
	@ResponseBody
	public String productAdd(@RequestParam (name = "Id",required = false) Integer Id,
							@RequestParam(name = "Photo",required = false) MultipartFile multipartFile,
							@RequestParam(name = "Name") String Name,
							@RequestParam(name = "Description") String Description,
							@RequestParam(name = "Price") int Price,
							@RequestParam(name = "Item") String Item,
							@RequestParam(name = "Num")	int Num,
							@RequestParam(name = "Shipping") int Shipping,HttpServletRequest request,
							Model m){
		
		try {
//		product.setProId(Id);
			product.setProName(Name);
			product.setProDescription(Description);
			product.setProPrice(Price);
			product.setProItem(Item);
			product.setProNum(Num);
			product.setProShipping(Shipping);
			
			String fileName=multipartFile.getOriginalFilename();
			System.out.println("filename:"+fileName);
			String path1=request.getServletContext().getRealPath("/images");
			String filepath=path1+"\\productPic\\"+fileName;
			File saveFile=new File(filepath);
			System.out.println("1");
			multipartFile.transferTo(saveFile);
			System.out.println("2");
			product.setProPhoto("images/productPic/"+fileName);
			System.out.println("3");
			productService.insert(product);
			System.out.println("success");
			return "redirect:/productPage.controller";
			
		} catch (Exception e) {
			m.addAttribute("error","update picture failed");
			return "redirect:/productPage.controller";
		}
		
	}
	

	
	
	@RequestMapping(path="/updateentry.controller",method = RequestMethod.GET)
	public String updateEntryPage(HttpServletRequest request,Model model) {
		Integer Id = Integer.parseInt(request.getParameter("editId"));
		product = productService.findById(Id);
		model.addAttribute("product",product);
		System.out.println(Id);
		return "productpages/productUpdateForm";
	}
	
	
	
	@PutMapping(path="/updateProduct.controller/{Id}" )
	@ResponseBody
	public String productupdate(@PathVariable (name = "Id",required = false) Integer Id,
								@RequestParam(name = "Photo",required = false) MultipartFile multipartFile,
								@RequestParam(name = "Name") String Name,
								@RequestParam(name = "Description") String Description,
								@RequestParam(name = "Price") int Price,
								@RequestParam(name = "Item") String Item,
								@RequestParam(name = "Num")	int Num,
								@RequestParam(name = "Shipping") int Shipping,HttpServletRequest request,
								Model m){
		try {
			
			Product product=productService.findById(Id);
			product.setProId(Id);
			product.setProName(Name);
			product.setProDescription(Description);
			product.setProPrice(Price);
			product.setProItem(Item);
			product.setProNum(Num);
			product.setProShipping(Shipping);
			System.out.println(Id);
			System.out.println(Name);
			String fileName=multipartFile.getOriginalFilename();
			System.out.println("filename:"+fileName);
			String path1=request.getServletContext().getRealPath("/images");
			String filepath=path1+"\\productPic\\"+fileName;
			File saveFile=new File(filepath);
			multipartFile.transferTo(saveFile);
			product.setProPhoto("images/productPic/"+fileName);
			productService.update(product);
			List<Product> proList=productService.findAll();
			m.addAttribute("proList",proList);
			
			return "redirect:/productPage.controller";
		} catch (Exception e) {
			m.addAttribute("error","update picture failed");
			return "productpages/productUpdateForm";
		}
		
	}
	
	@DeleteMapping(path="/deleteentry.controller/{Id}")
	@ResponseBody
	public String deleteEntryPage(HttpServletRequest request) {
		Integer Id = Integer.parseInt(request.getParameter("delId"));
		productService.deleteById(Id);
		return "redirect:/productPage.controller";
	}
	
	@PostMapping(path = "/nameckeck.controller/{Name}")
	public ResponseEntity<String> processnameCkeckAction(@PathVariable("Name") String Name){
		boolean status = productService.checkName(Name);
		
		if(status) {
			return new ResponseEntity<String>("Y", HttpStatus.OK);
		}
		
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}

}
