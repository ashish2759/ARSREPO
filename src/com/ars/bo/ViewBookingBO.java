package com.ars.bo;

import java.util.List;

import com.ars.dao.ViewBookingDAO;
import com.ars.model.Booking;

public class ViewBookingBO {

	public List<Booking> getAllAvailableBookingsForUser(String userId) {
		ViewBookingDAO viewBookingDAO=new ViewBookingDAO();
		return viewBookingDAO.getAllAvailableBookingsForUser(userId);	}

}
