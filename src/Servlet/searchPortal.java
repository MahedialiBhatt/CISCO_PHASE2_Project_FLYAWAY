package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.searchDao;

@WebServlet("/search")
public class searchPortal extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 searchDao.date = request.getParameter("date");
	        searchDao.source = request.getParameter("source");
	        searchDao.destination = request.getParameter("destination");
	      

	        if (searchDao.date.isEmpty()) 
	        {
	            PrintWriter out = response.getWriter();
	            out.println("Please enter a valid date");
	        }
	        else 
	        {
	            response.sendRedirect("searchResults.jsp");
	        }
	    }

	    public String getDay(String dateInp) 
	    {
	        LocalDate dt = LocalDate.parse(dateInp);
	        return dt.getDayOfWeek().toString();
	    }	
	}


