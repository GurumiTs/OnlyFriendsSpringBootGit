package of.coupon.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import of.coupon.model.Coupon;
import of.coupon.model.CouponService;
import of.coupon.model.CouponUsers;
import of.coupon.model.CouponUsersService;
import of.member.model.Member;

@Controller
public class CouponUsersController {

	@Autowired
	private CouponUsersService couponUsersService;

	@Autowired
	private CouponService couponService;

	@GetMapping("/couponMemberCheck.controller")
	@ResponseBody
	public List<Coupon> couponMemberCheck(HttpServletRequest request) {
		Member m = (Member) request.getSession().getAttribute("personalinfo");
		String mAccount = m.getMemberAccount();
		System.out.println("mAccount:" + mAccount);

		if (mAccount != null) {
			CouponUsers memberAccount = couponUsersService.findBymemberAccount(mAccount);
			System.out.println(memberAccount);
			if (memberAccount == null) {
				System.out.println("建立帳號");
				System.out.println("是否為空=" + mAccount);
				CouponUsers couponUsers = new CouponUsers();
				couponUsers.setMemberAccount(mAccount);
				System.out.println("get=" + couponUsers.getMemberAccount());

				couponUsersService.insert(couponUsers);

				List<Coupon> coupons = couponService.findAll();

				return coupons;
			} else {
				System.out.println("取紀錄");
				String memberAccount1 = memberAccount.getMemberAccount();
				String membeCouponRecord = memberAccount.getCouponRecord();

				if (membeCouponRecord != null) {				
					String[] arrayCouponRecord = membeCouponRecord.split(",");
					
					for(int i=0; i<arrayCouponRecord.length; i++) {
						arrayCouponRecord[i]=arrayCouponRecord[i].trim();
					}
					
					
					List<Coupon> coupons = couponService.findAll();
					String[] findall = new String[coupons.size()];
					System.out.println("coupons.get(0)" + coupons.get(0).getCouponId());
					for (int i = 0; i < coupons.size(); i++) {
						findall[i] = coupons.get(i).getCouponId().toString();
						System.out.println(findall[i]);
					}
					
					System.out.println(findall.length);
					System.out.println("arrayCouponRecord="+arrayCouponRecord.length);
					System.out.println("-----------");
					int count = 0;
					String[] c = new String[findall.length - arrayCouponRecord.length];
					System.out.println("c len="+c.length);
					
					
					for (int j = 0; j < findall.length; j++) {
						for (int k = 0; k < arrayCouponRecord.length; k++) {
							if (findall[j].equals(arrayCouponRecord[k])) {
								findall[j] = "";
							}
						}
						if (!findall[j].equals("")) {
							c[count] = findall[j];
							System.out.println(c[count]);
							count++;
						}
					}

					List<String> list = Arrays.asList(c);
					List<Integer> newList = list.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
					List<Coupon> coupon = couponService.findBycouponIdIn(newList);

					return coupon;
				} else {
					System.out.println("ok2");
					List<Coupon> coupons = couponService.findAll();
					return coupons;
				}
			}
		} else {
			System.out.println("返回空值");
			List<Coupon> coupons = couponService.findAll();
			return coupons;
		}
	}
	
	
	
	
	@PostMapping("/updatecouponUsers.controller")
	public String updatecouponUsers(@RequestParam String couponRecord, Model m, HttpServletRequest request) {
		System.out.println(couponRecord);
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String mAccount = m1.getMemberAccount();
		CouponUsers memberAccount2 = couponUsersService.findBymemberAccount(mAccount);
		String membeCouponRecord2 = memberAccount2.getCouponRecord();
		if (membeCouponRecord2 != null) {
			String[] arrayCouponRecord2 = membeCouponRecord2.split(",");
			
			for(int i=0; i<arrayCouponRecord2.length; i++) {
				arrayCouponRecord2[i]=arrayCouponRecord2[i].trim();
			}
			
			System.out.println(couponRecord);
			
			List<String> list = Arrays.asList(arrayCouponRecord2);
			List<Integer> newList = list.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
			newList.add(Integer.parseInt(couponRecord));
			
			CouponUsers couponUsers = new CouponUsers();
			couponUsers.setMemberAccount(mAccount);
			couponUsers.setCouponRecord(newList.toString().replace("[", "").replace("]", "").trim());
			couponUsersService.update(couponUsers);
			m.addAttribute(couponUsers);
			return "couponpages/couponMember";
		}
		else {
			CouponUsers couponUsers = new CouponUsers();
			couponUsers.setMemberAccount(mAccount);
			couponUsers.setCouponRecord(couponRecord);
			couponUsersService.update(couponUsers);
			m.addAttribute(couponUsers);
			return "couponpages/couponMember";
		}

	}
	
	@GetMapping("/myCouponEntry.controller")
	public String myCouponEntry() {
		
		return "couponpages/myCoupon";
	}

	@GetMapping("/mycoupon.controller")
	@ResponseBody
	public List<Coupon> mycoupon(HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String mAccount = m1.getMemberAccount();
		CouponUsers memberAccount = couponUsersService.findBymemberAccount(mAccount);
		String couponRecord = memberAccount.getCouponRecord();
		String[] arrayCouponRecord = couponRecord.split(",");
		
		for(int i=0; i<arrayCouponRecord.length; i++) {
			arrayCouponRecord[i]=arrayCouponRecord[i].trim();
		}
		
		List<String> list = Arrays.asList(arrayCouponRecord);
		List<Integer> newList = list.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		List<Coupon> coupon = couponService.findBycouponIdIn(newList);

		return coupon;
   }
}
