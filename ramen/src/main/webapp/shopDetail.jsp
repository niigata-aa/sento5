<%--各店舗画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Bean.UserBean"%>
<%@ page import="model.Bean.CommentBean,model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
	ShopBean shop = (ShopBean)session.getAttribute("shopdetail"); 
%>
<title><%=shop.getShopName() %></title>
</head>

<body>
<%@include file = "header.jsp" %>
	<form action="shop-list-servlet" method="post">
		<input type="submit" value="検索へ">
	</form>

	<h1><%=shop.getShopName() %></h1>

	<%
	int roll = (int)session.getAttribute("roll");
	if(roll==0){
	%>

	<form action="shop-edit-info" method="post">
		<input type="hidden" name = "shopId"value="<%= shop.getShopId() %>"> 
		<input type="submit" value="編集">
	</form>

	<form action="shop-delete-confirm" method="post">
		<input type="hidden" name="shopId"value="<%= shop.getShopId() %>"> 
		<input type="submit" value="削除">
	</form>
	<%} %>

	<img class="photo" src="/ramen/upload/<%=shop.getPhoto()%>"alt="<%=shop.getShopName() %>+の店舗の写真">
	<br> 
	店名かな:<%=shop.getShopKana() %><br> 
	店名:<%=shop.getShopName() %><br>
	住所:<%=shop.getAddress() %><br> 
	営業時間:<%=shop.getOpenTime() %>～<%=shop.getCloseTime() %><br>
	定休日:<%=shop.getClosedDay() %><br> 
	詳細:<%=shop.getDetail() %><br>

	<form action="genre-list-servlet" method="post">
	<input type ="submit" value = "コメント投稿">
	</form>
	<%--ジャンルをfor文で回す --%>

	<form action="coment-search-servlet" method="post">
		<select name="genreserch">
			<option value="0">選択してください</option>
			<option value="1">醤油</option>
			<option value="2">味噌</option>
			<option value="3">塩</option>
			<option value="4">背油</option>
			<option value="5">豚骨</option>
			<option value="6">生姜醤油</option>
			<option value="7">麻婆</option>
			<option value="8">担々麵</option>
			<option value="9">その他</option>
		</select> <input type="submit" value="コメント検索">
		<input type="hidden" name = "shopId"value="<%= shop.getShopId() %>"> 
	</form>
		<table>
		<tr><th>写真</th><th>評価</th><th>ジャンル</th><th>メニュー</th><th>値段</th><th>レビュー</th></tr>
			<% 
		List<CommentBean> commentList = (List<CommentBean>) request.getAttribute("commentList");
		for(CommentBean comment : commentList){
		%>
			
			<tr>
				<td><img class="commentphoto" 
				src="/ramen/upload/<%=comment.getCommentPhoto()%>"alt="<%=comment.getMenu()%>の写真"></td>
				<td><%=comment.getRate()%></td>
				<td><%=comment.getGenreId()%></td>
				<td><%=comment.getMenu()%></td>
				<td><%=comment.getValue()%></td>
				<td><%=comment.getReview()%></td>
				<%-- 
				<%if(roll==0){ %>
				<td>
					<form action="coment-delete-confirm-servlet" method="post">	
					<input type="hidden" name="commentId" value="<%=comment.getCommentId() %>">
					<input type="submit"  value="削除">
					</form>
				</td>
				<%} %>--%>
			</tr>
			
			
		<%} %>
			
		</table>
		<%if(commentList==null){ %>
			コメントされていません。
		<%} %>



</body>
</html>