<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ex1.ConnectUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
	#wrap { width: 600px; margin: auto;}
	#wrap table { width: 100% }
	#wrap table thead td {background: green; border: 1px dotted;
	text-align: center; color: white;}

</style>
<script>
	$(function(){
		$('#del').click(function(){
			alert("삭제 버튼을 눌렀습니다.")
			var param="deleteId=";			
			$('input:checkbox[name=ck]').each(function(){
				if($(this).is(':checked')){
					param += $(this).val();		
					alert("parm :"+parm);
				}
			});
			$("#target").load('delPage.jsp?'+param, function(){
				alert($("#target").html().trim());
				location.reload();
			});
		});
	});	

</script>
</head>
<body>
	<div id="wrap">
	<div id="target" style="display: none;"></div>
		<table>
			<thead>
				<tr>
					<td>선택</td>
					<td>글번호</td>
					<td>작성자</td>
					<td>글내용</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
			<!--  -->
			<% 
				Connection conn = ConnectUtil.getConn();
				StringBuffer sql = new StringBuffer();
				sql.append("select num,writer,cont,edate from boardTable order by 1 desc");
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();
			
				while(rs.next()){
			%>
			
				<tr>
					<td>
						<input type="checkbox" id="ch" name="ck" value="<%=rs.getInt("num") %>">
					</td>
					<td style="text-align:center" id="num"><%=rs.getString("num") %></td>
					<td><%=rs.getString("writer") %></td>
					<td><%=rs.getString("cont") %></td>
					<td><%=rs.getString("edate") %></td>
				</tr>
				<% }
					rs.close();
					pstmt.close();
					conn.close();
				%>
			<!--  -->
			</tbody>
			<tfoot>
				
				<tr>
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="location='board.html'">
						<input type="button" value="삭제" id="del" name="del">
					</td>				
				</tr>				
			</tfoot>			
		</table>
	</div>
</body>
</html>