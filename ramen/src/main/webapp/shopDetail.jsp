<%--各店舗画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Bean.CommentBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>各店ページ</title>
</head>
<body>
	<form action="top.jsp" method="post">
		<input type="submit" value="トップ">
	</form>
	
	<form action="shoplist.jsp" method="post">
		<input type="submit" value="検索へ">
	</form>
	
	<h1>各店ページ</h1>
	
	<%if(管理者だったら){ %>
		<form action="shop-editinfo-servlet" method="post">
			<input type="submit" value="編集">
		</form>
		
		<form action="shop-delete-confirm-servlet" method="post">
			<input type="submit" value="削除">
		</form>
	<%} %>
	<img class="photo"src=<%%> alt="<% %>+の店舗の写真"><br> 
	店名かな<%=shopkana%><br> 
	店名<%=shopname%><br> 
	住所<%=address%><br> 
	営業時間<%=openTime%>～<%=closeTime%><br>
	定休日<%=closedDay %><br>
	詳細<%=detail%><br>
	
	<form action="comment-regist-confirm-servlet" method="post">
		<input type="submit" value="コメント投稿">
	</form>
	<%--ジャンルをfor文で回す --%>
	<form action="comment-search-servlet" method="post">
		<select name="genre">
			<option value=""></option>
		</select>
		<input type="submit" value="コメント検索">
	</form>

	<ul>
	<%
		List＜CommentBean＞ list = (List＜CommentBean＞) session.getAttribute("list"));
		if (list != null && list.size() != 0) {
	%>
	<% for(CommentBean shop : List){%>
		<li>
			<%shop.getCommentTime()%>
			<img class = "commentphoto" src="" alt=""><br>
			<%=ゆーざねーむ %>
			<%=shop.getRate() %>
			<%=shop.getGenre() %>
			<%=shop.getMenu() %>
			<%=shop.getValue() %>
			<%=shop.getReview() %>	
			<%if(管理者だったら){ %>
				<form action="comment-delete-confirm-servlet" method="post">
					<input type="submit" value="削除">
			</form>
			<%} %>
		</li>
	<%	} 
	｝
	%>
	</ul>
	
</body>
</html>