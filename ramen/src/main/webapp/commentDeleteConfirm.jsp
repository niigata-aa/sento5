<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,java.util.ArrayList,model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント削除確認</title>
</head>
<body>
	<h2>投稿削除ページ</h2>

	コメントID<%=request.getParameter("commentId") %><br> 
	カテゴリーID<%=request.getParameter("genreId")%><br>
	レビュー<%=request.getParameter("review")%><br>
	評価<%=request.getParameter("rate")%><br>
	写真<%=request.getParameter("commentphoto") %><br>
	投稿時間<%=request.getParameter("commentTime") %><br>
	メニュ<%=request.getParameter("menu")%><br>
	値段<%=request.getParameter("value")%><br>
	<button type="button" onclick="history.back()">戻る</button>
	<form action="coment-delete-servlet" method="post">
		<input type="submit" value="削除する"> 
		<input type="hidden"
			name="commentId" value="<%request.getParameter("commentId"); %>">
	</form>
	


</body>
</html>