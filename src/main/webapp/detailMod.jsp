<%@page import="yhPrj.dto.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	VO vo = (VO)request.getAttribute("vo");
%>

<style>
	table, tr, td, th{border: 1px solid black;}
</style>
    
<h2>사용자 수정</h2>    
<form method="post" id="frm">
	<table>
		<tr>
			<th>사용자번호</th>
			<td><input type="text" name="usernumber" value="<%=vo.getUsernumber()%>" readonly></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" value="<%=vo.getId()%>" required="required"></td>
		</tr>
		<tr>
			<th>PassWord</th>
			<td><input type="password" name="pwd" value="<%=vo.getPwd()%>" required="required"></td>
		</tr>
		<tr>
			<th>사용자명</th>
			<td><input type="text" name="username" value="<%=vo.getUsername()%>" required="required"></td>
		</tr>
		<tr>
			<th>관리여부</th>
			<td colspan =2>
			<%if(vo.getManagement().equals("O")){
				%>
				<input type="checkbox" name="management" value="<%=vo.getManagement()%>" checked="checked">O
				<input type="checkbox" name="management" value="<%=vo.getManagement()%>">X
			<%
			} else{
			%>
				<input type="checkbox" name="management" value="<%=vo.getManagement()%>">O
				<input type="checkbox" name="management" value="<%=vo.getManagement()%>" checked="checked">X			
			<%
			}
			%>	
			</td>
		</tr>
		<tr>
			<td align=center colspan =2>
				<input type="submit" value="수정">
				<a href="#"><input type="button" value="조회"></a>
			</td>
		</tr>
	</table>
</form>