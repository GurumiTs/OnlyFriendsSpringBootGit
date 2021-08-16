package of.party.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PartyRepository extends JpaRepository<Party, Integer> {

	public Optional<Party> findByNumber(Integer number);
}
