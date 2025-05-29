<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding= "UTF-8" %>

ログインユーザ：<%=session.getAttribute("userName") %>

<form action = "LogoutServlet" method = "POST">
<input type = "submit"  value = "ログアウト">
</form>

<form action = "top.jsp" method = "POST">
<input type = "submit"  value = "トップページへ">
</form>

