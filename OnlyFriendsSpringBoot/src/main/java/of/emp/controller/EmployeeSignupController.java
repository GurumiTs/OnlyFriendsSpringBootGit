package of.emp.controller;

import java.io.File;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.common.util.GetRandomPwd;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;

@Controller
public class EmployeeSignupController {

	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private UsersService usersService;
	@Autowired
	private Users users;
	@Autowired
	private JavaMailSender sender;

	@RequestMapping(path = "/empsignup", method = RequestMethod.GET)
	public String signupempEntry() {
		return "employeepages/empsignup";
	}

	@RequestMapping(path = "/emailverifysuccess", method = RequestMethod.GET)
	public String emailverifysuccess() {
		return "emailverifysuccess";
	}

	@RequestMapping(path = "/emailverifyfailed", method = RequestMethod.GET)
	public String emailverifyfailed() {
		return "emailverifyfailed";
	}

	@RequestMapping(path = "/empsignup.controller", method = RequestMethod.POST)
	public String signupEmployee(@RequestParam(name = "empEmail", required = false) String empEmail,
			@RequestParam(name = "empAcc", required = false) String empAcc,
			@RequestParam(name = "empName", required = false) String empName,
			@RequestParam(name = "empPwd1", required = false) String empPwd1,
			@RequestParam(name = "empBday", required = false) String empBday,
			@RequestParam(name = "empPic", required = false) MultipartFile multipartFile,
			@RequestParam(name = "empAddress", required = false) String empAddress,
			@RequestParam(name = "county", required = false) String county,
			@RequestParam(name = "district", required = false) String district,
			@RequestParam(name = "zipcode", required = false) String zipcode,
			@RequestParam(name = "empAuth", required = false) int empAuth,
			@RequestParam(name = "empDeptNum", required = false) int empDeptNum, HttpServletRequest request,
			Model model) {

		try {
			String empPassword = BCrypt.hashpw(empPwd1, BCrypt.gensalt());
			employee.setEmpEmail(empEmail);
			employee.setEmpAccount(empAcc);
			employee.setEmpName(empName);
			employee.setEmpBday(empBday);
			employee.setEmpAddress(empAddress);
			employee.setEmpCounty(county);
			employee.setEmpDistrict(district);
			employee.setEmpZipcode(zipcode);
			employee.setEmpAuthority(empAuth);
			employee.setDeptNum(empDeptNum);
			employee.setEmpCreateTime(System.currentTimeMillis());

			// pic
			String fileName = multipartFile.getOriginalFilename();	
			String path = ResourceUtils.getURL("classpath:static/images/empPic").getPath();
			String filePath =  path+ "/" + fileName;
			File saveFile = new File(filePath);
			multipartFile.transferTo(saveFile);
			employee.setEmpPic("images/empPic/" + fileName);
			
			
			users.setUsersEmail(empEmail);
			users.setUsersPassword(empPassword);
			users.setUsersRole("employee");
			usersService.insert(users);
			
			empService.insert(employee);

			
			//System.out.println("signupmail" + empEmail);
			request.setAttribute("email", empEmail);
			return "forward:/signupmail.controller";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "signup employee failed");
			return "employeepages/empsignup";
		}

	}

	@RequestMapping(path = "/signupmail.controller", method = RequestMethod.POST)
	public String sendSignupMail(HttpServletRequest request, Model model) {
		try {
			String email = (String) request.getAttribute("email");
			Employee employee = empService.findByEmpEmail(email);
			String empEmailCheckNum = GetRandomPwd.getRandomPassword();
			employee.setEmpEmailCheckNum(empEmailCheckNum);
			empService.update(employee);
			//SimpleMailMessage mail = new SimpleMailMessage();
			//mail.setTo(email);
			//mail.setFrom("onlyfriendseeit29@gmail.com");
			//mail.setSubject("Verify Account");
			//mail.setText("Click to verify:\n" + "http://localhost:8080/OnlyFriends/signupmailcheck" + "?email=" + email
			//		+ "&checknum=" + empEmailCheckNum);
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
					+ "                  Welcome!\r\n"
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
					+ "            <tr>\r\n"
					+ "              <td bgcolor=\"#ffffff\" align=\"left\">\r\n"
					+ "                <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "                  <tr>\r\n"
					+ "                    <td\r\n"
					+ "                      bgcolor=\"#ffffff\"\r\n"
					+ "                      align=\"center\"\r\n"
					+ "                      style=\"padding: 20px 30px 60px 30px\"\r\n"
					+ "                    >\r\n"
					+ "                      <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
					+ "                        <tr>\r\n"
					+ "                          <td\r\n"
					+ "                            align=\"center\"\r\n"
					+ "                            style=\"border-radius: 3px\"\r\n"
					+ "                            bgcolor=\"#FFA73B\"\r\n"
					+ "                          >\r\n"
					+ "                            <a\r\n"
					+ "                              href=\""+"http://localhost:8080/OnlyFriends/signupmailcheck?email="+email+"&checknum="+empEmailCheckNum+"\"\r\n"
					+ "                              target=\"_blank\"\r\n"
					+ "                              style=\"\r\n"
					+ "                                font-size: 20px;\r\n"
					+ "                                font-family: Helvetica, Arial, sans-serif;\r\n"
					+ "                                color: #ffffff;\r\n"
					+ "                                text-decoration: none;\r\n"
					+ "                                color: #ffffff;\r\n"
					+ "                                text-decoration: none;\r\n"
					+ "                                padding: 15px 25px;\r\n"
					+ "                                border-radius: 2px;\r\n"
					+ "                                border: 1px solid #ffa73b;\r\n"
					+ "                                display: inline-block;\r\n"
					+ "                              \"\r\n"
					+ "                              >Click To Verify</a\r\n"
					+ "                            >\r\n"
					+ "                          </td>\r\n"
					+ "                        </tr>\r\n"
					+ "                      </table>\r\n"
					+ "                    </td>\r\n"
					+ "                  </tr>\r\n"
					+ "                </table>\r\n"
					+ "              </td>\r\n"
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
			helper.setTo(email);
			helper.setSubject("Welcome OnlyFriends");
			helper.setFrom("onlyfriendseeit29@gmail.com");
			sender.send(mimeMessage);
			model.addAttribute("successMsg", "sending verify mail success!");
			return "employeepages/empsignup";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "sending verify mail failed!");
			return "employeepages/empsignup";
		}

	}

	@RequestMapping(path = "signupmailcheck", method = RequestMethod.GET)
	public String checkAccountMail(HttpServletRequest request) {
		String email = request.getParameter("email");
		String empEmailCheckNum = request.getParameter("checknum");
		System.out.println(email);
		System.out.println(empEmailCheckNum);
		Employee employee = empService.findByEmpEmail(email);
		String checkNum = employee.getEmpEmailCheckNum();
		if (checkNum.equals(empEmailCheckNum)) {
			employee.setEmpEmailCheck(1);
			empService.update(employee);
			return "commonpages/emailverifysuccess";
		}

		return "commonpages/emailverifyfailed";
	}

}
