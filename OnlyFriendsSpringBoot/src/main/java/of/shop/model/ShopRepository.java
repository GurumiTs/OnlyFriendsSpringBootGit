package of.shop.model;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import of.member.model.Member;
import of.product.model.Product;


@Repository
public interface ShopRepository extends JpaRepository<CartItem, Integer> {
	Optional<Product> findByProId(Integer proId);
	
	Optional<CartItem> findByCartId(Integer cartId);
	
}
