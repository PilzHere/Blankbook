package model.beans;

import database.SQLConnection;

public class UserBean {
	private String password, username;

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}

	public void resetUserBean() {
		this.password = null;
		this.username = null;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public void setUsername(final String email) {
		this.username = email;
	}

	public boolean validate(final UserBean userBean) {
		if (SQLConnection.connectSQL()) {
			return SQLConnection.userSql(userBean);
		}

		return false;
	}
}