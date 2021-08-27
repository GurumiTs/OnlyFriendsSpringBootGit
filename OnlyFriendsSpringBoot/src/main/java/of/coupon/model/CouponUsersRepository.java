package of.coupon.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CouponUsersRepository extends JpaRepository<CouponUsers, String>{
	
	public CouponUsers findBymemberAccount(String memberAccount);
	

}
