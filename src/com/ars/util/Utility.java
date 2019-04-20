package com.ars.util;

public class Utility {

	public static double calculateGST(int noOfPassengers, double fare) {
		double gstPrice= (noOfPassengers*fare)*0.05;
		return gstPrice;
	}

	public static double calculateTotalFare(double gstPrice, int noOfPassengers, double fare) {
		double totalPrice=(noOfPassengers*fare)+gstPrice;
		return totalPrice;
	}

}
