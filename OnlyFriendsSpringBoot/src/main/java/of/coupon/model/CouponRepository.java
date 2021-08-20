package of.coupon.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	
	public List<Coupon> findBycouponNameLike(String couponName);
	
	public Coupon findBycouponName(String couponName);
		
	public List<Coupon> findBycategory(String category);
	
	public List<Coupon> findBycategoryLike(String category);
	
	
	
//	public void deleteBycouponName(String couponName);

}
