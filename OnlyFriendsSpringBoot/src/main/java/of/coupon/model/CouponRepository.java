package of.coupon.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	
	public List<Coupon> findBycouponNameLike(String couponName);
	
	public Coupon findBycouponName(String couponName);
		
	public List<Coupon> findBycategory(String category);
	
	public List<Coupon> findBycategoryLike(String category);
	
	public List<Coupon> findBycouponIdIn(List<Integer> couponIds);
	
	
	
//	public void deleteBycouponName(String couponName);
	
//	public Page<Coupon> findBycategoryLike(Pageable pageable,String category);
	
//	public Page<Coupon> findBycategoryNotLike(Pageable pageable,String category);
	
//	public Page<Coupon> findBycategory(Pageable pageable,String category);
	
//	public Page<Coupon> findBycouponNameLike(Pageable pageable,String couponName);
	
//	@Query(value="select * from Coupon where couponName like ?1 and category like '優惠券%'", nativeQuery = true)
//	public Page<Coupon> findBycouponNameLike(Pageable pageable,String couponName);
}
