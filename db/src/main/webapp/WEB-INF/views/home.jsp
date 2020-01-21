<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>

<%
	/*
	id testuser
	pw 1234
	db test
	tb test
	col name
	*/

	Class.forName("org.mariadb.jdbc.Driver"); // JDBC연결을 위한 Class이름 설정

	String DB_URL = "jdbc:mysql://localhost:3306/test";

	// 기본설정된 포트 3306으로 하고 사용할 db의 이름을 적어준다(web01)

	String DB_USER = "testuser"; // web01 데이터베이스에 접근하는 아이디

	String DB_PASSWORD = "1234"; // password

	Connection conn = null;

	Statement stmt = null;

	ResultSet rs = null;

	try {

		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 연결자 획득

		stmt = conn.createStatement(); // 상태 확인

		String query = "SELECT * FROM test"; // DB에 전송할 쿼리문 생성 목록을 나타내기 위해 SELECT문을 사용했습니다. 

		rs = stmt.executeQuery(query); // 쿼리문 실행!
		int count = 0;
		while (rs.next()) {
			String name = rs.getString("name");
%>
<p>
	Name :
	<%=name%></p>
<%
	count++;
		} // end while

			
		rs.close(); // ResultSet 종료

		stmt.close(); // Statement 종료

		conn.close(); // Connection 종료

	} catch (SQLException e) { // 예외처리

		out.println("err:" + e.toString());

	}
%>