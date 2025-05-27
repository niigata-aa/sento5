<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ登録確認画面</title>
</head>
<body>
<h2>ユーザ登録確認画面</h2>
<form action="user-regist-servlet" method="post">
<jsp:useBean id="user" scope="request" class="model.Bean.UserBean"/>
このアカウントで登録しますか<br>
ユーザID：<jsp:getProperty name="user" property="userId"/><br>
パスワード：<jsp:getProperty name="user" property="password"/><br>
ユーザ名:<jsp:getProperty name="user" property="userName"/><br>
<button type="button"onclick="history.back()">戻る</button>
<input type="submit" value="登録">	
</form>
</body>
</html>