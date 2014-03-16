package image;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.IOUtils;

import com.google.appengine.api.datastore.Blob;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.images.Image;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.Transform;

public class FileUpload extends HttpServlet {

//	private static final Logger log = Logger.getLogger("petteri");

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  boolean allOK = true;
	  try 
	  {
          Entity animal = new Entity("Animal");
          
          // Get the image representation
          ServletFileUpload upload = new ServletFileUpload();
          
       // From the example: http://stackoverflow.com/questions/1513603/how-to-upload-and-store-an-image-with-google-app-engine-java
          FileItemIterator iter = upload.getItemIterator(request);
          // Parse the request
          while (iter.hasNext()) 
          {
              FileItemStream item = iter.next();
              String fieldname = item.getFieldName();
              InputStream stream = item.openStream();
              if (item.isFormField())
              {
                String fieldvalue = Streams.asString(stream, "UTF-8"); 
//                System.out.println("Form field: " + fieldname + " value: " + fieldvalue);
                
				if (fieldname.equals("animalname") )
					animal.setProperty("AnimalName", fieldvalue);
				if (fieldname.equals("identification") )
					animal.setProperty("Identification", fieldvalue);
				if (fieldname.equals("lastseen") )
					animal.setProperty("Lastseen", fieldvalue);
				if (fieldname.equals("ownername") )
					animal.setProperty("Ownername", fieldvalue);
				if (fieldname.equals("tel") )
					animal.setProperty("Tel", fieldvalue);
				if (fieldname.equals("email") )
					animal.setProperty("Email", fieldvalue);
              } 
              else 
              {
	            
                byte[] array = IOUtils.toByteArray(stream);

                if (array != null && array.length > 0)
                {
                    ImagesService imagesService = ImagesServiceFactory.getImagesService();

                    Image oldImage = ImagesServiceFactory.makeImage(array);

                    int h = oldImage.getHeight();
                    int w = oldImage.getWidth();
                    
                    // resize image if too large
                    if (h>200 || w>200)
                    {
	                    double x;
	                    if (h > w)
	                    {
	                    	x = h/200D;
	                    }
	                    else
	                    {
	                    	x = w/200D;
	                    }
	                    Transform resize = ImagesServiceFactory.makeResize((int)(w/x), (int)(h/x));
	                    Image newImage = imagesService.applyTransform(resize, oldImage);
	                    array = newImage.getImageData();
                    }
                }
                else
      				allOK = false;

	            Blob blob = new Blob(array);
   	            animal.setProperty("Image", blob);
              }
          }
          
			//check all mandatory fields are present
			if (animal.getProperty("AnimalName").toString().isEmpty())
				allOK = false;
			if (animal.getProperty("Ownername").toString().isEmpty())
				allOK = false;
			if (animal.getProperty("Tel").toString().isEmpty())
				allOK = false;
			if (animal.getProperty("Email").toString().isEmpty())
				allOK = false;

			if (allOK)
			{
				// save to datastore
				DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
				datastore.put(animal);
			}

	  	}
	  	catch (FileUploadException e) 
	  	{
	  		allOK = false;
	    }

		// respond to query
		if (allOK)
		{
//			System.out.println("All OK");

			request.setCharacterEncoding("UTF-8");
			
			RequestDispatcher disp;
			disp = getServletContext().getRequestDispatcher("/image.jsp");
			if (disp != null)
				disp.forward(request, response);
		}
		else
		{
//			System.out.println("Error");
			request.setAttribute("error", "Please check required fields before posting.");
			request.setCharacterEncoding("UTF-8");

			RequestDispatcher disp;
			disp = getServletContext().getRequestDispatcher("/image.jsp");

			if (disp != null)
				disp.forward(request, response);
		}
  }
}