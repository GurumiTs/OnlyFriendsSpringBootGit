package of.common.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.LocaleResolver;

import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;

import of.common.model.UsersService;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = { "errorMsg","personalinfo", "member", "employee","totalPages","totalElements"})
public class MainEntryController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Employee employee;
	@Autowired
	private Member member;

	
	 @Autowired
	    private CaptchaService captchaService;

	    @PostMapping(path = "ajcheck")
	    @ResponseBody
	    public ResponseModel get(@RequestParam("captchaVerification") String captchaVerification) {
	    	System.out.println("captchaVerification:"+captchaVerification);
	        CaptchaVO captchaVO = new CaptchaVO();
	        captchaVO.setCaptchaVerification(captchaVerification);
	        ResponseModel response = captchaService.verification(captchaVO);
	        //System.out.println("ajres:"+response);
	        if(response.isSuccess() == false){
	            //????????????????????????????????????????????????
	            //repCode  0000  ????????????????????????
	            //repCode  9999  ?????????????????????
	            //repCode  0011  ??????????????????
	            //repCode  6110  ????????????????????????????????????
	            //repCode  6111  ????????????
	            //repCode  6112  ?????????????????????,??????????????????
	        }
	        return response;
	    }

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String mainEntry(Model model,HttpServletRequest request) {
			
		
		return "index";

	}
	
	@RequestMapping(path = "/index", method = RequestMethod.GET)
	public String indexEntry(Model model) {		
			return "index";	
	}

	@GetMapping(path = "/login")
	public String loginEntry() {
		return "login";
	}
	
	@GetMapping(path = "/login/error")
	public String loginErrorEntry(HttpServletRequest request,@RequestParam(name = "username") String username,Model model) {
		System.out.println("step2");
		
		
		Member member = memberService.findByMemberAccount(username);	
		if ( member.getMemberAuth() == 0) {
			  model.addAttribute("errorMsg","?????????????????????");
			}
		else {
			 model.addAttribute("errorMsg","???????????????????????????");
		}
		
		return "login";
	}
	
	@GetMapping(path = "/login?error")
	public String loginErrorrEntry(HttpServletRequest request) {
		System.out.println("step2");
		
		return "login";
	}	
	
	@RequestMapping(path = "/shopitem.controller", method = RequestMethod.GET)
	public String shopItemEntry() {
		return "frontcommonpages/shopitemexample";
	}
	
	@RequestMapping(path = "/shop.controller", method = RequestMethod.GET)
	public String shopEntry() {
		return "frontcommonpages/shopexample";
	}
	
	
	@PostMapping(path = "/queryallbypage/{pageNo}")
	@ResponseBody
	public List<Employee> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		
		int pageSize = 2;
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Employee> page = empService.findAllByPage(pageable);
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();
		
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
	
	@RequestMapping(path = "/blogexample.controller", method = RequestMethod.GET)
	public String blogexampleEntry() {
		return "frontcommonpages/blogexample";
	}
	
	@RequestMapping(path = "/blogarticleample.controller", method = RequestMethod.GET)
	public String blogarticleexampleEntry() {
		return "frontcommonpages/blogarticleexample";
	}
	
	@RequestMapping(path = "/try.controller", method = RequestMethod.GET)
	public String tryEntry() {
		return "frontcommonpages/try";
	}
	
	@RequestMapping(path = "/404.controller", method = RequestMethod.GET)
	public String exceptEntry() {
		return "404";
	}
	
	@RequestMapping(path = "/map", method = RequestMethod.GET)
	public String mapEntry() {
		return "frontcommonpages/blogexample";
	}

}
