package of.coupon.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("CouponUsersService")
@Transactional
public class CouponUsersService {
	
	@Autowired
	private CouponUsersRepository couponUsersRepository;
	
	public CouponUsers insert(CouponUsers couponUsers){
		return couponUsersRepository.save(couponUsers);
	}
	
	public CouponUsers update(CouponUsers couponUsers) {
		return couponUsersRepository.save(couponUsers);
    }
	
	public void deleteBycouponUsersId(String memberAccount){
		couponUsersRepository.deleteById(memberAccount);		
	}
	
	public List<CouponUsers> findAll() {
		return couponUsersRepository.findAll();
	}
	
	public CouponUsers findBymemberAccount(String memberAccount) {
		return couponUsersRepository.findBymemberAccount(memberAccount);
	}
	 
}
