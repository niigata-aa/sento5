<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント投稿できました</title>
</head>
<body>

<%=request.getAttribute("count") %>件のコメントを登録しました！！！
<form action="shop-detail" method="post">
<input type="hidden" name="shopId"value="<%=request.getAttribute("shopId") %>">
<input type="submit" value="コメントした店舗へ戻る">
</form>

</body>
</html>