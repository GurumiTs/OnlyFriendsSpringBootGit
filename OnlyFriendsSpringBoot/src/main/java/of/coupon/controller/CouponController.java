package of.coupon.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.coupon.model.Coupon;
import of.coupon.model.CouponService;


@Controller
@SessionAttributes(names = {"totalPages","totalElements"})
public class CouponController {
	
	@Autowired
	private CouponService couponService; 
	
	@GetMapping("/empCoupons.controller")
	public String processEntry(Model m) {
		List<Coupon> coupons = couponService.findAll();	
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}
	
	@PostMapping("/getAllCouponToJson.controller")
	@ResponseBody
	public Optional<Coupon> showAllCouponToJson(@RequestParam Integer couponId) throws InterruptedException {
		Optional<Coupon> coupons = couponService.findBycouponId(couponId);
		Thread.sleep(1000);
		return coupons;
	}

	@GetMapping("/empgetAllCoupon.controller")
	public String showAllCoupon(Model m) {
		List<Coupon> coupons = couponService.findAll();
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/empgetBycompanyName.controller")
	public String showCategory(@RequestParam String queryVal, Model m) {
		List<Coupon> coupons = couponService.findBycompanyName(queryVal);	
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/empgetByLike.controller")
	public String showLike(@RequestParam String queryVal, Model m) {
		List<Coupon> coupons = couponService.findBycouponNameLike("%"+queryVal+"%");	
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/empdeleteCoupon.controller")
	public String deleteCoupon(@RequestParam Integer couponId) {
		
	    Optional<Coupon> c = couponService.findBycouponId(couponId);

		if(c!=null) {
			couponService.deleteBycouponId(couponId);
			return "couponpages/deleteCouponComfirm";
		}else {
			return "couponpages/deleteCouponError";
		}
		
	}

	@PostMapping("/empinsertCoupon.controller")
	public String insertCoupon(@RequestParam("couponImg") MultipartFile multipartFile, HttpServletRequest request,
			@RequestParam String companyName, @RequestParam String category,@RequestParam String couponName,
			@RequestParam Integer couponPrice, @RequestParam Integer couponQty,@RequestParam String couponStartDate,@RequestParam String couponEndDate, 
			@RequestParam String couponInfo, @RequestParam String couponUse,Model m) throws IllegalStateException, IOException {
		
		String fileName = multipartFile.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
		String filePath =  path+ "/" + fileName;
	
		File saveFile = new File(filePath);
		multipartFile.transferTo(saveFile);

		Coupon coupons = new Coupon();
		
		coupons.setCompanyName(companyName);
		coupons.setCategory(category);
		coupons.setCouponEndDate(couponEndDate);
		coupons.setCouponInfo(couponInfo);
		coupons.setCouponImg("images/couponPic/" + fileName);
		coupons.setCouponInfo(couponInfo);
		coupons.setCouponName(couponName);
		coupons.setCouponPrice(couponPrice);
		coupons.setCouponQty(couponQty);
		coupons.setCouponStartDate(couponStartDate);
		coupons.setCouponUse(couponUse);
	
		Coupon c = couponService.findBycouponName(couponName);
		
		if(c!=null) {
			return "couponpages/couponsError";
		}else {
			couponService.update(coupons);
			m.addAttribute("find", coupons);
			return "couponpages/couponsResult";
		}	
		
	}

	@PostMapping("/empupdateCoupon.controller")
	public String updateCoupon(@RequestParam("couponImg") MultipartFile multipartFile, HttpServletRequest request,
			@RequestParam Integer couponId,@RequestParam String companyName, @RequestParam String category,@RequestParam String couponName,
			@RequestParam Integer couponPrice, @RequestParam Integer couponQty,@RequestParam String couponStartDate,@RequestParam String couponEndDate, 
			@RequestParam String couponInfo, @RequestParam String couponUse,Model m) throws IllegalStateException, IOException {
		

		String fileName = multipartFile.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
		String filePath =  path+ "/" + fileName;
	
		File saveFile = new File(filePath);
		multipartFile.transferTo(saveFile);


		Coupon coupons = new Coupon();
		
		coupons.setCouponId(couponId);
		coupons.setCompanyName(companyName);
		coupons.setCategory(category);
		coupons.setCouponEndDate(couponEndDate);
		coupons.setCouponInfo(couponInfo);
		coupons.setCouponImg("images/couponPic/" + fileName);
		coupons.setCouponInfo(couponInfo);
		coupons.setCouponName(couponName);
		coupons.setCouponPrice(couponPrice);
		coupons.setCouponQty(couponQty);
		coupons.setCouponStartDate(couponStartDate);
		coupons.setCouponUse(couponUse);
		
		Coupon c = couponService.findBycouponName(couponName);
		
		if(c!=null) {
			couponService.update(coupons);
			m.addAttribute("find", coupons);
			return "couponpages/couponsResult";
		}else {
			return "couponpages/couponsError";
		}

	}
	@GetMapping("/couponshop.controller")
	public String couponShopEntry() {
		return "couponpages/couponShop";
	}
	
	@PostMapping("/queryallcouponsbypage/{pageNo}")
	@ResponseBody
	public List<Coupon> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		
		int pageSize = 3;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Coupon> page = couponService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
	
	@GetMapping("/shopCouponItemEntry.controller")
	public String shopItemEntry(@RequestParam Integer couponId) {
		return "couponpages/couponShopItem";
	}
	
	@GetMapping("/shopcouponitem.controller")
	@ResponseBody
	public List<Coupon> shopCouponItem() {
		List<Coupon> coupons = couponService.findAll();
		return coupons;
	}


	
}
