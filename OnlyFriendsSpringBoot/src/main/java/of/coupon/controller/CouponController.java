package of.coupon.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
	
	@GetMapping("/Coupons.controller")
	public String processEntry(Model m) {
		List<Coupon> coupons = couponService.findAll();
		
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}
	
	@PostMapping("/getAllCouponToJson.controller")
	@ResponseBody
	public Coupon showAllCouponToJson(@RequestParam String pName) {
		Coupon coupons = couponService.findBypName(pName);
		System.out.println(pName);
		System.out.println("123");
		return coupons;
	}

	@GetMapping("/getAllCoupon.controller")
	public String showAllCoupon(Model m) {
		List<Coupon> coupons = couponService.findAll();
		
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/getByCaName.controller")
	public String showCaName(@RequestParam String queryVal, Model m) {
		List<Coupon> coupons = couponService.findByCaName(queryVal);	
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/getByLike.controller")
	public String showLike(@RequestParam String queryVal, Model m) {
		List<Coupon> coupons = couponService.findBypNameLike("%"+queryVal+"%");	
		m.addAttribute("find", coupons);
		return "couponpages/couponMgmt";
	}

	@PostMapping("/deleteCoupon.controller")
	public String deleteCoupon(@RequestParam String pName) {
		
		Coupon c = couponService.findBypName(pName);

		if(c!=null) {
			couponService.deleteBypName(pName);
			return "couponpages/deleteCouponComfirm";
		}else {
			return "couponpages/deleteCouponError";
		}
		
	}

	@PostMapping("/insertCoupon.controller")
	public String insertCoupon(@RequestParam("pImg") MultipartFile multipartFile, HttpServletRequest request,
			@RequestParam String coName, @RequestParam String caName, @RequestParam String pName,
			@RequestParam String price, @RequestParam String pQty, @RequestParam String startDate,
			@RequestParam String endDate, Model m) throws IllegalStateException, IOException {
		
		String fileName = multipartFile.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
		String filePath =  path+ "/" + fileName;
	
		File saveFile = new File(filePath);
		multipartFile.transferTo(saveFile);

		Coupon coupons = new Coupon();
		coupons.setCoName(coName);
		coupons.setCaName(caName);
		coupons.setpImg("images/couponPic/" + fileName);
		coupons.setPrice(price);
		coupons.setpName(pName);
		coupons.setpQty(pQty);
		coupons.setStartDate(startDate);
		coupons.setEndDate(endDate);

		Coupon c = couponService.findBypName(pName);
		
		if(c!=null) {
			return "couponpages/couponsError";
		}else {
			couponService.update(coupons);
			m.addAttribute("find", coupons);
			return "couponpages/couponsResult";
		}	
		
	}

	@PostMapping("/updateCoupon.controller")
	public String updateCoupon(@RequestParam("pImg") MultipartFile multipartFile, HttpServletRequest request,
			@RequestParam String coName, @RequestParam String caName, @RequestParam String pName,
			@RequestParam String price, @RequestParam String pQty, @RequestParam String startDate,
			@RequestParam String endDate, Model m) throws IllegalStateException, IOException {

		String fileName = multipartFile.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/couponPic").getPath();
		String filePath =  path+ "/" + fileName;
	
		File saveFile = new File(filePath);
		multipartFile.transferTo(saveFile);


		Coupon coupons = new Coupon();
		coupons.setCoName(coName);
		coupons.setCaName(caName);
		coupons.setpImg("images/couponPic/" + fileName);
		coupons.setPrice(price);
		coupons.setpName(pName);
		coupons.setpQty(pQty);
		coupons.setStartDate(startDate);
		coupons.setEndDate(endDate);
		
		Coupon c = couponService.findBypName(pName);
		
		if(c!=null) {
			couponService.update(coupons);
			m.addAttribute("find", coupons);
			return "couponpages/couponsResult";
		}else {
			return "couponpages/couponsError";
		}

	}

}
