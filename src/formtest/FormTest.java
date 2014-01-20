package formtest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class FormTest extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		printData(req, resp);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		printData(req, resp);
		
		RequestDispatcher disp;
		disp = getServletContext().getRequestDispatcher("/formtest/formtest.jsp");
		req.setAttribute("testattribute", "Test attrib from .jsp");

		if (disp != null)
			disp.forward(req, resp);
		else
			resp.getWriter().println("RequestDispatcher is NULL");
	}
	
	private void printData(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		String q = req.getParameter("q");
		resp.getWriter().println("q: " + q);
		resp.getWriter().println("getLocalAddr: " + req.getLocalAddr());
		resp.getWriter().println("getLocalName: " + req.getLocalName());
		resp.getWriter().println("getContextPath: " + req.getContextPath());
		resp.getWriter().println("getMethod: " + req.getMethod());
		resp.getWriter().println("getPathInfo: " + req.getPathInfo());
		resp.getWriter().println("getQueryString: " + req.getQueryString());
		
	}
}
