package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.bean.JioScoresCircle;

public class JioScoresCircleDao {

	private static DataSource dataSource;

	public JioScoresCircleDao(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/*
	 * private static final String DRIVER_NAME = "com.mysql.jdbc.Driver"; private
	 * static final String DB_URL = "jdbc:mysql://localhost:3306/jcs"; private
	 * static final String ID = "root"; private static final String PASS =
	 * "Reljio123";
	 */

	// private static final String FIND_BY_JIO_CENTER = "SELECT * FROM
	// JioScoresCircle WHERE JioCenter=?";
	private static final String ORDER_BY_CIRCLE = "SELECT * FROM JioScoresCircle where Circle=?";
	private static final String ORDER_BY_DISTINCT_CIRCLE = "SELECT DISTINCT Circle FROM jcs.JioScoresCircle order by Circle";

	// private static final String ADD_CIRCLE = "insert into JioScoresCircle" +
	// "(Circle, CityName, JioCenter, Cluster, CoveragePercent )" + "values
	// (?,?,?,?,?)";

	/*
	 * public List<JioScoresCircle> findByJioCenter(String JioCenter) { Connection
	 * conn = null; PreparedStatement stmt = null;
	 * 
	 * try { conn = dataSource.getConnection(); stmt =
	 * conn.prepareStatement(FIND_BY_JIO_CENTER); stmt.setString(1, JioCenter);
	 * 
	 * ResultSet rs = stmt.executeQuery();
	 * 
	 * if (rs.next()) { return (List<JioScoresCircle>)
	 * extractJioScoreCircleDetailsFromResultSet(rs); } else { return null; } }
	 * catch (SQLException e) { // e.printStackTrace(); throw new
	 * RuntimeException(e); } finally { close(stmt); close(conn); } }
	 */

	public JioScoresCircle orderByCircle(String postCircle) {

		JioScoresCircle circleDetailsD = new JioScoresCircle();
		Connection conn = null;
		PreparedStatement stmt = null;
		System.out.println("\n"+"enterd orderbycircle method from he post method call... and the post circle value is :"+ postCircle+"\n");
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(ORDER_BY_CIRCLE);
			stmt.setString(1, postCircle);

			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {

				String Circle = rs.getString("Circle");
				String CityName = rs.getString("CityName");
				String Cluster = rs.getString("Cluster");
				String JioCenter = rs.getString("JioCenter");
				Double CoveragePercent = rs.getDouble("CoveragePercent");
				Double CapacityPercent = rs.getDouble("CapacityPercent");
				Double QosPercent = rs.getDouble("QosPercent");
				Double JCSPercent = rs.getDouble("JCSPercent");
				String ES = rs.getString("ES");

				circleDetailsD = new JioScoresCircle(Circle, CityName, Cluster, JioCenter, CoveragePercent, CapacityPercent, QosPercent, JCSPercent, ES );

				System.out.println("hello this is the output of circlelist details in DAO");

				System.out.println("circle :" + Circle + ", Cityname :" + CityName + " ,Cluster:" + Cluster
						+ ", JioCenter :" + JioCenter + ",CoveragePercent :" + CoveragePercent);

			}
		} catch (SQLException e) {
			// e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			close(stmt);
			close(conn);
		}
		return circleDetailsD;
	}

	public List<JioScoresCircle> orderByDistinctCircle() {

		List<JioScoresCircle> circleListDetails = new ArrayList<>();
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(ORDER_BY_DISTINCT_CIRCLE);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String Circle = rs.getString("Circle");

				JioScoresCircle tempCircleList = new JioScoresCircle(Circle);
				circleListDetails.add(tempCircleList);
			}

		} catch (SQLException e) {
			// e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			close(stmt);
			close(conn);
		}
		return circleListDetails;
	}

	private static void close(Connection con) {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}

	private static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}
}

/*
 * private static JioScoresCircle
 * extractJioScoreCircleDetailsFromResultSet(ResultSet rs) throws SQLException {
 * JioScoresCircle jsc = new JioScoresCircle();
 * 
 * jsc.setDate(rs.getDate("Date")); jsc.setCircle(rs.getString("Circle"));
 * jsc.setCityName(rs.getString("CityName"));
 * jsc.setCluster(rs.getString("Cluster"));
 * jsc.setCoveragePercent(rs.getDouble("CoveragePercent"));
 * jsc.setCapacityPercent(rs.getDouble("Capacitypercent"));
 * jsc.setQosPercent(rs.getDouble("QosPercent"));
 * 
 * return jsc; }
 * 
 * 
 * private static Connection getConnection() { try { Class.forName(DRIVER_NAME);
 * return DriverManager.getConnection(DB_URL, ID, PASS); } catch (Exception e) {
 * // e.printStackTrace(); throw new RuntimeException(e); } }
 * 
 * 
 * 
 * public static void addCircle(JioScoresCircle theCircle) {
 * 
 * Connection conn = null; PreparedStatement stmt = null;
 * 
 * try { conn = dataSource.getConnection(); stmt =
 * conn.prepareStatement(ADD_CIRCLE); stmt.setString(1, theCircle.getCircle());
 * stmt.setString(2, theCircle.getCityName()); stmt.setString(3,
 * theCircle.getCluster()); stmt.setString(4, theCircle.getJioCenter());
 * stmt.setDouble(5, theCircle.getCoveragePercent());
 * 
 * stmt.executeQuery();
 * 
 * } catch (SQLException e) { // e.printStackTrace(); throw new
 * RuntimeException(e); } finally { close(stmt); close(conn); }
 * 
 * 
 * }
 * 
 */