package com.ars.dao;

import com.ars.constants.QueryConstants;
import com.ars.model.User;
import com.ars.util.DBUtil;
import java.sql.*;

public class LoginDAO {

	public User validateUser(String userId, String password) {
		Connection con = (Connection) DBUtil.getConnection();
		try {
			User user = new User();
			PreparedStatement ps = con.prepareStatement(QueryConstants.VALIDATEUSER);
			ps.setString(1, userId);
			ResultSet rs = ps.executeQuery();
			String dbUserId = null, dbPassword = null;
			while (rs.next()) {

				dbUserId = rs.getString(1);
				dbPassword = rs.getString(2);
			}
			if (dbUserId != null || dbPassword != null) {
				if (dbUserId.equals(userId)) {
					if (dbPassword.equals(password)) {
						PreparedStatement ps1 = con.prepareStatement(QueryConstants.GETUSERDETAILS);
						ps1.setString(1, userId);
						ps1.setString(2, password);
						ResultSet rs1 = ps1.executeQuery();

						while (rs1.next()) {
							user.setUserId(rs1.getString(1));
							user.setPassword(rs1.getString(2));
							user.setName(rs1.getString(3));
							user.setAddress(rs1.getString(4));
							user.setEmail(rs1.getString(5));
							user.setContact(rs1.getString(6));
						}
						return user;
					}

				}
			}

			return null;
		} catch (SQLException e) {
			return null;
		}

	}

}
