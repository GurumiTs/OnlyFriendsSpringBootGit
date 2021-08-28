package of.coupon.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import of.coupon.model.Coupon;
import of.coupon.model.CouponService;

@Controller
public class CouponController {

	@Autowired
	private CouponService couponService;

	@GetMapping("/empCoupons.controller")
	public String processEntry(Model m) {
		List<Coupon> coupons = couponService.findAll();
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@GetMapping("/couponDetailEntry.controller")
	public String couponDetailEntry() {
		return "couponpages/couponsDetail";
	}

	@GetMapping("/couponDetail.controller")
	@ResponseBody
	public List<Coupon> couponDetail() {
		List<Coupon> coupons = couponService.findAll();
		return coupons;
	}

	@PostMapping("/getAllCouponToJson.controller")
	@ResponseBody
	public Optional<Coupon> showAllCouponToJson(@RequestParam Integer couponId) throws InterruptedException {
		Optional<Coupon> coupons = couponService.findBycouponId(couponId);
		if (coupons.isPresent()) {
			Thread.sleep(1000);
			return coupons;
		} else {
			return coupons.of(null);
		}

	}

	@PostMapping("/getAllCouponDetailToJson.controller")
	@ResponseBody
	public List<Coupon> showAllCouponDetailToJson() {
		List<Coupon> coupons = couponService.findAll();
		return coupons;
	}

	@GetMapping("/empgetAllCoupon.controller")
	public String showAllCoupon(Model m) {
		List<Coupon> coupons = couponService.findAll();
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/empgetBycategoryName.controller")
	public String showCategory(@RequestParam String queryVal, Model m) {
		List<Coupon> coupons = couponService.findBycategoryName(queryVal);
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@GetMapping("/showLikeCoupon.controller")
	@ResponseBody
	public List<Coupon> showLikeCoupon(@RequestParam String queryVal) {
		List<Coupon> coupons = couponService.findBycouponNameLike("%" + queryVal + "%");
		return coupons;
	}

	@PostMapping("/empgetByLike.controller")
	public String showLike(@RequestParam String queryVal, Model m) {
		List<Coupon> coupons = couponService.findBycouponNameLike("%" + queryVal + "%");
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/empdeleteCoupon.controller")
	public String deleteCoupon(@RequestParam Integer couponId) {

		Optional<Coupon> c = couponService.findBycouponId(couponId);

		if (c.isPresent()) {
			couponService.deleteBycouponId(couponId);
			return "couponpages/deleteCouponComfirm";
		} else {
			return "couponpages/deleteCouponError";
		}
	}

	@PostMapping("/empinsertCoupon.controller")
	public String insertCoupon(@RequestParam("couponImg") MultipartFile multipartFile, HttpServletRequest request,
			@RequestParam String companyName, @RequestParam String category, @RequestParam String couponName,
			@RequestParam Integer couponPrice, @RequestParam Integer couponQty, @RequestParam String couponStartDate,
			@RequestParam String couponEndDate, @RequestParam String couponInfo, @RequestParam String couponUse,
			Model m) throws IllegalStateException, IOException {

		String fileName = multipartFile.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
		String filePath = path + "/" + fileName;

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

		if (c != null) {
			return "couponpages/couponsError";
		} else {
			couponService.update(coupons);
			m.addAttribute("find", coupons);
			return "couponpages/couponsResult";
		}

	}

	@PostMapping("/empupdateCoupon.controller")
	public String updateCoupon(@RequestParam("couponImg") MultipartFile multipartFile, HttpServletRequest request,
			@RequestParam Integer couponId, @RequestParam String companyName, @RequestParam String category,
			@RequestParam String couponName, @RequestParam Integer couponPrice, @RequestParam Integer couponQty,
			@RequestParam String couponStartDate, @RequestParam String couponEndDate, @RequestParam String couponInfo,
			@RequestParam String couponUse, Model m) throws IllegalStateException, IOException {

		String fileName = multipartFile.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
		String filePath = path + "/" + fileName;

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

		Optional<Coupon> c = couponService.findBycouponId(couponId);

		if (c.isPresent()) {
			couponService.update(coupons);
			m.addAttribute("find", coupons);
			return "couponpages/couponsResult";
		} else {
			return "couponpages/couponsError";
		}

	}

	@GetMapping("/couponshop.controller")
	public String couponShopEntry() {
		return "couponpages/couponShop";
	}

	@GetMapping("/shopCouponItemEntry.controller")
	public String shopItemEntry() {
		return "couponpages/couponShopItem";
	}

	@GetMapping("/shopcouponitem.controller")
	@ResponseBody
	public List<Coupon> shopCouponItem() {
		List<Coupon> coupons = couponService.findAll();
		return coupons;
	}

	@GetMapping("/couponMember.controller")
	public String couponMemberEntry() {
		
		return "couponpages/couponMember";
	}
	
	

	
	
//	@PostMapping("/queryallcouponsbypage/{pageNo}")
//	@ResponseBody
//	public List<Coupon> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
//		
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
//		Page<Coupon> page = couponService.findAllByPage(pageable);
//		
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//		
//		
//		System.out.println(totalPages);
//		System.out.println(totalElements);
//		
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//		
//		return page.getContent();
//	}

	// 分類為優惠券全部
//	@PostMapping("/queryallcategorycsobypage/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallcategorycsobypage(@PathVariable("pageNo") int pageNo, Model m) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycategorylikes(pageable, "優惠券%");
//
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}

	// 分類為優惠券Free
//	@PostMapping("/queryallcategoryfreebypage/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallcategoryfreebypage(@PathVariable("pageNo") int pageNo, Model m) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycategoryNotlikes(pageable, "優惠券%");
//
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}

	
	// search
//	@PostMapping("/queryallcoupons/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallcoupons(@PathVariable("pageNo") int pageNo, @RequestParam String queryVal, Model m) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycouponNameLike(pageable, "%" + queryVal + "%");
//
//		System.out.println(queryVal);
//
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//		
//		System.out.println(totalPages);
//		System.out.println(totalElements);
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}

	// travel
//	@PostMapping("/queryallCategoryTravel/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallCategoryTravel(@PathVariable("pageNo") int pageNo, Model m, @RequestParam String travel) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycategory(pageable, "優惠券-旅遊");
//
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//		
//		System.out.println(totalPages);
//		System.out.println(totalElements);
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}

