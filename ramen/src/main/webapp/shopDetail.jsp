<%--各店舗画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.Bean.UserBean"%>
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
	
	<%
	int roll = (Integer)request.getAttribute("roll");
	if(roll !=1){
	%>
		<form action="shop-edit-info" method="post">
			<input type="submit" value="編集">
		</form>
		
		<form action="shop-delete" method="post">
			<input type="submit" value="削除">
		</form>
	<%} %>
	
	<jsp:useBean id="shop"class="model.Bean.ShopBean"scope="session"/>
	<img class="photo"src=<jsp:getProperty name="shop" property="photo"/> alt="<jsp:getProperty name="shop" property="shopKana"/>+の店舗の写真"><br> 
	店名かな<jsp:getProperty name="shop" property="shopKana"/><br> 
	店名<jsp:getProperty name="shop" property="shopName"/><br> 
	住所<jsp:getProperty name="shop" property="address"/><br>
	営業時間<jsp:getProperty name="shop" property="openTime"/>～<jsp:getProperty name="shop" property="closeTime"/><br>
	定休日<jsp:getProperty name="shop" property="closedDay"/><br>
	詳細<jsp:getProperty name="shop" property="detail"/><br>
	
	<form action="comment-regist-confirm" method="post">
		<input type="submit" value="コメント投稿">
	</form>
	<%--ジャンルをfor文で回す --%>
	<form action="comment-search" method="post">
		<input type="text" name="userserch">
		<select name="genreserch">
			<option value=""></option>
		</select>
		<input type="submit" value="コメント検索">
	</form>

	
	
	<form action="comment-delete-confirm" method="post">
	<table>
		<% 
		String userName = (String)request.getAttribute("userName");
		String genreName = (String)request.getAttribute("genreName");
		ArrayList<CommentBean> commentList = (ArrayList<CommentBean>) request.getAttribute("commentList");
		for(int i = 1; i<commentList.size(); i++){
		CommentBean comment = commentList.get(i);
		%>
		
		<tr>
			<td><%=comment.getCommentTime()%></td>
			<td><%=comment.getCommentId()%></td>
			<td><img class = "commentphoto" src="<%=comment.getCommentPhoto()%>" alt="の写真"></td>
			<td><%=userName%></td>
			<td><%=comment.getRate()%></td>
			<td><%=genreName%></td>
			<td><%=comment.getMenu()%></td>
			<td><%=comment.getValue()%></td>
			<td><%=comment.getReview()%></td>	
			<%
			if(roll !=1){ 
			%>
					<td><input type="checkbox" name="delete" value="<%=comment.getCommentId()%>"></td>
			<%} %>
		</tr>
		<%} %>
	</table>
		<%
		if(roll !=1){ 
		%>
		<input type="submit" value="削除">
		<%} %>
	</form>
	
	
</body>
</html>