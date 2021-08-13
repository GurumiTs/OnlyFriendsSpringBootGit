package of.coupon.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CouponRepository extends JpaRepository<Coupon, String> {
	
	public List<Coupon> findBypNameLike(String pName);
	
	public Coupon findBypName(String pName);
	
	public List<Coupon> findBycaName(String caName);
	
	public void deleteBypName(String pName);

}
