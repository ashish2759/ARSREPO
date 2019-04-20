package com.ars.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ars.constants.QueryConstants;
import com.ars.model.Booking;
import com.ars.model.Flight;
import com.ars.util.DBUtil;

public class ViewBookingDAO {

	public List<Booking> getAllAvailableBookingsForUser(String userId) {
		Connection con=DBUtil.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(QueryConstants.GETAVAILABLEBOOKINGS);
			ps.setString(1, userId);
			ResultSet rs=ps.executeQuery();
			List<Booking> bookingList=new ArrayList<Booking>();
			while(rs.next())
			{
				Booking booking=new Booking();
				Flight flight=new Flight();
				booking.setBookingId(rs.getInt(1));
				flight.setFlightNumber(rs.getString(2));
				flight.setFlightFranchise(rs.getString(3));
				flight.setSource(rs.getString(4));
				flight.setDestination(rs.getString(5));
				
				booking.setTotalFare(rs.getDouble(6));
				booking.setDepartureDate(rs.getString(7));
				flight.setDepartureTime(rs.getString(8));
				booking.setNoOfPassengers(rs.getInt(9));
				booking.setFlight(flight);
				bookingList.add(booking);
			}
			return bookingList;
		} catch (SQLException e) {
			return null;
		}
	}

}
