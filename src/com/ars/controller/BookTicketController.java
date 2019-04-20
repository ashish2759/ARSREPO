package com.ars.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ars.bo.BookTicketBO;
import com.ars.model.Booking;
import com.ars.model.Flight;
import com.ars.model.User;
import com.ars.util.Utility;

public class BookTicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookTicketController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		performTask(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		performTask(request, response);
	}

	private void performTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int number = Integer.parseInt(request.getParameter("no"));
	

		HttpSession session = request.getSession();
		List<Flight> flightList = (List<Flight>) session.getAttribute("availableflights");
		User user = (User) session.getAttribute("userloggedin");
		String departureDate = (String) session.getAttribute("departuredate");
		int noOfPassengers = (int) session.getAttribute("noofpassengers");

		Flight flightSelected = flightList.get(number);

		Booking booking = new Booking();
		booking.setUserId(user.getUserId());
		booking.setFlight(flightSelected);
		booking.setDepartureDate(departureDate);
		booking.setNoOfPassengers(noOfPassengers);
		double gstPrice = Utility.calculateGST(noOfPassengers, flightSelected.getFare());
		booking.setGstPrice(gstPrice);
		double totalFare = Utility.calculateTotalFare(gstPrice, noOfPassengers, flightSelected.getFare());
		booking.setTotalFare(totalFare);
		
		BookTicketBO bookingBO = new BookTicketBO();
		int bookingId = bookingBO.saveBooking(booking);
		booking.setBookingId(bookingId);

		
		session.setAttribute("booking", booking);
		RequestDispatcher rd = request.getRequestDispatcher("bookingconfirmation.jsp");
		rd.forward(request, response);
	}
}
