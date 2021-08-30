<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	if(f.member_no.value == ""){//javascript "" '' 둘다 문자열 취급함
		alert("회원번호를 입력해주세요.");
		return f.member_no.focus();
	}
	
	if(f.member_id.value == ""){
		alert("회원ID를 입력해주세요!");
		return f.member_id.focus();
	}
	
	if(f.member_name.value == ""){
		alert("회원이름을 입력해주세요!");
		return f.member_name.focus();
	}
	
	if(f.member_grade[0].checked == false && f.member_grade[1].checked == false && f.member_grade[2].checked == false){
		alert("회원등급을 입력해주세요!");
		return;
	}
	
	if(f.member_hobby[0].checked == false && f.member_hobby[1].checked == false && f.member_hobby[2].checked == false ){
		alert("회원취미를 입력해주세요!");
		return;
	}
	
	if(f.member_date.value == ""){
		alert("등록일자를 입력해주세요!");
		return f.member_date.focus();
	}
	f.submit();
	
}
</script>
</head>
<body>


	<%@ include file="header.jsp"%>

	<%
		String member_no = request.getParameter("member_no");

	sql += "select member_id, member_name,";
	sql += " decode(member_grade,'S','특별회원','A','우수회원','B','일반회원'),";
	sql += " member_hobby,";
	sql += " to_char(member_date,'yyyy.mm.dd')";
	sql += " from member_tbl_ll";
	sql += " where member_no = "+member_no; 
	
	rs = stmt.executeQuery(sql);
	rs.next();
	
	String member_id = rs.getString(1);
	String member_name = rs.getString(2);
	String member_grade = rs.getString(3);
	String member_hobby = rs.getString(4);
	String member_date = rs.getString(5);
	
	
	%>
	
	
	<form action="updatePro.jsp"name="f" method="post">
		<table border="1" style="margin: 0 auto; width: 90%;">
		<h1>친구 등록</h1>
			<tr>
				<th>회원정보</th>
				<td><input type="text" name="member_no" value="<%=member_no%>" readonly="readonly"></td>
			</tr>
	
			<tr>
				<th>회원ID</th>
				<td><input type="text" name="member_id" value="<%=member_id%>"></td>
			</tr>
	
			<tr>
				<th>이름</th>
				<td><input type="text" name="member_name" value="<%=member_name%>"></td>
			</tr>
	
			<tr>
				<th>등급</th>
				<td>
					<select name="member_grade" >
						<option value="S">특별회원</option>
						<option value="A">우수회원</option>
						<option value="B">일반회원</option>
					</select>
				</td>
			</tr>
	
			<tr>
				<th>취미</th>
				<td><label> <input type="checkbox" name="member_hobby" value="독서">독서</label>
					<label><input type="checkbox" name="member_hobby" value="운동">운동</label>
					<label><input type="checkbox" name="member_hobby" value="영화">영화</label></td>
			</tr>
	
			<tr>
				<th>등록일자</th>
				<td><input type="text" name="member_date" value="<%=member_date%>"></td>
			</tr>
	
		
			<tr style="margin: 0 auto;">
				<td colspan="2">
					<input type="submit" value="수정" onclick="check(); return false"> 
					<input type="submit" value="조회" onclick="location='select.jsp'"> 
				</td>
			</tr>
		</table>
	</form>	

</body>
</html>