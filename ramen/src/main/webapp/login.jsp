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
<h1>ログインページ</h1>
</div>

<div class="login-container"><!-- login-container ログイン全体のコンテナ -->

<p>
	<%= request.getAttribute("errorMessage")!= null ? request.getAttribute("errorMessage"): ""%>
<form action="login-servlet"method="POST">

<div class="inputID"><!-- inputID ID入力 -->
<span>ユーザID</span><br>
<input type="text" name="userId" placeholder="5桁のユーザID"pattern="\d{5}"/>
</div><br>

<div class="inputpass"><!-- inputpass パスワード入力 -->
<span>パスワード</span><br>
<input type="password" name="password" placeholder="パスワード"minlength="8"/	>
</div><br>

<input type="reset"value="クリア"><br>
<input type="submit"value="ログイン">

</form>
</div>

<div class="href">
<a href='userRegist.jsp'>新規登録はこちら</a>
</div>

</body>	
</html>