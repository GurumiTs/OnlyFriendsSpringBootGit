package of.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	 Optional<Product> findByProName(String proname);
	 List<Product> findByProItem(String proItem);
	 Page<Product> findByProItem(Pageable pageable,String proItem);
	 
}
