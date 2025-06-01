<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<%@include file = "header2.jsp" %>
<form action="user-delete-servlet" method="post">
<div class="title"><!-- title 	タイトルのみ -->
<h1>ユーザ削除確認</h1>
</div>

<div class="userdelete-container"><!-- userdelete-container 	ユーザ削除確認のコンテナ -->
本当にこのユーザを削除しますか？<br>
ユーザID:<%=session.getAttribute("d_userId") %><br>
ユーザネーム：<%=session.getAttribute("d_userName") %><br>

<div class="button"><!-- button 	ボタン群 -->
<input type="submit" value="削除">
<input type="button"onclick="history.back()"value="戻る"></button>
</div>

</div>
</form>
</body>
</html>