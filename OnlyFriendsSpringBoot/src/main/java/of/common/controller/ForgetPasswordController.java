package of.common.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import of.common.model.Users;
import of.common.model.UsersService;
import of.common.util.BCrypt;
import of.common.util.GetRandomPwd;
import of.emp.model.Employee;
import of.emp.model.EmployeeService;

@Controller
@SessionAttributes(names = { "successMsg", "errorMsg" })
public class ForgetPasswordController {
	@Autowired
	private EmployeeService empService;
	@Autowired
	private Employee employee;
	@Autowired
	private Users users;
	@Autowired
	private UsersService usersService;
	@Autowired
	private JavaMailSender sender;

	@RequestMapping(path = "/sendingnewpassword", method = RequestMethod.GET)
	public String forgetpasswordEntry() {
		return "commonpages/sendingnewpassword";
	}
	
	@RequestMapping(path = "/setnewpasswordform", method = RequestMethod.GET)
	public String setNewPasswordForm() {
		return "commonpages/setnewpasswordform";
	}

	@RequestMapping(path = "/sendingnewpasswordform.controller", method = RequestMethod.POST)
	public String sendingNewPasswordFormController(HttpServletRequest request) {
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String scode = (String) request.getSession().getAttribute("code");
		if (code.equals(scode)) {
			request.setAttribute("email", email);
			return "forward:/sendingnewpasswordmail";
		}
		return "login";
	}

	@RequestMapping(path = "/sendingnewpasswordmail", method = RequestMethod.POST)
	public String sendingNewPasswordMail(HttpServletRequest request,Model model) {

		try {
			String email = (String) request.getAttribute("email");
			Users users = usersService.findByEmail(email);
			String randomPassword = GetRandomPwd.getRandomPassword();
			String hashRandomPassword = BCrypt.hashpw(randomPassword, BCrypt.gensalt());
			users.setUsersPassword(hashRandomPassword);
			usersService.update(users);
		//	SimpleMailMessage mail = new SimpleMailMessage();
		//	mail.setTo(email);
		//	mail.setFrom("onlyfriendseeit29@gmail.com");
		//	mail.setSubject("New Password");
		//	mail.setText("NewPassword:" + randomPassword + "\n" + "http://localhost:8080/OnlyFriends/setnewpasswordform"
		//			+ "?email=" + email);
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
					+ "                  Here you go!\r\n"
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
					+ "                              href=\""+"http://localhost:8080/OnlyFriends/setnewpasswordform?email="+email+"\"\r\n"
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
					+ "                              >Reset Password</a\r\n"
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
					+ "              >\r\n"
					+ "                <p>New Password:<span style=\"color: red\">"+randomPassword+"</span></p>\r\n"
					+ "                <p style=\"margin: 0\">\r\n"
					+ "                  If you have any questions, just reply to this email—we're\r\n"
					+ "                  always happy to help out.\r\n"
					+ "                </p>\r\n"
					+ "              </td>\r\n"
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
			//mimeMessage.setContent(htmlMsg, "text/html"); /** Use this or below line **/
			helper.setText(htmlMsg, true); // Use this or above line.
			helper.setTo(email);
			helper.setSubject("New Password");
			helper.setFrom("onlyfriendseeit29@gmail.com");
			sender.send(mimeMessage);
			return "commonpages/sendingnewpasswordsuccess";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "send new password failed");
			return "login";
		
		}

	}
	
	@RequestMapping(path="setnewpassword.controller",method=RequestMethod.POST)
	public String setNewPasswordFormController(HttpServletRequest request,Model model) {

		String email = request.getParameter("email");
		System.out.println("change password:"+email);
		String oldPassword = request.getParameter("oldPwd");
		String newPassword = request.getParameter("updatePwd1");
		
		Users users = usersService.findByEmail(email);
		String oldHashPassword = users.getUsersPassword();
		boolean checkPasswordStatus = BCrypt.checkpw(oldPassword, oldHashPassword);
		if (checkPasswordStatus == true) {
			String newHashPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
			users.setUsersPassword(newHashPassword);
			usersService.update(users);
			model.addAttribute("successMsg", "update new password success");
			return "index" ;
		}
		model.addAttribute("errorMsg", "update new password failed");
		return "index";
	}

}
