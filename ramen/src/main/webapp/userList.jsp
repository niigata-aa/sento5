<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,java.util.ArrayList,model.Bean.UserBean"%>
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


			テーブルの行の固定をCSSで記入する
			<%
		List<UserBean> userList = (List<UserBean>) request.getAttribute("userList");
		%>
			<table border=1>
				<tr>
					<th>ユーザID</th>
					<th>ユーザネーム</th>
					<td>削除</td>
				</tr>
				<%
				for (UserBean user : userList) {
				%>
				<tr>
					<td><%=user.getUserId()%></td>
					<td><%=user.getUserName()%></td>
					<td><form action="user-delete-confirm-servlet" method="POST">
						<input type="hidden" name="userId" value="<%=user.getUserId()%>">
						<input type="hidden" name="userName" value="<%=user.getUserName()%>">
						<button type="submit">削除</button>
						</form>
					</td>
				</tr>
					<%} %>
				<!--				-->
			</table>
			<br>
	</div>
</body>
</html>