<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント一覧</title>
</head>
<body>
	<form action="mypqge.jsp" method="post">
		<input type="submit" value="戻る">
	</form>
	<% List<CommentBean>commentList=(List)request.getAttribute("commentList");%>
	<%for(CommentBean comment:commentList){ %>
		<%=comment.comment_id%><br>
		<%=comment.user_id %>
		<%=comment.shop_id %>
		<%=comment.genre_id %>
		<%=comment.review %>
		<%=comment.rate %>
		<%=comment.comment_photo %>
		<%=comment.comment_time %>
		<%=comment.menu %>
		<%=comment.value %>
	
	<form action="CommentDelete" method="post">
		<input type="submit" value="削除">
		</form>
	<%} %>
</body>
</html>