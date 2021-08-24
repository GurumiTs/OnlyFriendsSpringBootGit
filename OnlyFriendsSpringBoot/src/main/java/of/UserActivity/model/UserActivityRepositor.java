package of.UserActivity.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserActivityRepositor extends JpaRepository<UserActivity, Integer> {

	public Optional<UserActivity> findByNumber(Integer number);
}
