package of.UserActivity.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import of.UserActivity.model.UserActivity;
import of.UserActivity.model.UserActivityService;
import of.member.model.Member;
import of.member.model.MemberService;

@Controller
@SessionAttributes(names = { "useractivityList" })
public class UserActivityController {

	@Autowired
	private UserActivity userActivity;

	@Autowired
	private UserActivityService userActivityService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplete;
	@Autowired
	private JavaMailSender sender;

	// 管理員首頁
	@RequestMapping(path = "/emppActivity.Entry")
	public String userActivityEntry(Model model) {
		List<UserActivity> useractivityList = userActivityService.selectAll();
		model.addAttribute("useractivityList", useractivityList);

		return "useractivepage/empactivemgmt2";
	}

	// 管理員資料 json
	@GetMapping(path = "/Alluseractivity")
	@ResponseBody
	public Map AllActivity(Model model) {
		List<UserActivity> activityList = userActivityService.selectAll();
		Map<String, Object> map = new HashMap<>();
		map.put("data", activityList);

		return map;
	}

	// 管理員修改-刪除
	@RequestMapping(path = "/empdeleteactivity.controller", method = RequestMethod.GET)
	public String Delete(@RequestParam(name = "number") int number, Model model) {
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		userActivityService.deleteById(number);
		return "redirect:/emppActivity.Entry";
	}

	// 管理員修改-刪除 json
	@PostMapping(path = "/delete/{number}")
	@ResponseBody
	public String deleteEmployee(@PathVariable("number") String number) {
		System.out.println("number" + number);
		userActivityService.deleteById(Integer.parseInt(number));

		return "yes";
	}

	// 管理員修改開放權限
	@PostMapping(path = "/approve")
	@ResponseBody
	public String approve(@RequestParam(name = "number") int number, Model model) {
		userActivity = userActivityService.select(number);			
		
		String appove = userActivity.getApprove();
				System.out.println(appove);
		if (appove.equals("false")) {
			userActivity.setApprove("true");
			//寄信通知 他活動以開放
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
					+ "                  恭喜~"+userActivity.getActivityname()+"活動!!<br/>已經開放瞜\r\n"
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
			
			String account=userActivity.getMemberAccount();
			Member mm=memberService.findByMemberAccount(account);
			String  mmEmail= mm.getMemberEmail();
			
			helper.setTo(mmEmail); //寄給誰
			helper.setSubject("Welcome OnlyFriends");
			helper.setFrom("onlyfriendseeit29@gmail.com");
			sender.send(mimeMessage);
			
			System.out.println("寄了一封信到"+mmEmail);
			
			}catch(Exception e) {
				return "寄信失敗";
			}

		} else if (appove.equals("true")) {
			userActivity.setApprove("false");
		}
		userActivityService.updata(userActivity);
		System.out.println("afert" + appove);
		return "y";
	}

	// 首頁資料抓取
	@RequestMapping(path = "/useractivityjson", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> userpartymgmtjson(Model m) {
		List<UserActivity> useractivityList = userActivityService.findapporve("true");

		m.addAttribute("useractivityList", useractivityList);

		return useractivityList;
	}

	// 會員參加活動首頁
	@RequestMapping(path = "/useractivity.entry", method = RequestMethod.GET)
	public String userpartymgmtenty(Model m) {
		return "useractivepage/usermgmtjson";
	}
	
	//內頁資料抓取
	@RequestMapping(path = "/userpagejson", method = RequestMethod.POST)
	@ResponseBody
	public UserActivity userpagejson(HttpServletRequest request,Model m) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		UserActivity useractivity = userActivityService.select(number);

		m.addAttribute("useractivity", useractivity);

		return useractivity;
	}
	
	// 會員活動內頁
	@RequestMapping(path = "/useractivity.page", method = RequestMethod.GET)
	public String userpartyenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);

		// 進到內頁後see+1
		userActivity.setSee(userActivity.getSee() + 1);
		userActivityService.updata(userActivity);

		model.addAttribute("userActivity", userActivity);

		return "useractivepage/useractivepage";
	}

	// 已報名的內頁
	@RequestMapping(path = "/useractivity.page2", method = RequestMethod.GET)
	public String userpartyenty2(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);

		return "useractivepage/useractivepage2";
	}

	@RequestMapping(path = "/useractivity.page3", method = RequestMethod.GET)
	public String userpartyenty3(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);

		return "useractivepage/useractivepage3";
	}
	// 會員首頁分類查詢
