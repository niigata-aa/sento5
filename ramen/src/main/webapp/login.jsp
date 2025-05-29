<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
</head>
<body>
<div class="login-container"><!-- login-container ログイン全体のコンテナ -->

<div class="title"><!-- title 	タイトルのみ -->
<h2>ログインページ</h2>
</div>

<p style="color:red;">
	<%= request.getAttribute("errorMessage")!= null ? request.getAttribute("errorMessage"): ""%>
<form action="login-servlet"method="POST">

<div class="inputID"><!-- inputID ID入力 -->
ユーザID：<input type="text" name="userId" placeholder="ユーザID">
</div><br>

<div class="inputpass"><!-- inputpass パスワード入力 -->
パスワード：<input type="password" name="password" placeholder="パスワード">
</div><br>

<div class="button"><!-- button ボタン群 -->
<input type="reset"value="クリア"><input type="submit"value="ログイン">
</div>
</form>

<div class="newregist"><!-- newregist 新規登録ボタン -->
<button onclick="location.href='userRegist.jsp'">新規登録はこちら</button>
</div>
</div>
</body>	
</html>