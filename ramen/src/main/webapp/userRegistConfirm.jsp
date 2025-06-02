<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録確認画面</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="title"><!-- title 	タイトルのみ -->
<h1>ユーザ登録確認画面</h1>
</div>
<div class="regist-container"><!-- regist-container ユーザ登録のコンテナ -->
<form action="user-regist-servlet" method="post">
<p>このアカウントで登録しますか</p><br>

<div class="name"><!-- name ユーザネーム確認 -->
ユーザ名:<%= session.getAttribute("userName") %><br>
<input type="hidden" name="userName"value="<%=session.getAttribute("userName") %>">
</div>

<div class="ID"><!-- ID ID確認 -->
ユーザID：<%=session.getAttribute("userId") %><br>
<input type="hidden" name="userId"value="<%=session.getAttribute("userId") %>">
</div>

<div class="pass"><!-- pass パスワード確認 -->
パスワード：<%=session.getAttribute("password") %><br>
<input type="hidden" name="password" value="<%=session.getAttribute("password") %>">
</div>

<input type="submit" value="登録">
<div class="button"><!--  buttonボタン群 -->
<input type="button"onclick="history.back()" value="戻る"><br>
</div>
</form>
</div>

</body>
</html>