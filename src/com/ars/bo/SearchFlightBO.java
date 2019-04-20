package com.ars.bo;

import java.util.List;

import com.ars.dao.SearchFlightDAO;
import com.ars.model.Flight;

public class SearchFlightBO {

	public List<Flight> getAvailableFlights(String source, String destination) {
		SearchFlightDAO searchDAO=new SearchFlightDAO();
		return searchDAO.getAvailableFlights(source, destination);
		
	}

}
