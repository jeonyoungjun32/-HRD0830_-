<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="dbcon.jsp"%>
<%
	try {
	sql = "update member_tbl_ll set member_id =?,member_name =?, member_grade =?, member_hobby =?, member_date =? where member_no =?";

	ps = con.prepareStatement(sql);

	ps.setString(1, request.getParameter("member_id"));
	ps.setString(2, request.getParameter("member_name"));
	ps.setString(3, request.getParameter("member_grade"));
	ps.setString(4, request.getParameter("member_hobby"));
	ps.setString(5, request.getParameter("member_date"));
	ps.setString(6, request.getParameter("member_no"));

	ps.executeUpdate();
%>
<script>
	alert("회원 수정이 완료되었습니다.");
	location = "select.jsp";
</script>
<%
	} catch (Exception e) {
%>
<script>
	alert("회원 수정이 실패 했습니다");
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