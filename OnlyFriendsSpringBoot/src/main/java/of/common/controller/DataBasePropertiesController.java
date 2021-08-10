package of.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import of.common.model.DataBaseProperties;


@RestController
public class DataBasePropertiesController {
	
	@Autowired
	private DataBaseProperties dbProperties;
	
	@GetMapping(path = "/dbpropsinfo.controller")
	public DataBaseProperties processAction() {
		return dbProperties;
	}
	
}
