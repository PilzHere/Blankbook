package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.beans.UserBean;

public class SQLConnection {
	static Connection userConnection = null;
	static Connection feedConnection = null;
	static PreparedStatement prepStatement = null;
	static ResultSet resultSet = null;

	public static void addFeedMessageToSql(final String message, final String hashTag, final String creator) {
		try {
			final String requestQuery = "INSERT INTO `post`(`post`, `tag`, `author`) VALUES (?,?,?)";

			prepStatement = feedConnection.prepareStatement(requestQuery);
			prepStatement.setString(1, message);
			prepStatement.setString(2, hashTag);
			prepStatement.setString(3, creator);
			prepStatement.executeUpdate();
			// feedConnection.endRequest();
			// feedConnection.close(); dont close me

		} catch (final SQLException e) {
			System.out.println("addFeedMessageToSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
	}

	public static boolean connectSQL() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (final Exception e) {
			System.out.println("Exe Driver: " + e);

			return false;
		}

		try {
//			Database connections
			userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?serverTimezone=UTC",
					DatabaseLogin.getUserName(), DatabaseLogin.getUserPass()); // users
			feedConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/posts?serverTimezone=UTC",
					DatabaseLogin.getUserName(), DatabaseLogin.getUserPass()); // posts

			// kanske separera?

			return true;

		} catch (final SQLException e) {
			System.out.println("connectSQL");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());

			return false;
		}
	}

	public static ResultSet getFeedFromSql() {
		try {
			final String requestQuery = "SELECT * FROM post";

			prepStatement = feedConnection.prepareStatement(requestQuery);
			resultSet = prepStatement.executeQuery();
			// feedConnection.endRequest();

			return resultSet;

		} catch (final SQLException e) {
			System.out.println("getFeedFromSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}

		return null;
	}

	public static ResultSet getSearchedFeed(final String searchWord) {
		try {
			final String requestQuery = "SELECT * FROM post WHERE post LIKE ? or tag LIKE ?";

			prepStatement = feedConnection.prepareStatement(requestQuery);
			prepStatement.setString(1, "%" + searchWord + "%");
			prepStatement.setString(2, "%" + searchWord + "%");
			resultSet = prepStatement.executeQuery();

			return resultSet;

		} catch (final SQLException e) {
			System.out.println("getSearchedFeed");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());

			return null;
		}
	}

	public static void stopFeedConnectionSql() {
		try {
			feedConnection.close();
		} catch (final SQLException e) {
			System.out.println("stopFeedConnectionSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}
	}

	public static boolean userSql(final UserBean userBean) {
		try {
			final String requestQuery = "SELECT * FROM user WHERE username = ? and password = ?";

			prepStatement = userConnection.prepareStatement(requestQuery);
			prepStatement.setString(1, userBean.getUsername());
			prepStatement.setString(2, userBean.getPassword());
			resultSet = prepStatement.executeQuery();

			boolean isAUser = false;
			while (resultSet.next()) {
				isAUser = true;
			}

			// userConnection.endRequest();
			userConnection.close();

			return isAUser;

		} catch (final SQLException e) {
			System.out.println("userSql");
			System.out.println("SQLException: " + e.getMessage());
			System.out.println("SQLState: " + e.getSQLState());
			System.out.println("VendorError: " + e.getErrorCode());
		}

		return false;
	}
}
