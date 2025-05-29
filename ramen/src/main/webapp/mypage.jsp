<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>

<h1>マイページ</h1>

<form action = "coment-list-servlet" method = "POST">
<input type = "hidden"  name="userId" value="<%=session.getAttribute("userId")%>">
<input type = "submit" value = "コメント一覧">
</form>
<input type = "button"  onclick = "history.back()" value = "戻る">
</body>
</html>