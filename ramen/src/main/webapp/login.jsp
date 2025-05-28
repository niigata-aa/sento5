<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
</head>
<body>
<h2>ログインページ</h2>
<p style="color:red;">
	<%= request.getAttribute("errorMessage")!= null ? request.getAttribute("errorMessage"): ""%>
<form action="login-servlet"method="POST">
ユーザID：<input type="text" name="userId" placeholder="ユーザID"><br>
パスワード：<input type="password" name="password" placeholder="パスワード"><br>
<input type="reset"value="クリア"><input type="submit"value="ログイン">
</form>
<button onclick="location.href='userRegist.jsp'">新規登録はこちら</button>
</body>	
</html>