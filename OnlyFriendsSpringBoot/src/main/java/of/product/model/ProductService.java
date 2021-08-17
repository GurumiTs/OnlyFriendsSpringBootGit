package of.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import of.blog.model.BlogBean;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	public Product insert(Product product) {
		System.out.println("ok");
		return productRepository.save(product);
	}
	public Product update(Product product) {
		return productRepository.save(product);
	}
	
	public void deleteById(Integer Id) {
		productRepository.deleteById(Id);
	}
	
	public Product findById(Integer Id) {
		Optional<Product> productOptional =productRepository.findById(Id);
		return productOptional.get();
	}
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}
	
	public boolean checkName(String proName) {
		Optional<Product> productOptional = productRepository.findByProName(proName);
		return productOptional.isPresent();
	}
	
	public Boolean checkproId(Integer Id) {
		Optional<Product> pOptional = productRepository.findById(Id);
		return pOptional.isPresent();
	}
}
