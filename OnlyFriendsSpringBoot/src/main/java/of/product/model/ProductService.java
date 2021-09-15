package of.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


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
	
	public List<Product> findByItemList(String proItem){
		return productRepository.findByProItem(proItem);
	}
	
	public Page<Product> findAllByPage(Pageable pageable){
		return productRepository.findAll(pageable);
	}
	
	public Boolean checkproId(Integer Id) {
		Optional<Product> pOptional = productRepository.findById(Id);
		return pOptional.isPresent();
	}
	
	public Page<Product> findByItem(Pageable pageable,String proItem){
		return productRepository.findByProItem(pageable,proItem);
	}
	
	public Integer findIdToGetPrice(Integer Id) {
		
		
		return productRepository.findById(Id).get().getProPrice();
	}
	
	
	public List<Product> findByitemLike(String proItem) {
		return productRepository.findByproItemLike(proItem);
	}
}
