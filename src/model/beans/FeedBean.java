package model.beans;

import java.sql.ResultSet;

public class FeedBean {
	private ResultSet resultSet;

	public FeedBean() {
	}

	public FeedBean(final ResultSet resultSet) {
		this.resultSet = resultSet;
	}

	public ResultSet getResultSet() {
		return resultSet;
	}

	public void setResultSet(final ResultSet resultSet) {
		this.resultSet = resultSet;
	}
}
