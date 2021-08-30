<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>


	<h1>친구등록</h1>

	<table border="1" style="width: 90%; text-align: center;">
		<tr>
			<th>회원번호</th>
			<th>회원ID</th>
			<th>이름</th>
			<th>등급</th>
			<th>취미</th>
			<th>등록일자</th>
		</tr>


		<%
			sql += "select member_no, member_id, member_name,";
		sql += " decode(member_grade,'S','특별회원','A','우수회원','B','일반회원'),";
		sql += " member_hobby,";
		sql += " to_char(member_date,'yyyy.mm.dd')";
		sql += " from member_tbl_ll";
		sql += " order by 2";

		rs = stmt.executeQuery(sql);
		while (rs.next()) {
		%>
			<tr>
				<td><%=rs.getString(1)%></td>  <%-- &&member_id=<%=rs.getString(2)%> 이렇게 해도된다 존나 어렵다! --%>
				<td><a href="update.jsp?member_no=<%=rs.getString(1) %>"><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>