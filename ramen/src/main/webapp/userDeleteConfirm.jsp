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
<jsp:useBean id="user" scope="request" class="model.Bean.UserBean"/>
<h1>ユーザ削除確認画面</h1>
本当にこのユーザを削除しますか<br>
ユーザID:<jsp:getProperty name="user" property="userId"/><br>
ユーザネーム：<jsp:getProperty name="user" property="userName"/><br>
<button type="button"onclick="history.back()">戻る</button>
<input type="submit" value="削除">
</form>
</body>
</html>