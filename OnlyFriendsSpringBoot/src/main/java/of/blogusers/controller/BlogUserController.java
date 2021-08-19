package of.blogusers.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;

import of.blogusers.model.BlogUser;
import of.blogusers.model.BlogUserService;

@Controller
public class BlogUserController {

	@Autowired
	private BlogUserService bUserService;
	@Autowired
	private BlogUser blogUser;

	// 進BlogUsers主頁controller(未設前端)
	@RequestMapping(path = "/blogusers", method = RequestMethod.GET)
	public String blogUserEntry() {
		return "";
	}

	// 主頁資料轉Json 格式
	public Map allBlogUserToJson(Model m) {
		List<BlogUser> blogUserList = bUserService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", blogUserList);
		return map;
	}

	// 進新增controller(未設前端)
	@GetMapping(path = "/blogusersinsert")
	public String blogUserInsertEntry() {
		return "";
	}
	
	// Insert Controller
	@PostMapping(path = "/blogusersinsertform")
	public String blogUserAdd(@RequestParam(name = "usersImages") MultipartFile multipartFile,
							  @RequestParam(name = "memberAccount") String memberAccount, 
							  @RequestParam(name = "userName") String userName,
							  @RequestParam(name = "usersTitle") String usersTitle, 
							  @RequestParam(name = "usersMainText") String usersMainText,
							  Model m) {
		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			blogUser.setUsersCreateTime(ts);
			blogUser.setUsersUpdateTime(ts);
			blogUser.setMemberAccount(memberAccount);
			blogUser.setUserName(userName);
			blogUser.setUsersMainText(usersMainText);
			System.out.println("Insert " + memberAccount + "'s Blog time:" + ts);

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
			
			bUserService.insertBlogUser(blogUser);
			m.addAttribute("success", "新增資料成功!");
			return "redirect:blogusers";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:blogusersinsert";
		}
	}
	
	// 進Update Controller(未設前端)
	@GetMapping(path = "/blogusersupdate")
	public String updateEntry(@RequestParam(name = "usersArticleID") Integer usersArticleID, Model m) {
		System.out.println("Find articleID:" + usersArticleID + ",to Updatepages");
		blogUser = bUserService.findByArticleID(usersArticleID);
		m.addAttribute("blogUsers", blogUser);
		return "";
	}
	
	// Update 
	@PostMapping(path = "/blogusersupdateform")
	public String blogUsersUpdate(@RequestParam(name = "usersArticleID") Integer usersArticleID,
								  @RequestParam(name = "usersImages") MultipartFile multipartFile,
								  @RequestParam(name = "memberAccount") String memberAccount, 
								  @RequestParam(name = "userName") String userName,
								  @RequestParam(name = "usersTitle") String usersTitle, 
								  @RequestParam(name = "usersMainText") String usersMainText,
								  @RequestParam(name = "usersCreateTime") Timestamp usersCreateTime,
								  Model m) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		System.out.println("UpdateTime:" + ts);
		
		try {
			System.out.println("blogUpdate.controller ID:" + usersArticleID);

			// 照片改名並做IO載入->已相對路徑存入指定資料夾(blogPic)
			String fileName = multipartFile.getOriginalFilename();
			System.out.println("fileName:" + fileName);
			String saveFilePath = ResourceUtils.getURL("classpath:static/images/blogPic").getPath();
			System.out.println("saveFilePath:" + saveFilePath);
			String filePath = saveFilePath + "/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			System.out.println("filePath:" + filePath);
			blogUser.setUsersImages("images/blogUsersPic/" + fileName);
			blogUser.setUsersCreateTime(usersCreateTime);
			blogUser.setUsersArticleID(usersArticleID);
			blogUser.setMemberAccount(memberAccount);
			blogUser.setUserName(userName);
			blogUser.setUsersTitle(usersTitle);
			blogUser.setUsersMainText(usersMainText);
			blogUser.setUsersUpdateTime(ts);

			bUserService.updateBlogUser(blogUser);

			m.addAttribute("success", "更新資料成功!");
			return "redirect:blogusers";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("errors", "Something is wrong!");
			return "redirect:blogusersupdate";
		}
	}
	
	// Delete
	@PostMapping(path = "/blogdelete/{usersArticleID}")
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
