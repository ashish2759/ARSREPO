package com.ars.constants;

public class QueryConstants {

	public static final String VALIDATEUSER = "select userid, password from user where userid=?";
	public static final String GETUSERDETAILS = "select * from user where userid=? and password=?";
	public static final String GETFLIGHTDETAILS = "select f.flight_number, flight_franchise, fare, departure_time from flights f, flight_details fd where f.flight_number=fd.flight_number and fd.source=? and fd.destination=?";
	public static final String SAVEBOOKING = "insert into booking (userid, flight_number,total_fare,date_of_journey, no_of_passengers) values(?, ?, ?, ?, ?)";
	public static final String GETAVAILABLEBOOKINGS = "select booking_id, b.flight_number, f.flight_franchise, fd.source, fd.destination, total_fare,date_of_journey, f.departure_time, no_of_passengers from booking b, flights f, flight_details fd where b.userid=? and b.flight_number=f.flight_number and b.flight_number=fd.flight_number";
	
}
