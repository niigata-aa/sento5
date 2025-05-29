<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント一覧</title>
</head>
<body>
	<div class="back" ><!-- 戻るボタン -->
	<form action="mypage.jsp" method="post">
		<input type="submit" value="戻る"> 
	</form>
<%@include file = "header.jsp" %>
	<div class="back" ><!-- 戻るボタンだお -->
	<button type="button"onclick="history.back()">戻る</button>

	</div>
	<% List<CommentBean>commentList=(List<CommentBean>)session.getAttribute("commentList");%>
	<% if(commentList == null || commentList.isEmpty()){ %> 
 	何もコメントされていません
	 <%} else{ %>
	<div class="comment"><!-- コメントの要素すべて -->
		<%for(CommentBean comment:commentList){ %>
			コメントID:<%=comment.getCommentId() %><br>
			店ID: <%=comment.getShopId() %><br>
			ジャンルID:<%=comment.getGenreId() %><br>
			レビュー:<%=comment.getReview() %><br>
			評価:<%=comment.getRate() %><br>
			写真:<%=comment.getCommentPhoto() %><br>
			メニュ:<%=comment.getMenu() %><br>
			値段:<%=comment.getValue() %><br>
			<form action="shop-detail" method="post">
				<input type="submit" value="店舗詳細">
				<input type="hidden" name="shopId" value="<%=comment.getShopId() %>">
			</form>
			</div>
			<div class="delete"><!-- 削除ボタン -->
	<form action="coment-delete-confirm-servlet" method="post">
		<input type="submit" value="削除">
		<input type="hidden" name="commentId" value="<%=comment.getCommentId() %>">
		<input type="hidden" name="shopId" value="<%=comment.getShopId() %>">
		<input type="hidden" name="genreId" value="<%=comment.getGenreId() %>">
		<input type="hidden" name="review" value="<%=comment.getReview() %>">
		<input type="hidden" name="rate" value="<%=comment.getRate() %>">
		<input type="hidden" name="commentphotp" value="<%=comment.getCommentPhoto() %>">
		<input type="hidden" name="menu" value="<%=comment.getMenu() %>">
		<input type="hidden" name="value" value="<%=comment.getValue() %>">
		</form>
		</div>
		<%} %>
	
	<%} %>
</body>
</html>