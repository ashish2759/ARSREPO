package com.ars.model;

public class Flight {
	private String flightNumber;
	private String flightFranchise;
	private double fare;
	private String source;
	private String destination;
	private String departureTime;
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getFlightFranchise() {
		return flightFranchise;
	}
	public void setFlightFranchise(String flightFranchise) {
		this.flightFranchise = flightFranchise;
	}
	public double getFare() {
		return fare;
	}
	public void setFare(double fare) {
		this.fare = fare;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public Flight(String flightNumber, String flightFranchise, double fare, String source, String destination,
			String departureTime) {
		super();
		this.flightNumber = flightNumber;
		this.flightFranchise = flightFranchise;
		this.fare = fare;
		this.source = source;
		this.destination = destination;
		this.departureTime = departureTime;
	}
	public Flight() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Flight [flightNumber=" + flightNumber + ", flightFranchise=" + flightFranchise + ", fare=" + fare
				+ ", source=" + source + ", destination=" + destination + ", departureTime=" + departureTime + "]";
	}
	
	

}
