<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録完了！</title>
</head>
<body>
<%@include file = "header.jsp" %>
<div class="regist-container"><!-- regist-container 登録全体のコンテナ -->
さんこんにちは。
ユーザ登録完了しました
<div class="button"><!-- button ボタン -->
<button onclick="location.href='login.jsp'">ログイン画面へ</button>
</div>
<%session.invalidate(); %>
</div>
</body>
</html>