<%@ page pageEncoding= "UTF-8" %>

<% int userId = (int)session.getAttribute("userId"); %>

ログインユーザ：<%=userId %>

<form action = "LogoutServlet" method = "POST">
<input type = "submit"  value = "ログアウト">
</form>

<form action = "top.jsp" method = "POST">
<input type = "submit"  value = "トップページへ">
</form>

