<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Bean.ShopBean,java.util.List,java.util.ArrayList,model.Bean.CommentBean,model.Bean.GenreBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント投稿</title>
<link rel="stylesheet" href="css/commentform.css">
</head>
<body>
<%@include file = "header.jsp" %>
<% 
	ShopBean shop = (ShopBean)session.getAttribute("shopdetail");
%>
<div class="commentformtitle"><!-- title タイトル -->
<h2><%=shop.getShopName() %>コメント投稿</h2>
</div>
	<form action="comment-regist-confirm-servlet"method="post"enctype="multipart/form-data">
		<input type="hidden" name="shopId" value="<%=shop.getShopId() %>">
	<div class="commentcontainer"><!-- commentcontainer コメント確認 -->
	<div class="comment">
	メニュー:<input type="text" name="menu"maxlength="50"required><br>
	</div>
	<div class="comment">
	値段:<input type="number" max="99999"name="value"required ><br>
	</div>
	<div class="comment">
	写真:<input type="file"name="commentphoto"required><br>
	</div>
	<div class="comment">
	評価:
	<select name="rate"required>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select><br>
	</div>
	<div class="comment">
	ジャンル
	<select name="genreId" required>
           <option value="">選択してください</option>
           <%List<GenreBean> genreList = (List<GenreBean>) request.getAttribute("genreList"); %>
           <% 
               for(GenreBean genre : genreList) { %>
                   <option value="<%=genre.getGenreId()%>"><%=genre.getGenreName()%></option>
           <% 
           } %>
     </select>
     <br>
     </div>
     <div class="comment">
	レビュー：<textarea name="review" cols="40"rows="3"maxlength="300"required></textarea><br>
	</div>
	<br>
	
	<div class="button"><!-- buttonボタン群 -->
	<input type="button"onclick="history.back()" value="戻る">
	<input type="submit" value="登録">	
	</form>
	
	</div>
	</div>
</body>
</html>