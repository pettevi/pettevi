package signup;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Signup extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		boolean allOK = true;
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String verify = req.getParameter("verify");
		String email = req.getParameter("email");

		if (!username.matches("^[a-zA-Z0-9_-]{3,20}$"))
		{
			String usernameerror = "That's not a valid username.";
			req.setAttribute("usernameerror", usernameerror);
			allOK = false;
		}
		if (!password.matches("^.{3,20}$"))
		{
			String passworderror = "That wasn't a valid password.";
			req.setAttribute("passworderror", passworderror);
			allOK = false;
		}
		if (!email.isEmpty() && !email.matches("^[\\S]+@[\\S]+\\.[\\S]+$"))
		{
			String emailerror = "That's not a valid email.";
			req.setAttribute("emailerror", emailerror);
			allOK = false;
		}
		if (password.compareTo(verify) != 0)
		{
			String verifyerror = "Your password didn't match.";
			req.setAttribute("verifyerror", verifyerror);
			allOK = false;
		}


		if (allOK)
		{
			resp.sendRedirect("/signupwelcome.jsp?username=" + username);
		}
		else
		{
			RequestDispatcher disp;
			disp = getServletContext().getRequestDispatcher("/signup.jsp");
			if (disp != null)
				disp.forward(req, resp);
		}
		
	}

}
