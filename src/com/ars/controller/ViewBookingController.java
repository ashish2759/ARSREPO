package com.ars.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ars.bo.ViewBookingBO;
import com.ars.model.Booking;
import com.ars.model.User;

public class ViewBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewBookingController() {
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userloggedin");
		ViewBookingBO viewBookingBO = new ViewBookingBO();
		List<Booking> availableBookigForUser = viewBookingBO.getAllAvailableBookingsForUser(user.getUserId());
		session.setAttribute("bookinglist", availableBookigForUser);
		RequestDispatcher rd = request.getRequestDispatcher("bookinginfo.jsp");
		rd.forward(request, response);

	}

}
