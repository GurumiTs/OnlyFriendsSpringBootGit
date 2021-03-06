package of.blogusers.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.blog.model.BlogBean;
import of.blog.model.BlogService;
import of.blogusers.model.BlogUser;
import of.blogusers.model.BlogUserService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = {"blogUserTotalPages", "blogUserTotalElements", "blogEmpTotalPages", "blogEmpTotalElements"})
public class BlogUserController {

	@Autowired
	private BlogUserService bUserService;
	@Autowired
	private BlogUser blogUser;
	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;
	@Autowired
	private MemberService memberService;
	
	// 進BlogUsers主頁controller
	@GetMapping(path = "/blogusers")
	public String blogUserEntry() {
		return "bloguserspages/blogusermainpage";
	}

	// 進單一文章頁面
	@GetMapping(path = "/blogarticleentry")
	public String blogArticleEntry(@RequestParam(name = "ArticleId") Integer articleId,
								   @RequestParam(name = "name") String user,
								   Model m) {
		
		System.out.println("Find ArticleId:" + articleId);
		System.out.println("Find kind blog:" + user);
		if (user.equals("user")) {
			BlogUser blogUser = bUserService.findByArticleID(articleId);
			
			//單一文章內容
			blogUser.setWatchNum(blogUser.getWatchNum()+1);
			bUserService.updateBlogUser(blogUser);
			m.addAttribute("blogUser", blogUser);
			return "bloguserspages/blogarticle";
		} else if(user.equals("official")) {
			BlogBean blog = bService.findByArticleID(articleId);
			blog.setWatchNum(blog.getWatchNum()+1);
			bService.updateBlog(blog);
			m.addAttribute("blogOfficial", blog);
			return "bloguserspages/empblogarticle";
		}
		m.addAttribute("errors", "此文章已查詢不到");
		return "redirect:blogusers";
	}
	

	// 使用者文章前端首頁
	@PostMapping(path = "/blogqueryallbypage/{pageNo}")
	@ResponseBody
	public List<BlogUser> queryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 6;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		String blogAuthority = "審核通過";
		Page<BlogUser> page = bUserService.findAllByBlogAuthority(blogAuthority, pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();// 全部有幾筆資料
		m.addAttribute("blogUserTotalPages", totalPages);
		m.addAttribute("blogUserTotalElements", totalElements);
		
		return page.getContent();
	}
	
	// 進empBlog主頁controller
	@GetMapping(path = "/blogofficial")
	public String blogEmpEntry() {
		return "bloguserspages/empblogmainpage";
	}
	
	// 管理者文章前端首頁
	@PostMapping(path = "/empblogallbypage/{pageNo}")
	@ResponseBody
	public List<BlogBean> queryByPageActionEmp(@PathVariable("pageNo") int pageNo,
											   @RequestParam(name = "blogtype") String blogType, Model m) {
		int pageSize = 5;
//		System.out.println("blogtype=" + blogType);
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<BlogBean> page = bService.findAllByBlogType(blogType, pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();// 全部有幾筆資料
		m.addAttribute("blogEmpTotalPages", totalPages);
		m.addAttribute("blogEmpTotalElements", totalElements);
		
		return page.getContent();
	}
	
	// 確認點讚
	@GetMapping(path = "/checklike")
	@ResponseBody
	public String checkLike(@RequestParam(name = "usersArticleID") Integer usersArticleID, HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccountString = m1.getMemberAccount();
		BlogUser blogUser = bUserService.findByArticleID(usersArticleID);
		List<Member> likenumtable = blogUser.getLikenumtable();
		Boolean booleanMember = likenumtable.stream().anyMatch(item -> memberAccountString.equals(item.getMemberAccount()));
		if (booleanMember) {
			return "exist";
		}else {
			return "empty";
		}
	}
	
	// 點讚
	@GetMapping(path = "/bloglike")
	@ResponseBody
	public String blogLike(@RequestParam(name = "usersArticleID") Integer usersArticleID, HttpServletRequest request) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		
		Member m2 = memberService.findByMemberAccount(memberAccount);
		
		BlogUser blogUser = bUserService.findByArticleID(usersArticleID);
		System.out.println("userid:" + usersArticleID);
		List<Member> likenumtable = blogUser.getLikenumtable();
		Boolean booleanMember = likenumtable.stream().anyMatch(item -> memberAccount.equals(item.getMemberAccount()));
		if (booleanMember) {
			System.out.println("exist");
			System.out.println("1111111111111111");
			blogUser.removeLike(m2);
			bUserService.updateBlogUser(blogUser);
			List<Member> likenumtablenew  = bUserService.findByArticleID(usersArticleID).getLikenumtable();
			blogUser.setLikeNum(likenumtablenew.size());
			System.out.println("size:"+likenumtablenew.size());
			return "unlike";
		}else {
			System.out.println("empty");
			likenumtable.add(m1);
			bUserService.updateBlogUser(blogUser);
			blogUser.setLikeNum(likenumtable.size());
			System.out.println("size:"+likenumtable.size());
			return "like";
		}
	}
	
	// 計算點讚數
	@GetMapping(path = "/bloglikenumber")
	@ResponseBody
	public Integer blogLikeNumber(@RequestParam(name = "usersArticleID") Integer usersArticleID) {
		BlogUser blogUser = bUserService.findByArticleID(usersArticleID);
		List<Member> likenumtable = blogUser.getLikenumtable();
		Integer likeNumber = likenumtable.size();
		return likeNumber;
	}
	
	
}
