<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧</title>
</head>
<body>
<h1>管理者ページ</h1>
<h2>ユーザ一覧</h2>
<div>
<form action="user-delete-confirm-servlet" method="POST">
	<% 
		List<UserBean> userList =(List<UserBean>)request.getAttribute("userList"); 
		for(UserBean user : userList){
	%>

		<%=user.getUserId() %><%=user.getUserName() %> 
<input type="hidden" name="userId" value="<%user.getUserId(); %>">
<input type="hidden" name="userName" value="<%user.getUserName(); %>">

<button type="submit">削除</button>
<br>
	<%} %>
</form>
</div>
</body>
</html>