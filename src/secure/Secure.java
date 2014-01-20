package secure;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class Secure extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		doPost(req,resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {	
	
	      UserService userService = UserServiceFactory.getUserService();

	        String thisURL = req.getRequestURI();
//dont workki
	        resp.setContentType("text/html");
	        if (req.getUserPrincipal() != null) {
	            resp.getWriter().println("<p>Hello, " +
	                                     req.getUserPrincipal().getName() +
	                                     "!  You can <a href=\"" +
	                                     userService.createLogoutURL(thisURL) +
	                                     "\">sign out</a>.</p>");
	        } else {
	            resp.getWriter().println("<p>Please <a href=\"" +
	                                     userService.createLoginURL(thisURL) +
	                                     "\">sign in</a>.</p>");
	        }
	    
	}
}
