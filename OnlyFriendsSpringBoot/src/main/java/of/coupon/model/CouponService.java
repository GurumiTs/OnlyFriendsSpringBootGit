package of.coupon.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public void deleteBypName(String pName){
		couponRepository.deleteBypName(pName);
	}
	
	public List<Coupon> findAll() {
		return couponRepository.findAll();
	}
	
	public List<Coupon> findBypNameLike(String pName) {
		return couponRepository.findBypNameLike(pName);
	}
	
	public List<Coupon> findByCaName(String caName) {
		return couponRepository.findBycaName(caName);
	}
	
	public Coupon findBypName(String pName){
		return couponRepository. findBypName(pName);
	}

}
