<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"　import="java.util.List,java.util.ArrayList,model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿確認ページ</title>
</head>
<body>
<h2>投稿確認ページ</h2>


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
<%} %>
<button type="button"onclick="history.back()">戻る</button>
<form action="coment-regist-confirm-servlet" method="post">
	<input type="submit" value="登録">
</form>
</body>
</html>