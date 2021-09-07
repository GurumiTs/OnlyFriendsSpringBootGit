package of.blogusers.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.blogusers.model.BlogUser;
import of.blogusers.model.BlogUserService;
import of.member.model.Member;

@Controller
@SessionAttributes(names = {"success", "error", "insertSuccess", "insertError"})
public class BlogPersonalController {

	@Autowired
	private BlogUserService bUserService;
	@Autowired
	private BlogUser blogUser;
	
	//進個人頁controller
	@RequestMapping(path="/memberblog" ,method = RequestMethod.GET )
	public String memberFriendsEntry() {
		return "bloguserspages/memberblog" ;
	}
	
	// 個人頁面透過memberAccount查詢發布文章
	@GetMapping(path = "/userblogalltojson")
	@ResponseBody
	public Map allBlogToJson(HttpServletRequest request, Model m) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		System.out.println("memberAccount:" + memberAccount);
		
		List<BlogUser> blogList = bUserService.findByMemberAccount(memberAccount);
		Map<String, Object> map = new HashMap<>();
		map.put("data", blogList);
		return map;
	}
	
	// 進新增controller
	@GetMapping(path = "/blogusersinsert")
	public String blogUserInsertEntry() {
		return "bloguserspages/bloguserinsert";
	}

	// Insert Controller
	@PostMapping(path = "/blogusersinsertform")
	public String blogUserAdd(@RequestParam(name = "usersImages") MultipartFile multipartFile,
							  @RequestParam(name = "usersName") String usersName,
							  @RequestParam(name = "usersTitle") String usersTitle, 
							  @RequestParam(name = "usersMainText") String usersMainText,
							  HttpServletRequest request, Model m) {
		try {
			String blogAuthority = "待審核";
			Integer likeNum = 0;
			Integer watchNum = 0;
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			BlogUser blogUser = new BlogUser();
			blogUser.setUsersCreateTime(ts);
			blogUser.setUsersUpdateTime(ts);
			blogUser.setBlogAuthority(blogAuthority);
			blogUser.setLikeNum(likeNum);
			blogUser.setWatchNum(watchNum);
			// 透過session抓memberAccount
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			blogUser.setMemberAccount(memberAccount);
			blogUser.setUsersName(usersName);
			blogUser.setUsersMainText(usersMainText);
			blogUser.setUsersTitle(usersTitle);
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
			m.addAttribute("insertSuccess", "投稿文章成功，待審核後通知您!");
			return "redirect:memberblog";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("insertError", "失敗，請再投稿一次");
			return "redirect:blogusersinsert";
		}
	}
	
	
	// 進Update Controller
	@GetMapping(path = "/blogusersupdate")
	public String updateEntry(@RequestParam(name = "usersArticleID") Integer usersArticleID, Model m) {
		System.out.println("Find articleID:" + usersArticleID + ", to Updatepages!!");
		blogUser = bUserService.findByArticleID(usersArticleID);
		m.addAttribute("blogUser", blogUser);
		return "bloguserspages/bloguserupdate";
	}
	
	// Update 
	@PostMapping(path = "/blogusersupdateform")
	public String blogUsersUpdate(@RequestParam(name = "usersArticleID") Integer usersArticleID,
								  @RequestParam(name = "usersImages") MultipartFile multipartFile,
								  @RequestParam(name = "usersName") String usersName,
								  @RequestParam(name = "usersTitle") String usersTitle, 
								  @RequestParam(name = "usersMainText") String usersMainText,
								  @RequestParam(name = "usersCreateTime") Timestamp usersCreateTime,
								  HttpServletRequest request, Model m) {
		
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			System.out.println("UpdateTime:" + ts);
			BlogUser blogUser = bUserService.findByArticleID(usersArticleID);

			// 照片改名並做IO載入->已相對路徑存入指定資料夾(blogPic)
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
			blogUser.setUsersCreateTime(usersCreateTime);
			blogUser.setUsersArticleID(usersArticleID);
			
			Member m1 = (Member) request.getSession().getAttribute("personalinfo");
			String memberAccount = m1.getMemberAccount();
			blogUser.setMemberAccount(memberAccount);
			blogUser.setUsersName(usersName);
			blogUser.setUsersTitle(usersTitle);
			blogUser.setUsersMainText(usersMainText);
			blogUser.setUsersUpdateTime(ts);

			bUserService.updateBlogUser(blogUser);

			m.addAttribute("success", "更新資料成功!");
			return "redirect:memberblog";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("errors", "Something is wrong!");
			return "redirect:blogusersupdate";
		}
	}
	
	// Delete(單一刪除)
	@PostMapping(path = "/usersblogdelete/{usersArticleID}")
	@ResponseBody
	public String deleteBlog(@PathVariable("usersArticleID") Integer usersArticleID) {
		System.out.println("usersArticleID" + usersArticleID);
		boolean boo = bUserService.checkArticleID(usersArticleID);
		if (boo) {
			bUserService.deleteById(usersArticleID);
			return "yes";
		}
		return "fail";
	}
	
}
