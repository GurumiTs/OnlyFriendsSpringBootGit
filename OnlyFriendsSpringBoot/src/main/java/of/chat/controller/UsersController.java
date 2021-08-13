package of.chat.controller;

import java.util.Set;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import of.chat.model.UserStorage;

@RestController
public class UsersController {

	@GetMapping("/registration/{userName}")
	public ResponseEntity<Void> register(@PathVariable String userName){
		System.out.println("handling register user request"+userName);
		try {
			UserStorage.getInstance().setUser(userName);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok().build();
	}
	
	@GetMapping
	public Set<String> fetchAll(){
		return UserStorage.getInstance().getUsers();
	}
	
	
}
