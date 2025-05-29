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
	<% if(commentList.size()==0){ %> <%-- ★修正箇所★ --%>
 	何も入っていませんでした
	 <%} else{ %>
	
		<%for(CommentBean comment:commentList){ %>
			<%=comment.getCommentId() %><br>
			<%=comment.getGenreId() %><br>
			<%=comment.getReview() %><br>
			<%=comment.getRate() %><br>
			<%=comment.getCommentPhoto() %><br>
			<%=comment.getCommentTime() %><br>
			<%=comment.getMenu() %><br>
			<%=comment.getValue() %><br>
			<form action="shop-detail-servlet" method="post">
				<input type="submit" value="店舗詳細">
				<input type="hidden" name="shopId" value="<%=comment.getShopId() %>">
			</form>
			<form action="coment-delete-confirm-servlet" method="post">
			<input type="submit" value="削除">
			<input type="hidden" name="commentId" value="<%=comment.getCommentId() %>">
		</form>
		<%} %>
	
	<%} %>
</body>
</html>