package com.ars.model;

public class Booking {
	private int bookingId;
	private String userId;
	private Flight flight;
	private String departureDate;
	private int noOfPassengers;
	private double gstPrice;
	private double totalFare;
	public int getBookingId() {
		return bookingId;
	}
	
	public double getGstPrice() {
		return gstPrice;
	}

	public void setGstPrice(double gstPrice) {
		this.gstPrice = gstPrice;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Flight getFlight() {
		return flight;
	}
	public void setFlight(Flight flight) {
		this.flight = flight;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public int getNoOfPassengers() {
		return noOfPassengers;
	}
	public void setNoOfPassengers(int noOfPassengers) {
		this.noOfPassengers = noOfPassengers;
	}
	public double getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(double totalFare) {
		this.totalFare = totalFare;
	}
	
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Booking(int bookingId, String userId, Flight flight, String departureDate, int noOfPassengers,
			double gstPrice, double totalFare) {
		super();
		this.bookingId = bookingId;
		this.userId = userId;
		this.flight = flight;
		this.departureDate = departureDate;
		this.noOfPassengers = noOfPassengers;
		this.gstPrice = gstPrice;
		this.totalFare = totalFare;
	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", userId=" + userId + ", flight=" + flight + ", departureDate="
				+ departureDate + ", noOfPassengers=" + noOfPassengers + ", gstPrice=" + gstPrice + ", totalFare="
				+ totalFare + "]";
	}
	

}
