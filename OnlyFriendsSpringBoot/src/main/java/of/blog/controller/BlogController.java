package of.blog.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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

import of.blog.model.BlogBean;
import of.blog.model.BlogService;
import of.blogusers.model.BlogUser;
import of.blogusers.model.BlogUserService;

@Controller
public class BlogController {

	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;
	@Autowired
	private BlogUserService bUserService;
	
	// 進主頁controller
	@RequestMapping(path = "/empblogmgmt.controller", method = RequestMethod.GET)
	public String blogMgmtEntry(Model model) {
		return "blogpages/blogmgmt";
	}

	// Datatable Tab管理者及使用者json資料
	@GetMapping(path = "/empblogtojson")
	@ResponseBody
	public Map empBlogToJson(Model m) {
		List<BlogBean> blogList = bService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", blogList);
		return map;
	}
	
	@GetMapping(path = "/usersblogtojson")
	@ResponseBody
	public Map usersBlogToJson(Model m) {
		List<BlogUser> bUserList = bUserService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("bloguser", bUserList);
		return map;
	}
	//test json
//	@GetMapping(path = "/blogalltojson")
//	@ResponseBody
//	public Map allBlogToJson(Model m) {
//		List<BlogBean> blogList = bService.findAll();
//		List<BlogUser> bUserList = bUserService.findAll();
//		Map<String, Object> map = new HashMap<>();
//		map.put("blogemp", blogList);
//		map.put("bloguser", blogList);
//		return map;
//	}
	// Delete
	@PostMapping(path = "/empblogdelete/{articleID}")
	@ResponseBody
	public String deleteBlog(@PathVariable("articleID") Integer articleID) {
		System.out.println("articleID" + articleID);
		boolean boo = bService.checkArticleID(articleID);
		if (boo) {
			bService.deleteById(articleID);
			return "yes";
		}
			return "fail";
	}
	
	// 進新增controller
	@RequestMapping(path = "/empbloginsertform.controller", method = RequestMethod.GET)
	public String processIntoInsert(Model model) {
		return "blogpages/blogInsert";
	}

	@RequestMapping(path = "/empaddBlog.controller", method = RequestMethod.POST)
	public String blogAdd(@RequestParam(name = "images") MultipartFile multipartFile,
						  @RequestParam(name = "empAcc") String empAcc, 
						  @RequestParam(name = "userID") String userID,
						  @RequestParam(name = "title") String title, 
						  @RequestParam(name = "mainText") String mainText,
						  Model m) {

		try {
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			blog.setEmpAcc(empAcc);
			blog.setUserID(userID);
			blog.setTitle(title);
			blog.setMainText(mainText);
			blog.setCreateTime(ts);
			blog.setUpdateTime(ts);
			System.out.println("Insert time:" + ts);

			// 照片改名並做IO載入->已相對路徑存入指定資料夾(blogPic)
			String fileName = multipartFile.getOriginalFilename();
			System.out.println("fileName:" + fileName);
			String saveFilePath = ResourceUtils.getURL("classpath:static/images/blogPic").getPath();
			System.out.println("saveFilePath:" + saveFilePath);
			String filePath = saveFilePath + "/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			System.out.println("filePath:" + filePath);
			blog.setImages("images/blogPic/" + fileName);

			bService.insertBlog(blog);

			return "redirect:empblogmgmt.controller";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("errors", "Something is wrong!");
			return "redirect:empbloginsertform.controller";
		}

	}
	// update
	@GetMapping(path = "/empupdateentry.controller")
	public String updateEntry(@RequestParam(name = "articleID") Integer articleID, Model m) {
		System.out.println("Find articleID:" + articleID + ",to Updatepages" );
		blog = bService.findByArticleID(articleID);
		m.addAttribute("blog", blog);
		return "blogpages/blogUpdate";
	}

	@RequestMapping(path = "/empblogUpdate.controller", method = RequestMethod.POST)
	public String updateBlog(@RequestParam(name = "articleId") int articleID,
							 @RequestParam(name = "images") MultipartFile multipartFile, 
							 @RequestParam(name = "empAcc") String empAcc,
							 @RequestParam(name = "userID") String userID, 
							 @RequestParam(name = "title") String title,
							 @RequestParam(name = "mainText") String mainText,
							 @RequestParam(name = "createTime") Timestamp createTime,
							 Model m) {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		System.out.println("UpdateTime:" + ts);

		try {
			System.out.println("blogUpdate.controller ID:" + articleID);

			// 照片改名並做IO載入->已相對路徑存入指定資料夾(blogPic)
			String fileName = multipartFile.getOriginalFilename();
			System.out.println("fileName:" + fileName);
			String saveFilePath = ResourceUtils.getURL("classpath:static/images/blogPic").getPath();
			System.out.println("saveFilePath:" + saveFilePath);
			String filePath = saveFilePath + "/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			System.out.println("filePath:" + filePath);
			blog.setImages("images/blogPic/" + fileName);
			blog.setCreateTime(createTime);
			blog.setArticleID(articleID);
			blog.setEmpAcc(empAcc);
			blog.setUserID(userID);
			blog.setTitle(title);
			blog.setMainText(mainText);
			blog.setUpdateTime(ts);

			bService.updateBlog(blog);

			return "redirect:empblogmgmt.controller";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("errors", "Something is wrong!");
			return "redirect:empupdateentry.controller";
		}
	}
	
	
}
