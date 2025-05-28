<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント削除確認</title>
</head>
<body>
<h2>投稿確認ページ</h2>


<% List<CommentBean>commentList=(List<CommentBean>)request.getAttribute("commentList");%>
<%for(CommentBean comment:commentList){ %>
		コメントID<%=comment.getCommentId() %><br>
		カテゴリーID<%=comment.getGenreId() %>
		レビュー<%=comment.getReview() %>
		評価<%=comment.getRate() %>
		写真<%=comment.getCommentPhoto() %>
		投稿時間<%=comment.getCommentTime() %>
		メニュ<%=comment.getMenu() %>
		値段<%=comment.getValue() %>
		<button type="button"onclick="history.back()">戻る</button>
		<form action="coment-delete-servlet" method="post">
			<input type="submit" value="削除する">
			<input type="hidden" name="commentId" value="<%comment.getCommentId(); %>">
		</form>
<%} %>


</body>
</html>