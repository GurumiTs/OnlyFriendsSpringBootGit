package of.common.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import of.emp.model.Employee;

public interface UsersRepository extends JpaRepository<Users, String> {
	public Optional<Users> findByUsersEmail(String email);
}
