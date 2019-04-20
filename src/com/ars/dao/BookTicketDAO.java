package com.ars.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ars.constants.QueryConstants;
import com.ars.model.Booking;
import com.ars.util.DBUtil;

public class BookTicketDAO {

	public int saveBooking(Booking booking) {
		Connection con=DBUtil.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(QueryConstants.SAVEBOOKING, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, booking.getUserId());
			ps.setString(2, booking.getFlight().getFlightNumber());
			ps.setDouble(3, booking.getTotalFare());
			ps.setString(4, booking.getDepartureDate());
			ps.setInt(5, booking.getNoOfPassengers());
			int bookingId=0;
			int count=ps.executeUpdate();
			if(count>0)
			{
				ResultSet rs=ps.getGeneratedKeys();
				if(rs.next())
					bookingId=rs.getInt(1);
			}
			return bookingId;
		} catch (SQLException e) { return 0;}
	}

}
