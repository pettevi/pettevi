package processcontact;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Processcontact extends HttpServlet {
	    @Override
	    public void doPost(HttpServletRequest req, HttpServletResponse resp)
	                throws IOException {

	        String name = req.getParameter("name");
	        String email = req.getParameter("email");
	        String message = req.getParameter("message");

	        Properties props = new Properties();
	        Session session = Session.getDefaultInstance(props, null);
	        
	        try {
	            Message msg = new MimeMessage(session);
	            msg.setFrom(new InternetAddress("pete.hamalainen@gmail.com", "Petteri Hamalainen"));
	            msg.addRecipient(Message.RecipientType.TO,
	             new InternetAddress("petteri_hamalainen@yahoo.com", ""));
	            msg.setSubject("Contact request from website");
	            msg.setText(message + "\n\nName: " + name + "\nEmail: " + email);
	            Transport.send(msg);

	        } catch (AddressException e) {
	            // ...
	        } catch (MessagingException e) {
	            // ...
	        }
	        
	        resp.sendRedirect("/index.jsp");
	    }
	}