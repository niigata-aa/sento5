<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
</head>
<body>
<div class="title"><!-- title タイトル -->
<h1>マイページ</h1></div>

<div class="comment"><!-- comment 	コメント一覧 -->
<form action = "coment-list-servlet" method = "POST">
<input type = "hidden"  name="userId" value="<%=session.getAttribute("userId")%>">
<input type = "submit" value = "コメント一覧">
</form></div>

<div class="button"><!-- button 戻るボタン -->
<input type = "button"  onclick = "history.back()" value = "戻る"></div>
</body>
</html>