package of.coupon.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("couponService")
@Transactional
public class CouponService {
	
	@Autowired
	private CouponRepository couponRepository;
	
	public Coupon insert(Coupon coupon){
		return couponRepository.save(coupon);
	}
	
	public Coupon update(Coupon coupon) {
		return couponRepository.save(coupon);
    }
	
	public void deleteBycouponId(Integer couponId){
		couponRepository.deleteById(couponId);
		
	}
	
	public List<Coupon> findAll() {
		return couponRepository.findAll();
	}
	
	public List<Coupon> findBycouponNameLike(String couponName) {
		return couponRepository.findBycouponNameLike(couponName);
	}
	
	public List<Coupon> findBycompanyName(String category) {
		return couponRepository.findBycategory(category);
	}
	
	public Coupon findBycouponName(String couponName){
		return couponRepository.findBycouponName(couponName);
	}
	
	public Optional<Coupon> findBycouponId(Integer couponId){
		return couponRepository.findById(couponId);
	}
	
	public Page<Coupon> findAllByPage(Pageable pageable){
		return couponRepository.findAll(pageable);
	}

}
