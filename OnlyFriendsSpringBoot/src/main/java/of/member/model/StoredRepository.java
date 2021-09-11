package of.member.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface StoredRepository extends JpaRepository<Stored,Integer>{
	
	@Query(value = "select sum(total) from Stored where Month(orderTime) = ?1 ",nativeQuery = true)
	public Float searchtotal(Integer month);
	
	@Query(value = "select sum(total) from Stored",nativeQuery = true)
	public Float storedannual();
	
	@Query(value = "select sum(total) from Stored where memberAccount =?1",nativeQuery = true)
	public Float memberstoredtotal(String memberAccount);

}
