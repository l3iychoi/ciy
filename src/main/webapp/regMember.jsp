<%@page import="yhPrj.dto.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	VO vo = (VO)request.getAttribute("vo");
%>    
<style>
	table, tr, td, th{border: 1px solid black;}
</style>
   
<h2>멤버 등록</h2>    
<form method="post" id="frm">
	<table>
		<tr>
			<th>number</th>
			<td><input type="text" name="usernumber" value="<%=vo.getUsernumber()%>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" required="required"></td>
		</tr>
		<tr>
			<th>PassWord</th>
			<td><input type="password" name="pwd" required="required"></td>
		</tr>
		<tr>
			<th>사용자명</th>
			<td><input type="text" name="username" required="required"></td>
		</tr>
		<tr>
			<th>관리여부</th>
			<td colspan =2>
				<input type="checkbox" name="management" value="O">O
				<input type="checkbox" name="management" value="X">X
			</td>
		</tr>
		<tr>
			<td align=center colspan =2>
				<input type="submit" value="저장">
				<input type="reset" value="취소" >
			</td>
		</tr>
	</table>
</form>
