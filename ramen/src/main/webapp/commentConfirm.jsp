<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.CommentBean,model.Bean.GenreBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿確認ページ</title>
</head>
<body>
<%@include file = "header.jsp" %>
<div class="posted_confirmation_page"><!-- posted_confirmation_pageのコンテナ -->
<h2>投稿確認ページ</h2>
</div>
<div  class="posted_schedule"><!-- posted_scheduleのコンテナ -->
<% CommentBean comment = (CommentBean)session.getAttribute("comment");%>
		レビュー<%=comment.getReview() %><br>
		評価<%=comment.getRate() %><br>
		<img src="/ramen/upload/<%=comment.getCommentPhoto() %>"><br>
		メニュー<%=comment.getMenu() %><br>
		値段<%=comment.getValue() %><br>
</div>
<div class="button"><!-- button 戻るボタン -->
<button type="button"onclick="history.back()">戻る</button>
</div>
<div class="confirm"><!-- button 登録 -->
<form action="coment-regist-servlet" method="post">
	<input type="submit" value="登録">
</form>
</div>
</body>
</html>