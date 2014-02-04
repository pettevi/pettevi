package forwarding;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServerForwarding extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
		System.out.println("doGet"); 
		System.out.println(request); 
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse response)
			throws IOException, ServletException {
		
		String redirection = req.getParameter("redirection");
		String clienterror = req.getParameter("clienterror");
		String servererror = req.getParameter("servererror");

//		System.out.println("redirection:" + redirection); 
//		System.out.println("clienterror:" + clienterror); 
//		System.out.println("serverterror:" + servererror); 
		
		Enumeration<String> aNames = req.getAttributeNames();
		while (aNames.hasMoreElements())
		{
			String s = aNames.nextElement();
			System.out.println("Attributes: " + s + " " + req.getAttribute(s)); 
		} 

		Enumeration<String> pNames = req.getParameterNames();
		while (pNames.hasMoreElements()) 
		{
			String s = pNames.nextElement();
			System.out.println("Parameters: " + s + " " + req.getParameter(s)); 
		} 

		if ( redirection != null )
		{
			int redirectioncode = Integer.parseInt(redirection);
			response.setStatus(redirectioncode);
	 		response.setHeader( "Location", "http://hello-pettevi.appspot.com" );
	 		response.setHeader( "Connection", "close" );
//	 		response.sendRedirect("/forwarding.jsp");

//	 		RequestDispatcher disp;
//			disp = getServletContext().getRequestDispatcher("/forwarding.jsp");
//			if (disp != null)
//				disp.forward(req, response);

		}
		else if ( clienterror != null )
		{
			int code = Integer.parseInt(clienterror);
			response.sendError(code, "This is test error (URL:" + req.getRequestURL() + " IP:" + req.getLocalAddr() + " Protocol:" + req.getProtocol() + ")");
		}
		else if ( servererror != null )
		{
			int code = Integer.parseInt(servererror);
			response.sendError(code, "This is test error (URL:" + req.getRequestURL() + " IP:" + req.getLocalAddr() + " Protocol:" + req.getProtocol() + ")");
		}
	}
}