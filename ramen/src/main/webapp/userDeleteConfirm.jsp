<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認</title>
</head>
<body>
<form action="user-delete-servlet" method="post">
<h1>ユーザ削除確認画面</h1>
本当にこのユーザを削除しますか<br>
ユーザID:<%=session.getAttribute("d_userId") %><br>
ユーザネーム：<%=session.getAttribute("d_userName") %><br>
<input type="submit" value="削除">
<button type="button"onclick="history.back()">戻る</button>
</form>
</body>
</html>