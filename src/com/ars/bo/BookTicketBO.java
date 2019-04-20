package com.ars.bo;

import com.ars.dao.BookTicketDAO;
import com.ars.model.Booking;

public class BookTicketBO {

	public int saveBooking(Booking booking) {
		
		BookTicketDAO bookingDAO=new BookTicketDAO();
		return bookingDAO.saveBooking(booking);
	}

}
