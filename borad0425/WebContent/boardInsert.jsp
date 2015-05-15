<%@page import="java.sql.PreparedStatement"%>
<%@page import="ex1.ConnectUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
	<%
	response.setContentType("text/html; euc-kr");
	request.setCharacterEncoding("euc-kr");
	String writer = request.getParameter("writer");
	String pwd = request.getParameter("pwd");
	String cont = request.getParameter("cont");
	
	Connection con = ConnectUtil.getConn();
	
	StringBuffer sql = new StringBuffer();
	sql.append("insert into boardTable values(boardTable_seq.nextVal,?,?,sysdate)");
	
	PreparedStatement pstmt = con.prepareStatement(sql.toString());
	
	pstmt.setString(1, writer);
	pstmt.setString(2, cont);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("boardList.jsp");
	
	%>
    