//	@RequestMapping(path = "/serchtype", method = RequestMethod.POST)
//	@ResponseBody
//	public List<UserActivity> activitytype(Model model, @RequestParam(name = "type") String type) {
//
//		List<UserActivity> useractivityList = userActivityService.findByType(type);
//
//		model.addAttribute("useractivityList", useractivityList);
//
//		return useractivityList;
//	}

	// 會員新增頁面
	@RequestMapping(path = "/activityadd.controller", method = RequestMethod.GET)
	public String processIntoInsert() {
		return "useractivepage/empty";
	}

	// 會員新增活動
	@RequestMapping(path = "/userInsertActivity.controller", method = RequestMethod.POST)
	public String partadd(@RequestParam(name = "cover") MultipartFile cover,
			@RequestParam(name = "Activityname") String Activityname, @RequestParam(name = "type") String type,
			@RequestParam(name = "time") String time, @RequestParam(name = "time_up") String time_up,
			@RequestParam(name = "county") String county, @RequestParam(name = "district") String district,
			@RequestParam(name = "zipcode") String zipcode, @RequestParam(name = "place") String place,

			@RequestParam(name = "Detail") String Detail, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,
			HttpServletRequest request, Model m)
			throws SQLException, IllegalStateException, IOException, NullPointerException {

		UserActivity userActivity = new UserActivity();

		String fileName = cover.getOriginalFilename();
		System.out.println("fulename:" + fileName);
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println("path:" + path);
		String filePath = path + "/" + fileName;
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		System.out.println("step after save");
		userActivity.setCover("images/partyPic/" + fileName);

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		userActivity.setMemberAccount(memberAccount);

		userActivity.setApprove("false");
		userActivity.setActivityname(Activityname);
		userActivity.setType(type);
		userActivity.setTime(time);

		userActivity.setTime_up(time_up);

		userActivity.setCounty(county);
		userActivity.setCondition(condition);
		userActivity.setDistrict(district);
		userActivity.setZipcode(zipcode);
		userActivity.setPlace(place);

		userActivity.setDetail(Detail);
		userActivity.setCondition(condition);
		userActivity.setMan(Integer.parseInt(man));
		userActivity.setWoman(Integer.parseInt(woman));
		userActivity.setTotal((Integer.parseInt(man) + Integer.parseInt(woman))-1);
		userActivity.setSee(0);

		userActivityService.insert(userActivity);

		System.out.println("活動名稱" + Activityname);
		return "redirect:/useractivity.post";
	}

	// 會員修改
	@RequestMapping(path = "/userActivity.up.controller", method = RequestMethod.GET)
	public String partyupenty(HttpServletRequest request, Model model) {
		Integer number = Integer.parseInt(request.getParameter("number"));
		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		return "useractivepage/useractivityup";
	}

	@RequestMapping(path = "/userActivityup.controller", method = RequestMethod.POST)
	public String partup(@RequestParam(name = "cover") MultipartFile cover,
			@RequestParam(name = "activityname") String activityname, @RequestParam(name = "type") String type,
			@RequestParam(name = "time") String time, @RequestParam(name = "time_up") String time_up,
			@RequestParam(name = "county") String county, @RequestParam(name = "district") String district,
			@RequestParam(name = "zipcode") String zipcode, @RequestParam(name = "place") String place,

			@RequestParam(name = "detail") String detail, @RequestParam(name = "condition") String condition,
			@RequestParam(name = "man") String man, @RequestParam(name = "woman") String woman,

			HttpServletRequest request, Model model)
			throws SQLException, IllegalStateException, IOException, NullPointerException {

		String fileName = cover.getOriginalFilename();
		String path = ResourceUtils.getURL("classpath:static/images/partyPic").getPath();
		System.out.println(path);
		String filePath = path + "/" + fileName;
		File saveFile = new File(filePath);
		cover.transferTo(saveFile);
		userActivity.setCover("images/partyPic/" + fileName);

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		userActivity.setMemberAccount(memberAccount);

		userActivity.setActivityname(activityname);
		userActivity.setApprove("false");
		userActivity.setType(type);
		userActivity.setTime(time);
		userActivity.setTime_up(time_up);
		userActivity.setDetail(detail);

		userActivity.setCounty(county);
		userActivity.setCondition(condition);
		userActivity.setDistrict(district);
		userActivity.setZipcode(zipcode);
		userActivity.setPlace(place);

		userActivity.setCondition(condition);
		userActivity.setMan(Integer.parseInt(man));
		userActivity.setWoman(Integer.parseInt(woman));
		userActivity.setTotal(userActivity.getTotal());
		userActivity.setSee(userActivity.getSee());

		userActivityService.updata(userActivity);

		return "redirect:/useractivity.post";
	}

	// 會員刪除自己創辦活動
	@RequestMapping(path = "/deleteactivity.controller", method = RequestMethod.GET)
	public String Deleteactivity(@RequestParam(name = "number") int number, Model model) {

		userActivity = userActivityService.select(number);
		model.addAttribute("userActivity", userActivity);
		userActivityService.deleteById(number);
		return "redirect:/useractivity.post";
	}

	// 會員查看POST首頁
	@RequestMapping(path = "/useractivity.post", method = RequestMethod.GET)
	public String userActivityPost(Model m) {
		return "useractivepage/useractivepost";
	}

	// 會員查看創辦活動
	@RequestMapping(path = "/userpost", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> useractivity(Model model, HttpServletRequest request) {

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();

		List<UserActivity> useractivityList = userActivityService.findByAccount(memberAccount);

		model.addAttribute("useractivityList", useractivityList);

		return useractivityList;
	}

	
	// 會員參加活動
	@RequestMapping(path = "/addactivity", method = RequestMethod.GET)
	public String addactivity(HttpServletRequest request, @RequestParam(name = "number") Integer number) {

		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
//		add member
		Member m2 = memberService.findByMemberAccount(memberAccount);

		// 尋找活動
		UserActivity ua = userActivityService.select(number);
		// 活動總人數-1
		int total = ua.getTotal();
		ua.setTotal(total - 1);

		List<Member> par = ua.getParticipate();
		par.add(m2);
		
		userActivityService.updata(ua);

		return "useractivepage/useractivepost";
	}
	//會員取消參加活動 後 人數要加回去
	@RequestMapping(path = "/cancelactivity", method = RequestMethod.GET)
	public String Cancel(HttpServletRequest request,@RequestParam(name = "number") Integer number) {
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		Member m2 = memberService.findByMemberAccount(memberAccount);
		
		UserActivity ua = userActivityService.select(number);
		
		List<Member> par = ua.getParticipate();

		System.out.println("要被取消的活動"+number);
		System.out.println("要取消的參加者"+memberAccount);

		int tt= ua.getTotal();
		
		ua.removepart(m2);
		ua.setTotal(tt+1);
		userActivityService.updata(ua);

		
		System.out.println("刪除結束");
		return "useractivepage/useractivepost";
	}
	

	// 會員查詢自己參加活動
	@RequestMapping(path = "/AlreadyParticipated", method = RequestMethod.POST)
	@ResponseBody
	public List<UserActivity> userparty(Model model, HttpServletRequest request) {

		// 先找到使用著帳號
		Member m1 = (Member) request.getSession().getAttribute("personalinfo");
		String memberAccount = m1.getMemberAccount();
		System.out.println("會員參加活動");
		//	使用帳號在 participate 找到使用著有參加哪些活動
		List<Integer> activitynumber = userActivityService.findByparticipate(Integer.parseInt(memberAccount));

		System.out.println("number" + activitynumber);
		List<UserActivity> activity = new ArrayList<UserActivity>();

		for (Integer num : activitynumber) {
			UserActivity ac = userActivityService.select(num);
			activity.add(ac);
		}

		return activity;
	}
	
	// 創辦者搜尋以參加的會員資料 
		@RequestMapping(path = "/lo", method = RequestMethod.POST)
		@ResponseBody
		public List<Member> Member(@RequestParam(name = "number") Integer number) {
			List<String> number1 = userActivityService.findthemembers(number);
			List<Member> listmList = new ArrayList<Member>();
			for (String string : number1) {
				Member member = memberService.findByMemberAccount(string);
				System.out.println(member.getMemberName());
				listmList.add(member);
			}
			return listmList;
		}
		
	//活動創辦人資訊
		@RequestMapping(path = "/ao", method = RequestMethod.POST)
		@ResponseBody
		public Member maker(@RequestParam(name = "number") Integer number) {

			UserActivity active = userActivityService.select(number);
			String mm= active.getMemberAccount().toString();
		
			Member member = memberService.findByMemberAccount(mm);
	
			
			return member;
		}

}
