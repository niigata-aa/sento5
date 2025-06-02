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
	<h1>管理者ページ</h1>
	<div class="user-container"><!-- user-container ユーザ全体のコンテナ -->
	<h2>ユーザ一覧</h2>
	

	<div class="userall"><!-- userall ユーザ表示-->
			テーブルの行の固定をCSSで記入する
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