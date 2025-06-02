<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,model.Bean.CommentBean,model.Bean.GenreBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント投稿確認</title>
<link rel="stylesheet" href="css/commentform.css">
</head>
<body>
<%@include file = "header.jsp" %>
<div class="commentformtitle"><!-- posted_confirmation_pageのコンテナ -->
<h2>コメント投稿確認</h2>
</div>
<form action="coment-regist-servlet" method="post">
<div  class="commentcontainer"><!-- posted_scheduleのコンテナ -->
<% CommentBean comment = (CommentBean)session.getAttribute("comment");%>
		<div class="comment">
		メニュー：<%=comment.getMenu() %><br>
		</div>
		<div class="comment">
		値段：￥<%=comment.getValue() %><br>
		</div>
		<div class="comment">
		<img src="/ramen/upload/<%=comment.getCommentPhoto() %>"><br>
		</div>
		<div class="comment">
		評価：<%=comment.getRate() %><br>
		</div>
		<div class="comment">
		<%=comment.getReview() %><br>
		</div>
		
<div class="button"><!-- button 戻るボタン -->
<input type="button"onclick="history.back()" value="戻る">
<input type="submit" value="登録">
</form>
</div>
</div>
</body>
</html>