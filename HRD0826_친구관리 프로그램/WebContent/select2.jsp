<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

	String member_no = request.getParameter("member_no");

	/* sql = ""; */
	int i =0;
	if (member_no != null) {
		i++;
	%>
	<script>
		alert("성공!!");
		history.back;
	</script>
	<%
		} else {
	%>
	<script>
		alert("null이네?");
		history.back;
	</script>
	<%
		}
	%>

	<%@ include file="header.jsp"%>
	<h1>
		친구조회(<%=member_no%>)
	</h1>
	
	<table>
		<tr>
			<th>회원ID</th>
			<th>회원명</th>
			<th>요청일자</th>
		</tr>
	
	<%
		sql ="";
	%>	
	</table>
	친구 : <%=i %>명;

</body>
</html>