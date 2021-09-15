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

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.messaging.simp.SimpMessagingTemplate;
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
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
public class BlogController {

	@Autowired
	private BlogService bService;
	@Autowired
	private BlogBean blog;
	@Autowired
	private BlogUserService bUserService;

	@Autowired
	private MemberService memberService;
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplete;
	@Autowired
	private JavaMailSender sender;
	
	// 進主頁controller
	@RequestMapping(path = "/empblogmgmt.controller", method = RequestMethod.GET)
	public String blogMgmtEntry(Model model) {
		return "blogpages/blogmgmt";
	}
	
	@GetMapping(path = "/usersblogtojson")
	@ResponseBody
	public Map usersBlogToJson(Model m) {
		List<BlogUser> bUserList = bUserService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", bUserList);
		return map;
	}

	@GetMapping(path = "/blogalltojson")
	@ResponseBody
	public Map allBlogToJson(Model m) {
		List<BlogBean> blogList = bService.findAll();
		List<BlogUser> bUserList = bUserService.findAll();
		Map<String, Object> map = new HashMap<>();
		map.put("blogemp", blogList);
		map.put("bloguser", bUserList);
		return map;
	}
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
						  @RequestParam(name = "BlogType") String blogType,
						  Model m) {

		try {
			Integer watchNum = 0;
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			BlogBean blog = new BlogBean();
			blog.setEmpAcc(empAcc);
			blog.setUserID(userID);
			blog.setTitle(title);
			blog.setMainText(mainText);
			blog.setWatchNum(watchNum);
			blog.setCreateTime(ts);
			blog.setUpdateTime(ts);
			System.out.println("1215156156165");
			System.out.println("blogtype:" + blogType);
			blog.setBlogType(blogType);
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
	public String updateBlog(@RequestParam(name = "articleId") Integer articleID,
							 @RequestParam(name = "images") MultipartFile multipartFile, 
							 @RequestParam(name = "empAcc") String empAcc,
							 @RequestParam(name = "userID") String userID, 
							 @RequestParam(name = "title") String title,
							 @RequestParam(name = "mainText") String mainText,
							 @RequestParam(name = "createTime") Timestamp createTime,
							 @RequestParam(name = "BlogType") String blogType,
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
			BlogBean blog = bService.findByArticleID(articleID);
			blog.setImages("images/blogPic/" + fileName);
			blog.setCreateTime(createTime);
			blog.setArticleID(articleID);
			blog.setEmpAcc(empAcc);
			blog.setUserID(userID);
			blog.setTitle(title);
			blog.setMainText(mainText);
			blog.setUpdateTime(ts);
			blog.setBlogType(blogType);

			bService.updateBlog(blog);

			return "redirect:empblogmgmt.controller";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("errors", "Something is wrong!");
			return "redirect:empupdateentry.controller";
		}
	}
	
	// 調整使用者文章權限
	@PostMapping(path = "/authority")
	@ResponseBody
	public String setAuthority(@RequestParam(name = "usersArticleID") Integer usersArticleID, Model model) {
		System.out.println("authority number:"+usersArticleID);
		BlogUser blogUser = bUserService.findByArticleID(usersArticleID);
		String authority = blogUser.getBlogAuthority();
		System.out.println(authority);
		if (authority.equals("待審核")) {
			blogUser.setBlogAuthority("審核通過");
			try {
				MimeMessage mimeMessage = sender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
				String htmlMsg = "<!DOCTYPE html>\r\n"
						+ "<html>\r\n"
						+ "  <head>\r\n"
						+ "    <title></title>\r\n"
						+ "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n"
						+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\r\n"
						+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n"
						+ "    <style type=\"text/css\">\r\n"
						+ "      @media screen {\r\n"
						+ "        @font-face {\r\n"
						+ "          font-family: \"Lato\";\r\n"
						+ "          font-style: normal;\r\n"
						+ "          font-weight: 400;\r\n"
						+ "          src: local(\"Lato Regular\"), local(\"Lato-Regular\"),\r\n"
						+ "            url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff)\r\n"
						+ "              format(\"woff\");\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        @font-face {\r\n"
						+ "          font-family: \"Lato\";\r\n"
						+ "          font-style: normal;\r\n"
						+ "          font-weight: 700;\r\n"
						+ "          src: local(\"Lato Bold\"), local(\"Lato-Bold\"),\r\n"
						+ "            url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff)\r\n"
						+ "              format(\"woff\");\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        @font-face {\r\n"
						+ "          font-family: \"Lato\";\r\n"
						+ "          font-style: italic;\r\n"
						+ "          font-weight: 400;\r\n"
						+ "          src: local(\"Lato Italic\"), local(\"Lato-Italic\"),\r\n"
						+ "            url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff)\r\n"
						+ "              format(\"woff\");\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        @font-face {\r\n"
						+ "          font-family: \"Lato\";\r\n"
						+ "          font-style: italic;\r\n"
						+ "          font-weight: 700;\r\n"
						+ "          src: local(\"Lato Bold Italic\"), local(\"Lato-BoldItalic\"),\r\n"
						+ "            url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff)\r\n"
						+ "              format(\"woff\");\r\n"
						+ "        }\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      /* CLIENT-SPECIFIC STYLES */\r\n"
						+ "      body,\r\n"
						+ "      table,\r\n"
						+ "      td,\r\n"
						+ "      a {\r\n"
						+ "        -webkit-text-size-adjust: 100%;\r\n"
						+ "        -ms-text-size-adjust: 100%;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      table,\r\n"
						+ "      td {\r\n"
						+ "        mso-table-lspace: 0pt;\r\n"
						+ "        mso-table-rspace: 0pt;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      img {\r\n"
						+ "        -ms-interpolation-mode: bicubic;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      /* RESET STYLES */\r\n"
						+ "      img {\r\n"
						+ "        border: 0;\r\n"
						+ "        height: auto;\r\n"
						+ "        line-height: 100%;\r\n"
						+ "        outline: none;\r\n"
						+ "        text-decoration: none;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      table {\r\n"
						+ "        border-collapse: collapse !important;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      body {\r\n"
						+ "        height: 100% !important;\r\n"
						+ "        margin: 0 !important;\r\n"
						+ "        padding: 0 !important;\r\n"
						+ "        width: 100% !important;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      /* iOS BLUE LINKS */\r\n"
						+ "      a[x-apple-data-detectors] {\r\n"
						+ "        color: inherit !important;\r\n"
						+ "        text-decoration: none !important;\r\n"
						+ "        font-size: inherit !important;\r\n"
						+ "        font-family: inherit !important;\r\n"
						+ "        font-weight: inherit !important;\r\n"
						+ "        line-height: inherit !important;\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      /* MOBILE STYLES */\r\n"
						+ "      @media screen and (max-width: 600px) {\r\n"
						+ "        h1 {\r\n"
						+ "          font-size: 32px !important;\r\n"
						+ "          line-height: 32px !important;\r\n"
						+ "        }\r\n"
						+ "      }\r\n"
						+ "\r\n"
						+ "      /* ANDROID CENTER FIX */\r\n"
						+ "      div[style*=\"margin: 16px 0;\"] {\r\n"
						+ "        margin: 0 !important;\r\n"
						+ "      }\r\n"
						+ "    </style>\r\n"
						+ "  </head>\r\n"
						+ "\r\n"
						+ "  <body\r\n"
						+ "    style=\"\r\n"
						+ "      background-color: #f4f4f4;\r\n"
						+ "      margin: 0 !important;\r\n"
						+ "      padding: 0 !important;\r\n"
						+ "    \"\r\n"
						+ "  >\r\n"
						+ "    <!-- HIDDEN PREHEADER TEXT -->\r\n"
						+ "    <div\r\n"
						+ "      style=\"\r\n"
						+ "        display: none;\r\n"
						+ "        font-size: 1px;\r\n"
						+ "        color: #fefefe;\r\n"
						+ "        line-height: 1px;\r\n"
						+ "        font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "        max-height: 0px;\r\n"
						+ "        max-width: 0px;\r\n"
						+ "        opacity: 0;\r\n"
						+ "        overflow: hidden;\r\n"
						+ "      \"\r\n"
						+ "    ></div>\r\n"
						+ "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n"
						+ "      <!-- LOGO -->\r\n"
						+ "      <tr>\r\n"
						+ "        <td bgcolor=\"#6777ef\" align=\"center\">\r\n"
						+ "          <table\r\n"
						+ "            border=\"0\"\r\n"
						+ "            cellpadding=\"0\"\r\n"
						+ "            cellspacing=\"0\"\r\n"
						+ "            width=\"100%\"\r\n"
						+ "            style=\"max-width: 600px\"\r\n"
						+ "          >\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                align=\"center\"\r\n"
						+ "                valign=\"top\"\r\n"
						+ "                style=\"padding: 40px 10px 40px 10px\"\r\n"
						+ "              ></td>\r\n"
						+ "            </tr>\r\n"
						+ "          </table>\r\n"
						+ "        </td>\r\n"
						+ "      </tr>\r\n"
						+ "      <tr>\r\n"
						+ "        <td bgcolor=\"#6777ef\" align=\"center\" style=\"padding: 0px 10px 0px 10px\">\r\n"
						+ "          <table\r\n"
						+ "            border=\"0\"\r\n"
						+ "            cellpadding=\"0\"\r\n"
						+ "            cellspacing=\"0\"\r\n"
						+ "            width=\"100%\"\r\n"
						+ "            style=\"max-width: 600px\"\r\n"
						+ "          >\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#ffffff\"\r\n"
						+ "                align=\"center\"\r\n"
						+ "                valign=\"top\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 40px 20px 20px 20px;\r\n"
						+ "                  border-radius: 4px 4px 0px 0px;\r\n"
						+ "                  color: #111111;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 48px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  letter-spacing: 4px;\r\n"
						+ "                  line-height: 48px;\r\n"
						+ "                \"\r\n"
						+ "              >\r\n"
						+ "                <h1 style=\"font-size: 48px; font-weight: 400; margin: 2\">\r\n"
						+ 					blogUser.getUsersName()+"先生/小姐 您好:\r\n"
						+ "                  <br/>您投稿的文章: <br/>\""+blogUser.getUsersTitle()+"\"<br/>已審核通過。\r\n"
						+ "                  <br/>於此信通知您，謝謝您的投稿。\r\n"
						+ "                </h1>\r\n"
						+ "                <img\r\n"
						+ "                  src=\" https://img.icons8.com/clouds/100/000000/handshake.png\"\r\n"
						+ "                  width=\"125\"\r\n"
						+ "                  height=\"120\"\r\n"
						+ "                  style=\"display: block; border: 0px\"\r\n"
						+ "                />\r\n"
						+ "              </td>\r\n"
						+ "            </tr>\r\n"
						+ "          </table>\r\n"
						+ "        </td>\r\n"
						+ "      </tr>\r\n"
						+ "      <tr>\r\n"
						+ "        <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px\">\r\n"
						+ "          <table\r\n"
						+ "            border=\"0\"\r\n"
						+ "            cellpadding=\"0\"\r\n"
						+ "            cellspacing=\"0\"\r\n"
						+ "            width=\"100%\"\r\n"
						+ "            style=\"max-width: 600px\"\r\n"
						+ "          >\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#ffffff\"\r\n"
						+ "                align=\"left\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 20px 30px 40px 30px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 18px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 25px;\r\n"
						+ "                \"\r\n"
						+ "              ></td>\r\n"
						+ "            </tr>\r\n"					
						+ "            <!-- COPY -->\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#ffffff\"\r\n"
						+ "                align=\"left\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 0px 30px 0px 30px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 18px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 25px;\r\n"
						+ "                \"\r\n"
						+ "              ></td>\r\n"
						+ "            </tr>\r\n"
						+ "            <!-- COPY -->\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#ffffff\"\r\n"
						+ "                align=\"left\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 20px 30px 20px 30px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 18px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 25px;\r\n"
						+ "                \"\r\n"
						+ "              ></td>\r\n"
						+ "            </tr>\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#ffffff\"\r\n"
						+ "                align=\"left\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 0px 30px 20px 30px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 18px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 25px;\r\n"
						+ "                \"\r\n"
						+ "              ></td>\r\n"
						+ "            </tr>\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#ffffff\"\r\n"
						+ "                align=\"left\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 0px 30px 40px 30px;\r\n"
						+ "                  border-radius: 0px 0px 4px 4px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 18px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 25px;\r\n"
						+ "                \"\r\n"
						+ "              >\r\n"
						+ "                <p style=\"margin: 0\">Cheers,<br />OnlyFriends Team</p>\r\n"
						+ "              </td>\r\n"
						+ "            </tr>\r\n"
						+ "          </table>\r\n"
						+ "        </td>\r\n"
						+ "      </tr>\r\n"
						+ "      <tr>\r\n"
						+ "        <td\r\n"
						+ "          bgcolor=\"#f4f4f4\"\r\n"
						+ "          align=\"center\"\r\n"
						+ "          style=\"padding: 30px 10px 0px 10px\"\r\n"
						+ "        >\r\n"
						+ "          <table\r\n"
						+ "            border=\"0\"\r\n"
						+ "            cellpadding=\"0\"\r\n"
						+ "            cellspacing=\"0\"\r\n"
						+ "            width=\"100%\"\r\n"
						+ "            style=\"max-width: 600px\"\r\n"
						+ "          >\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#FFECD1\"\r\n"
						+ "                align=\"center\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 30px 30px 30px 30px;\r\n"
						+ "                  border-radius: 4px 4px 4px 4px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 18px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 25px;\r\n"
						+ "                \"\r\n"
						+ "              >\r\n"
						+ "                <h2\r\n"
						+ "                  style=\"\r\n"
						+ "                    font-size: 20px;\r\n"
						+ "                    font-weight: 400;\r\n"
						+ "                    color: #111111;\r\n"
						+ "                    margin: 0;\r\n"
						+ "                  \"\r\n"
						+ "                >\r\n"
						+ "                  Need more help?\r\n"
						+ "                </h2>\r\n"
						+ "                <p style=\"margin: 0\">\r\n"
						+ "                  <a href=\"#\" target=\"_blank\" style=\"color: #ffa73b\"\r\n"
						+ "                    >We&rsquo;re here to help you out</a\r\n"
						+ "                  >\r\n"
						+ "                </p>\r\n"
						+ "              </td>\r\n"
						+ "            </tr>\r\n"
						+ "          </table>\r\n"
						+ "        </td>\r\n"
						+ "      </tr>\r\n"
						+ "      <tr>\r\n"
						+ "        <td bgcolor=\"#f4f4f4\" align=\"center\" style=\"padding: 0px 10px 0px 10px\">\r\n"
						+ "          <table\r\n"
						+ "            border=\"0\"\r\n"
						+ "            cellpadding=\"0\"\r\n"
						+ "            cellspacing=\"0\"\r\n"
						+ "            width=\"100%\"\r\n"
						+ "            style=\"max-width: 600px\"\r\n"
						+ "          >\r\n"
						+ "            <tr>\r\n"
						+ "              <td\r\n"
						+ "                bgcolor=\"#f4f4f4\"\r\n"
						+ "                align=\"left\"\r\n"
						+ "                style=\"\r\n"
						+ "                  padding: 0px 30px 30px 30px;\r\n"
						+ "                  color: #666666;\r\n"
						+ "                  font-family: 'Lato', Helvetica, Arial, sans-serif;\r\n"
						+ "                  font-size: 14px;\r\n"
						+ "                  font-weight: 400;\r\n"
						+ "                  line-height: 18px;\r\n"
						+ "                \"\r\n"
						+ "              >\r\n"
						+ "                <br />\r\n"
						+ "              </td>\r\n"
						+ "            </tr>\r\n"
						+ "          </table>\r\n"
						+ "        </td>\r\n"
						+ "      </tr>\r\n"
						+ "    </table>\r\n"
						+ "  </body>\r\n"
						+ "</html>\r\n"
						+ "";
				
				helper.setText(htmlMsg, true); // Use this or above line.
				
				String memberAccount = blogUser.getMemberAccount();
				System.out.println("memberAcc:" + memberAccount);
				Member member=memberService.findByMemberAccount(memberAccount);
				String  memberEmail= member.getMemberEmail();
				
				helper.setTo(memberEmail); //寄給誰
				helper.setSubject("Welcome OnlyFriends");
				helper.setFrom("onlyfriendseeit29@gmail.com");
				sender.send(mimeMessage);
				System.out.println("寄了一封信到"+memberEmail);
				}catch(Exception e) {
					return "寄信失敗";
				}
		} else if (authority.equals("審核通過")) {
			blogUser.setBlogAuthority("待審核");
		}
		bUserService.updateBlogUser(blogUser);		
		
		return "y";
	}
	
	// 管理者文章前端分類頁面
	@GetMapping(path = "/blogofficialmain")
	public String blogEmpMainEntry() {
		return "bloguserspages/empbloglabelpage";
	}
	
	// 管理者文章前端分類頁面搜尋選項(愛情)
	@PostMapping(path = "/queryByBlogType")
	@ResponseBody
	public List<BlogBean> queryByBlogType(@RequestParam(name = "blogType") String blogType, Model m){
		System.out.println("查詢管理者文章分類為:" + blogType);
		
		List<BlogBean> blogList = bService.findByBlogType(blogType);
		return blogList;
	}
	
	// 查看更多按鈕跳轉頁面
	@GetMapping(path = "/blogtypeofficial/{number}")
	public String blogTypeEmpEntry(@PathVariable(name = "number") Integer number, Model m) {
		m.addAttribute("number", number);
		return "bloguserspages/empblogtablepage";
	}
	
	@PostMapping(path = "blogtypejson")
	@ResponseBody
	public Map blogType(@RequestParam(name = "blogtype") String blogType, Model m){
		System.out.println("表格文章分類為:" + blogType);
		Map<String, Object> map = new HashMap<>();
		List<BlogBean> blogList = bService.findByBlogType(blogType);
		map.put("data", blogList);
		return map;
	}
	
}
