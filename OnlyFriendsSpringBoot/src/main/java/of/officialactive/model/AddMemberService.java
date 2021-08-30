package of.officialactive.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AddMemberService {

	@Autowired
	private AddmemberRepository addmemberRepsoitory;
	
	public AddMember insert(AddMember addMember) {
		
		return addmemberRepsoitory.save(addMember);
	}
}
