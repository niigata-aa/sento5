<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
<link rel="stylesheet" href="css/mypage.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="title">
		<!-- title タイトル -->
		<h1>マイページ</h1>
	</div>

	<div class="contaner">
		
		<!-- comment 	コメント一覧 -->
		<form action="coment-list-servlet" method="POST">
			<input type="hidden" name="userId"
				value="<%=session.getAttribute("userId")%>"> 
				<button
				type="submit" value="コメント一覧">コメント一覧</button>
		</form>

		<button type="button" onclick="history.back()" >戻る</button>
	
	</div>
</body>
</html>