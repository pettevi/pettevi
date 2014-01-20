package rot13;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Rot13 extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {

		String inputString = req.getParameter("text");
		
		inputString = replace(inputString);

		req.setAttribute("usertext", inputString);

		RequestDispatcher disp;
		disp = getServletContext().getRequestDispatcher("/rot13/rot13.jsp");

		if (disp != null)
			disp.forward(req, resp);
	}
	
	private String replace(String s)
	{
		char [] original = s.toCharArray();
		char [] rot13 = s.toCharArray();
		
		for (int i=0; i<s.length(); i++)
		{
			rot13[i] = change(original[i]);
		}

		return String.copyValueOf(rot13);
	}
	
	private char change(char c)
	{
		if (c == 'a')
			c = 'n';
		else if (c == 'b')
			c = 'o';
		else if (c == 'c')
			c = 'p';
		else if (c == 'd')
			c = 'q';
		else if (c == 'e')
			c = 'r';
		else if (c == 'f')
			c = 's';
		else if (c == 'g')
			c = 't';
		else if (c == 'h')
			c = 'u';
		else if (c == 'i')
			c = 'v';
		else if (c == 'j')
			c = 'w';
		else if (c == 'k')
			c = 'x';
		else if (c == 'l')
			c = 'y';
		else if (c == 'm')
			c = 'z';
		else if (c == 'n')
			c = 'a';
		else if (c == 'o')
			c = 'b';
		else if (c == 'p')
			c = 'c';
		else if (c == 'q')
			c = 'd';
		else if (c == 'r')
			c = 'e';
		else if (c == 's')
			c = 'f';
		else if (c == 't')
			c = 'g';
		else if (c == 'u')
			c = 'h';
		else if (c == 'v')
			c = 'i';
		else if (c == 'w')
			c = 'j';
		else if (c == 'x')
			c = 'k';
		else if (c == 'y')
			c = 'l';
		else if (c == 'z')
			c = 'm';
		else if (c == 'A')
			c = 'N';
		else if (c == 'B')
			c = 'O';
		else if (c == 'C')
			c = 'P';
		else if (c == 'D')
			c = 'Q';
		else if (c == 'E')
			c = 'R';
		else if (c == 'F')
			c = 'S';
		else if (c == 'G')
			c = 'T';
		else if (c == 'H')
			c = 'U';
		else if (c == 'I')
			c = 'V';
		else if (c == 'J')
			c = 'W';
		else if (c == 'K')
			c = 'X';
		else if (c == 'L')
			c = 'Y';
		else if (c == 'M')
			c = 'Z';
		else if (c == 'N')
			c = 'A';
		else if (c == 'O')
			c = 'B';
		else if (c == 'P')
			c = 'C';
		else if (c == 'Q')
			c = 'D';
		else if (c == 'R')
			c = 'E';
		else if (c == 'S')
			c = 'F';
		else if (c == 'T')
			c = 'G';
		else if (c == 'U')
			c = 'H';
		else if (c == 'V')
			c = 'I';
		else if (c == 'W')
			c = 'J';
		else if (c == 'X')
			c = 'K';
		else if (c == 'Y')
			c = 'L';
		else if (c == 'Z')
			c = 'M';
		
		return c;
	}
	
}
