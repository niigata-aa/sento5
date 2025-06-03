<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,java.util.ArrayList,model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント削除確認</title>
<link rel="stylesheet" href="css/commentform.css">
</head>
<body>
	<%@include file = "header.jsp" %>
	<div class="commentformtitle"><!-- title タイトル -->
	<h2>投稿削除ページ</h2>
	</div>
	<form action="coment-delete-servlet" method="post">
	<div class="commentcontainer"><!-- commentcontainer コメント確認 -->
	<div class="comment">
	コメントID：<%=session.getAttribute("commentId") %><br> 
	</div>
	<div class="comment">
	店舗名：<%=session.getAttribute("shopName")%><br>
	</div>
	<div class="comment">
	カテゴリーID：<%=request.getParameter("genreId")%><br>
	</div>
	<div class="comment">
	レビュー：<%=request.getParameter("review")%><br>
	</div>
	<div class="comment">
	評価：<%=request.getParameter("rate")%><br>
	</div>
	<div class="comment">
	写真：
	<img src="/ramen/upload/<%=request.getParameter("commentphoto") %>"><br>
	</div>
	<div class="comment">
	メニュー：<%=request.getParameter("menu")%><br>
	</div>
	<div class="comment">
	値段：<%=request.getParameter("value")%><br>
	</div>
	
	<div class="button"><!-- ボタン群 -->
	<input type="button"onclick="history.back()" value="戻る">
	<input type="submit" value="削除する"> 
	<input type="hidden" name="commentId" value="<%request.getParameter("commentId"); %>">
	</form>
	</div>
	</div>
	


</body>
</html>
