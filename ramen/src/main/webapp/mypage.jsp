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

<form action = "comment-list-servlet" method = "POST">
<input type = "submit" value = "コメント一覧">
<input type = "hidden"  name="userId" >
</form>
<input type = "button"  onclick = "history.vack()" value = "戻る">
</body>
</html>