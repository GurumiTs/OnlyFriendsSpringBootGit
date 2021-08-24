package of.blogusers.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

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

@Controller
@SessionAttributes(names = {"totalPages", "totalElements"})
public class BlogUserController {

	@Autowired
	private BlogUserService bUserService;
	@Autowired
	private BlogUser blogUser;
	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;

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
			blogUser = bUserService.findByArticleID(articleId);			
			m.addAttribute("blogUser", blogUser);
			return "bloguserspages/blogarticle";
		} else if(user.equals("official")) {
			blog = bService.findByArticleID(articleId);
			m.addAttribute("blogOfficial", blog);
			return "bloguserspages/empblogarticle";
		}
		m.addAttribute("errors", "此文章已查詢不到");
		return "redirect:blogusers";
	}

	// 進新增controller
	@GetMapping(path = "/blogusersinsert")
	public String blogUserInsertEntry() {
		return "bloguserspages/bloguserinsert";
	}
	
	// Insert Controller
	@PostMapping(path = "/blogusersinsertform")
	public String blogUserAdd(@RequestParam(name = "usersImages") MultipartFile multipartFile,
							  @RequestParam(name = "memberAccount") String memberAccount, 
							  @RequestParam(name = "usersName") String usersName,
							  @RequestParam(name = "usersTitle") String usersTitle, 
							  @RequestParam(name = "usersMainText") String usersMainText,
							  Model m) {
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			blogUser.setUsersCreateTime(ts);
			blogUser.setUsersUpdateTime(ts);
			blogUser.setMemberAccount(memberAccount);
			blogUser.setUsersName(usersName);
			blogUser.setUsersMainText(usersMainText);
			System.out.println("Insert " + memberAccount + "'s Blog when time:" + ts);

			// 照片改名並做IO載入->已相對路徑存入指定資料夾(blogUsersPic)
			String fileName = multipartFile.getOriginalFilename();
			System.out.println("fileName:" + fileName);
			String saveFilePath;
			saveFilePath = ResourceUtils.getURL("classpath:static/images/blogUsersPic").getPath();
			System.out.println("saveFilePath:" + saveFilePath);
			String filePath = saveFilePath + "/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			System.out.println("filePath:" + filePath);
			blogUser.setUsersImages("images/blogUsersPic/" + fileName);
			
			bUserService.insertBlogUser(blogUser);
			m.addAttribute("success", "新增資料成功!");
			return "redirect:blogusers";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:blogusersinsert";
		}
	}
	
//	// 進Update Controller(未設前端)
//	@GetMapping(path = "/blogusersupdate")
//	public String updateEntry(@RequestParam(name = "usersArticleID") Integer usersArticleID, Model m) {
//		System.out.println("Find articleID:" + usersArticleID + ",to Updatepages");
//		blogUser = bUserService.findByArticleID(usersArticleID);
//		m.addAttribute("blogUsers", blogUser);
//		return "";
//	}
//	
//	// Update 
//	@PostMapping(path = "/blogusersupdateform")
//	public String blogUsersUpdate(@RequestParam(name = "usersArticleID") Integer usersArticleID,
//								  @RequestParam(name = "usersImages") MultipartFile multipartFile,
//								  @RequestParam(name = "memberAccount") String memberAccount, 
//								  @RequestParam(name = "userName") String userName,
//								  @RequestParam(name = "usersTitle") String usersTitle, 
//								  @RequestParam(name = "usersMainText") String usersMainText,
//								  @RequestParam(name = "usersCreateTime") Timestamp usersCreateTime,
//								  Model m) {
//		Timestamp ts = new Timestamp(System.currentTimeMillis());
//		System.out.println("UpdateTime:" + ts);
//		
//		try {
//			System.out.println("blogUpdate.controller ID:" + usersArticleID);
//
//			// 照片改名並做IO載入->已相對路徑存入指定資料夾(blogPic)
//			String fileName = multipartFile.getOriginalFilename();
//			System.out.println("fileName:" + fileName);
//			String saveFilePath = ResourceUtils.getURL("classpath:static/images/blogPic").getPath();
//			System.out.println("saveFilePath:" + saveFilePath);
//			String filePath = saveFilePath + "/" + fileName;
//			File saveFile = new File(filePath);
//			multipartFile.transferTo(saveFile);
//			System.out.println("filePath:" + filePath);
//			blogUser.setUsersImages("images/blogUsersPic/" + fileName);
//			blogUser.setUsersCreateTime(usersCreateTime);
//			blogUser.setUsersArticleID(usersArticleID);
//			blogUser.setMemberAccount(memberAccount);
//			blogUser.setUserName(userName);
//			blogUser.setUsersTitle(usersTitle);
//			blogUser.setUsersMainText(usersMainText);
//			blogUser.setUsersUpdateTime(ts);
//
//			bUserService.updateBlogUser(blogUser);
//
//			m.addAttribute("success", "更新資料成功!");
//			return "redirect:blogusers";
//		} catch (Exception e) {
//			e.printStackTrace();
//			m.addAttribute("errors", "Something is wrong!");
//			return "redirect:blogusersupdate";
//		}
//	}
//	
//	// Delete
//	@PostMapping(path = "/blogdelete/{usersArticleID}")
//	@ResponseBody
//	public String deleteBlog(@PathVariable("usersArticleID") Integer usersArticleID) {
//		System.out.println("usersArticleID" + usersArticleID);
//		boolean boo = bUserService.checkArticleID(usersArticleID);
//		if (boo) {
//			bUserService.deleteById(usersArticleID);
//			return "yes";
//		}
//		return "fail";
//	}
	
	// 使用者文章前端首頁
	@PostMapping(path = "/blogqueryallbypage/{pageNo}")
	@ResponseBody
	public List<BlogUser> queryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 6;
		System.out.println("controller");
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<BlogUser> page = bUserService.findAllByPage(pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();// 全部有幾筆資料
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
	
	// 進BlogUsers主頁controller(未設前端)
		@GetMapping(path = "/blogofficial")
		public String blogEmpEntry() {
			return "bloguserspages/empblogmainpage";
		}
	
	// 管理者文章前端首頁
	@PostMapping(path = "/empblogallbypage/{pageNo}")
	@ResponseBody
	public List<BlogBean> queryByPageActionEmp(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 6;
		System.out.println("controller");
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<BlogBean> page = bService.findAllByPage(pageable);
		
		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();// 全部有幾筆資料
		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		
		return page.getContent();
	}
	
	
}
