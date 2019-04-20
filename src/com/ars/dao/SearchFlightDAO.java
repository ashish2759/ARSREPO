package com.ars.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ars.constants.QueryConstants;
import com.ars.model.Flight;
import com.ars.util.DBUtil;

public class SearchFlightDAO {

	public List<Flight> getAvailableFlights(String source, String destination) {
		// TODO Auto-generated method stub
		Connection con=DBUtil.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(QueryConstants.GETFLIGHTDETAILS);
			ps.setString(1, source);
			ps.setString(2, destination);
			List<Flight> flightList=new ArrayList<Flight>();
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Flight flight=new Flight();
				flight.setFlightNumber(rs.getString(1));
				flight.setFlightFranchise(rs.getString(2));
				flight.setFare(rs.getDouble(3));
				flight.setDepartureTime(rs.getString(4));
				flight.setSource(source);
				flight.setDestination(destination);
				flightList.add(flight);
			}
			return flightList;
		} catch (SQLException e) {
			return null;
		}
		
	}

}
