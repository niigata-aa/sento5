<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録完了！</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<div class="container"><!-- container 登録全体のコンテナ -->
ユーザ登録完了しました<br>
<div class="top"><!-- button ボタン -->
<a href='login.jsp'>ログイン画面へ</a>
</div>
<%session.invalidate(); %>
</div>
</body>
</html>