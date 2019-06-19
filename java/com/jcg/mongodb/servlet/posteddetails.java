package com.jcg.mongodb.servlet;


import java.io.IOException;
import org.apache.log4j.xml.DOMConfigurator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.bson.BSONObject;

import org.bson.conversions.Bson;
import org.bson.Document;

import com.google.gson.Gson;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.search.servlet.Search;
/**
 * Servlet implementation class posteddetails
 */
@WebServlet("/posteddetails")
public class posteddetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static Logger log = Logger.getLogger(Search.class);
	Object name, Dob, qualif, jobi, exp, stat, cont;
    public void init(ServletConfig config) throws ServletException {
	    super.init(config);
	    String initial = config.getInitParameter("list");
	    try {
	       Integer.parseInt(initial);
	    }
	    catch (NumberFormatException e) {
	    log.info(e);
	    }
	  }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DOMConfigurator.configure("log4j.xml");
		MongoClient mongo = new MongoClient("localhost", 27017);

		log.debug("Connected to the database successfully");
		// Accessing the database
		MongoDatabase database = mongo.getDatabase("Jobseeker");

		// Retrieving a collection
		MongoCollection<Document> coll = database.getCollection("fusteps");
		log.debug("Collection myCollection selected successfully");

		log.debug("Collection established");
		 resp.setIntHeader("Search", 6);
		
		try {
			String keytext = req.getParameter("keytext");
			
			log.debug( " Keyword gaven is   " + keytext);
			log.debug("Parameters from jsp to servlet assigned");
			List<Search> documents = new ArrayList<>();
			ServletContext sc =getServletContext();
				 FindIterable<Document> fi = coll.find(new Document("$text", new Document("$search", keytext)));
		         MongoCursor<Document> cursor= fi.iterator();
					log.debug("Document iterated");
					
			List<Document> documen = new ArrayList<Document>();
			while (cursor.hasNext()) {
				// log.info(cursor.next().toJson());
				Search obj=new Search();
				Document obj2 = cursor.next();
				name = obj2.get("name");
				((Search) obj).setName(name);
				Dob = obj2.get("DOB");
				((Search) obj).setDob(Dob);
				qualif =obj2.get("qual");
				((Search) obj).setQualif(qualif);
				jobi = obj2.get("job_interests");
				((Search) obj).setJobi(jobi);
				exp = obj2.get("experience");
				((Search) obj).setExp(exp);
				stat = obj2.get("state");
				((Search) obj).setStat(stat);
				cont =  obj2.get("country");
				((Search) obj).setCont(cont);
				Gson gson = new Gson();
				 Document docum = Document.parse(gson.toJson(obj));
				documen.add(docum);
				documents.add(obj);
			}
			log.info("Inside the DB object");
			sc.setAttribute("list1", documen);
			req.setAttribute("list", documents);
			req.getRequestDispatcher("searchdemo.jsp").forward(req, resp);	
			cursor.close();
			
		} catch (Exception e) {
			log.debug(e);
		}
	}

}
