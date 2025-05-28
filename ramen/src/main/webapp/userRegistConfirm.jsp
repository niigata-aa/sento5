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
このアカウントで登録しますか<br>
ユーザID：<%=session.getAttribute("userId") %><br>
パスワード：<%=session.getAttribute("password") %><br>
ユーザ名:<%= session.getAttribute("userName") %><br>
<input type="submit" value="登録">	
<button type="button"onclick="history.back()">戻る</button>

</form>
</body>
</html>