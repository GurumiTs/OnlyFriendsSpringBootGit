package of.common.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import java.util.stream.Collectors;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/VerifyImg")
public class VerifyImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public VerifyImg() {
        super();
       
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("image/jpeg");

        String passwd = new Random().ints(0, 10)
                                    .limit(4)
                                    .mapToObj(String::valueOf)
                                    .collect(Collectors.joining());

        // 將產生的驗證碼存在session比對
        request.getSession().setAttribute("code",passwd);
        ImageIO.write(passwordImage(passwd), "JPG", response.getOutputStream());
       // System.out.println(passwd);
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  private BufferedImage passwordImage(String password) throws IOException {
	        BufferedImage bufferedImage =
	                 new BufferedImage(70, 30, BufferedImage.TYPE_INT_RGB);
	        Graphics g = bufferedImage.getGraphics();
	        g.setColor(Color.WHITE);
	        g.setFont(new Font("標楷體", Font.BOLD, 20));
	        g.drawString(password, 10, 15);
	        return bufferedImage;
	    }

}