	// food
//	@PostMapping("/queryallCategoryFood/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallCategoryFood(@PathVariable("pageNo") int pageNo, Model m, @RequestParam String food) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycategory(pageable, "優惠券-美食");
//		System.out.println(food);
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//		
//		System.out.println(totalPages);
//		System.out.println(totalElements);
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}

	// sports
//	@PostMapping("/queryallCategorySports/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallCategorySports(@PathVariable("pageNo") int pageNo, Model m, @RequestParam String sports) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycategory(pageable, "優惠券-運動");
//		System.out.println(sports);
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//		
//		System.out.println(totalPages);
//		System.out.println(totalElements);
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}

	// accommodation
//	@PostMapping("/queryallCategoryAccommodation/{pageNo}")
//	@ResponseBody
//	public List<Coupon> queryallCategoryAccommodation(@PathVariable("pageNo") int pageNo, Model m,
//			String accommodation) {
//
//		int pageSize = 3;
//
//		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//		Page<Coupon> page = couponService.findBycategory(pageable, "優惠券-住宿");
//		System.out.println(accommodation);
//		int totalPages = page.getTotalPages();
//		long totalElements = page.getTotalElements();
//		
//		System.out.println(totalPages);
//		System.out.println(totalElements);
//
//		m.addAttribute("totalPages", totalPages);
//		m.addAttribute("totalElements", totalElements);
//
//		return page.getContent();
//	}
	
//	@GetMapping("/releteCouponItem")
//	@ResponseBody
//	public List<Coupon> releteCouponItem(@RequestParam String couponName) {
//		List<Coupon> coupons = couponService.findBycategoryLike("優惠券%");
//		
//		
//		System.out.println(couponName);
//		System.out.println(coupons);
//		return coupons;
//	}
	
	

}
