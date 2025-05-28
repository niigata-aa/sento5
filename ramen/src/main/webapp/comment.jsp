<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント一覧</title>
</head>
<body>
	<button type="button"onclick="history.back()">戻る</button>
	<% List<CommentBean>commentList=(List<CommentBean>)request.getAttribute("commentList");%>
	<%for(CommentBean comment:commentList){ %>
		<%=comment.getCommentId() %><br>
		<%=comment.getGenreId() %>
		<%=comment.getReview() %>
		<%=comment.getRate() %>
		<%=comment.getCommentPhoto() %>
		<%=comment.getCommentTime() %>
		<%=comment.getMenu() %>
		<%=comment.getValue() %>
	<form action="shop-detail-servlet" method="post">
		<input type="submit" value="店舗詳細">
		<input type="hidden" name="shopId" value="<%comment.getShopId(); %>">
		</form>
	<form action="coment-delete-confirm-servlet" method="post">
		<input type="submit" value="削除">
		<input type="hidden" name="commentId" value="<%comment.getCommentId(); %>">
		<input type="hidden" name="genreId" value="<%comment.getGenreId(); %>">
		<input type="hidden" name="review" value="<%comment.getReview(); %>">
		<input type="hidden" name="rate" value="<%comment.getRate(); %>">
		<input type="hidden" name="commentphotp" value="<%comment.getCommentPhoto(); %>">
		<input type="hidden" name="commenttime" value="<%comment.getCommentTime(); %>">
		<input type="hidden" name="menu" value="<%comment.getMenu(); %>">
		<input type="hidden" name="value" value="<%comment.getValue(); %>">
		</form>
	<%} %>
</body>
</html>