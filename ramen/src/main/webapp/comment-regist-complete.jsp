<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント投稿できました</title>
<link rel="stylesheet" href="css/comment-complete.css">
</head>
<%@include file = "header.jsp" %>
<body>
<div class="comment">
<%=request.getAttribute("count") %>件のコメントを登録しました！！！<br>
<form action="shop-detail" method="post">
<input type="hidden" name="shopId"value="<%=request.getAttribute("shopId") %>">
<br>
<input type="submit" value="コメントした店舗へ戻る">
</form>
</div>
</body>
</html>