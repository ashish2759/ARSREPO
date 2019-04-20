package com.ars.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ars.bo.SearchFlightBO;
import com.ars.model.Flight;


public class SearchFlightController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public SearchFlightController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String source=request.getParameter("source");
		String destination=request.getParameter("destination");
		int noOfPassengers=Integer.parseInt(request.getParameter("noofpassengers"));
		String departureDate=request.getParameter("departuredate");
		
		SearchFlightBO searchBO=new SearchFlightBO();
		List<Flight> availableFlightList= searchBO.getAvailableFlights(source, destination);
		
		if(availableFlightList!=null && !availableFlightList.isEmpty()) {
			request.removeAttribute("noflightsfound");
			HttpSession session=request.getSession();
			session.setAttribute("availableflights", availableFlightList);
			session.setAttribute("departuredate", departureDate);
			session.setAttribute("noofpassengers", noOfPassengers);
			RequestDispatcher rd=request.getRequestDispatcher("searchresult.jsp");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("noflightsfound", "No Flights Found");
			  RequestDispatcher rd=request.getRequestDispatcher("search.jsp");
			  rd.forward(request, response);
			 
		}
	}

}
