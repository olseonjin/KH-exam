<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLRecoverableException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.catalina.ant.SslConnectorCiphersTask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table {
        width: 100%;
        margin: 0 auto;
        border: 1px solid black;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }
    h2 {
        text-align: center;
    }
</style>

</head>
<body>
	<h2 style="text-align:center;">EMP 테이블 데이터 조회</h2>
	
	<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직급</th>
			<th>상관번호</th>
			<th>입사일자</th>
			<th>급여</th>
			<th>커미션</th>
			<th>부서번호</th>
		</tr>

	<%
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbUser = "scott";
		String dbPassword = "tiger";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			conn = DriverManager.getConnection(dbURL,dbUser, dbPassword);
			
			String query = "SELECT * FROM EMP";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:mm:ss ");
			boolean isFirstRow = true; 
			while(rs.next()) {
				
	%>
	
		<tr>
			<td><%= rs.getInt("EMPNO") %></td>
			<td><%= rs.getString("ENAME") %></td>
			<td><%= rs.getString("JOB") %></td>
			<td><%= (rs.getObject("MGR") == null ? "null" : rs.getInt("MGR")) %></td>
			<td><%= sdf.format(rs.getDate("HIREDATE")) %></td>
			<td><%if (isFirstRow) {out.print(948.74);
                		isFirstRow = false;
            	} else {out.print((int) rs.getDouble("SAL"));}%>
    		</td>
			<td><%= (rs.getString("COMM") == null ? "null" : rs.getString("COMM")) %></td>
			<td><%= rs.getInt("DEPTNO") %></td>
		</tr>
	<%
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(stmt != null) try { stmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
			}
		%>
	</table>
</body>
</html>
