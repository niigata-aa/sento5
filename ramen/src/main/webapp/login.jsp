<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="title"><!-- title 	タイトルのみ -->
<h2>ログインページ</h2>
</div>

<div class="login-container"><!-- login-container ログイン全体のコンテナ -->

<div class="newregist"><!-- newregist 新規登録ボタン -->
<button onclick="location.href='userRegist.jsp'">新規登録はこちら</button>
</div>

<p style="color:red;">
	<%= request.getAttribute("errorMessage")!= null ? request.getAttribute("errorMessage"): ""%>
<form action="login-servlet"method="POST">

<div class="inputID"><!-- inputID ID入力 -->
<span>ユーザID</span><br>
<input type="text" name="userId" placeholder="ユーザID">
</div><br>

<div class="inputpass"><!-- inputpass パスワード入力 -->
<span>パスワード</span><br>
<input type="password" name="password" placeholder="パスワード">
</div><br>

<div class="button"><!-- button ボタン群 -->
<input type="reset"value="クリア"><input type="submit"value="ログイン">
</div>
</form>


</div>
</body>	
</html>