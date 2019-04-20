package com.ars.bo;

import com.ars.dao.LoginDAO;
import com.ars.model.User;

public class LoginBO {

	public User validateUser(String userId, String password) {
		LoginDAO loginDAO=new LoginDAO(); 
		return loginDAO.validateUser(userId,password);
	}

}
