package student;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class indentity extends HttpServlet {

	public static final char[] CHARS = { '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'a', 'f', 'k', 'r', 'y' };

	public static Random random = new Random();

	public static String getRandomStriong() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 4; i++) {
			sb.append(CHARS[random.nextInt(CHARS.length)]);
		}
		return sb.toString();
	}
	
	public static Color getRandomColor(){
		return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
	}
	
	public static Color getOtherColor(Color c){
		return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//request.setCharacterEncoding("utf-8");
		response.setContentType("image/jpeg");
		String randomString  = getRandomStriong();
		//this.log(randomString);
		request.getSession(false).setAttribute("randomString", randomString);
		int width = 100;
		int heigth = 30;
		
		Color color = getRandomColor();
		Color otherColor = getOtherColor(color);
		
		BufferedImage bi = new BufferedImage(width,heigth,BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bi.createGraphics();
		g.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));
		g.setColor(color);
		g.fillRect(0,0,width,heigth);
		g.setColor(otherColor);
		g.drawString(randomString, 18, 20);
		
		for(int i=0;i<random.nextInt(100);i++){
			g.drawRect(random.nextInt(width), random.nextInt(heigth), 1, 1);
		}
		
		ServletOutputStream out = response.getOutputStream();
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(bi);
		out.flush();
	
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}

