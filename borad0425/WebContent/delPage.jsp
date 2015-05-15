<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ex1.ConnectUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");	
	String num = request.getParameter("deleteId");	
	out.println("st1 : "+num);
// 	StringTokenizer st = new StringTokenizer(num,"/");
// 	out.println("st1 : "+st);
// 	while(st.hasMoreTokens()){
// 		out.println("st2 : "+st.nextToken());		
// 	}
	
	int num1 = Integer.parseInt(num);
	Connection conn = ConnectUtil.getConn();
	StringBuffer sql = new StringBuffer();
	sql.append("delete from boardTable where num=?");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, num1);
	
	String res;
	try{
		pstmt.executeUpdate();
		res = "성공적으로 삭제했습니다.";
	}catch(Exception e) {
		res = "삭제 실패";		
	}
%>
<%=res%>

	

