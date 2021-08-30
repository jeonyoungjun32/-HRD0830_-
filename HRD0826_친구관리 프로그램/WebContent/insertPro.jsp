<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<%@ include file="dbcon.jsp"%>

	<%
		try {

		sql = "insert into member_tbl_ll values(?,?,?,?,?,?)";

		ps = con.prepareStatement(sql);

		ps.setString(1, request.getParameter("member_no"));
		ps.setString(2, request.getParameter("member_id"));
		ps.setString(3, request.getParameter("member_name"));
		ps.setString(4, request.getParameter("member_grade"));
		ps.setString(5, request.getParameter("member_hobby"));
		ps.setString(6, request.getParameter("member_date"));

		ps.executeUpdate();
	%>
	<script>
		alert("회원등록이 완료되었습니다.");
		location = "insert.jsp";
	</script>

	<%
		}catch(Exception e) {
	%>
	<script>
		alert("회원등록이 실패 되었습니다!");
		history.back();
	</script>

	<%
		} finally {
		try {
			if (con != null)
		con.close();
			if (stmt != null)
		stmt.close();
			if (ps != null)
		ps.close();
			if (rs != null)
		rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	%>
