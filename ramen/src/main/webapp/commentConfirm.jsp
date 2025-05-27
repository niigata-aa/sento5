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
		ジャンルID<%=comment.getGenreId() %><br>
		レビュー<%=comment.getReview() %><br>
		評価<%=comment.getRate() %><br>
		写真<%=comment.getCommentPhoto() %><br>
		投稿時間<%=comment.getCommentTime() %><br>
		メニュー<%=comment.getMenu() %><br>
		値段<%=comment.getValue() %><br>
<%} %>
<button type="button"onclick="history.back()">戻る</button>
<form action="coment-regist-confirm-servlet" method="post">
	<input type="submit" value="登録">
</form>
</body>
</html>