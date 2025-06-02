<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,java.util.ArrayList,model.Bean.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧</title>
<link rel="stylesheet" href="css/userlist.css">
</head>
<body>
<%@include file = "header.jsp" %>
	
	<div class="user-container"><!-- user-container ユーザ全体のコンテナ -->
	<div class = "head">
	<h1>ユーザ一覧</h1>
	</div>
	

	<div class="userall"><!-- userall ユーザ表示-->
			
			<%
		List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
		%>
			<table border=1>
				<tr>
					<th>ユーザID</th>
					<th>ユーザネーム</th>
					<th>削除</th>
				</tr>
				<%
				for (UserBean user : userList) {
				%>
				<tr>
					<td><%=user.getUserId()%></td>
					<td><%=user.getUserName()%></td>
					<td><form action="user-delete-confirm-servlet" method="POST">
						<div class="userID"><!-- userID　ユーザIDの表示 -->
						<input type="hidden" name="userId" value="<%=user.getUserId()%>">
						</div>
						<div class="username"><!-- username　ユーザネームの表示 -->
						<input type="hidden" name="userName" value="<%=user.getUserName()%>">
						</div>
						<div class="submit"><!-- submit ボタン -->
						<button type="submit">削除</button>
						</div>
						</form>
					</td>
				</tr>
					<%} %>
				<!--				-->
			</table>
			<br>
	</div>
	</div>
</body>
</html>