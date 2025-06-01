<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Bean.ShopBean, model.Bean.GenreBean"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗検索・一覧</title>
<link rel="stylesheet" href="css/shoplist.css">
</head>
<body>
<%@include file = "header.jsp" %>
	<!--<div class="title"> title　タイトル -->
	<!--<h1>店舗検索・一覧</h1></div>-->
	<!--<div class="search"> search 検索フォーム全体 -->

	<div class="searchtitle">
		<!-- searchtitle 検索タイトル -->
		<h2>店舗検索</h2>
	</div>


	<form action="shop-search-servlet" method="POST">
		<div class="searchcontainer">
			<div class="search">
				<!-- namesearch 店名入力 -->
				店舗名：<input type="text" name="shopName"
					value="<%=request.getAttribute("searchShopName") != null ? request.getAttribute("searchShopName") : ""%>"
					placeholder="店舗名を入力">
			</div>
			<br>

			<div class="search">
				<!-- areasearch 地域入力 -->
				> エリア：<input type="text" name="area"
					value="<%=request.getAttribute("searchArea") != null ? request.getAttribute("searchArea") : ""%>"
					placeholder="エリアを入力">
			</div>
			<br>


			<div class="search">

				<!-- 5/30追加分------------------------------------------------------------------------ -->
			
				ジャンル： 
				<select name="genreId">
					<option value="">選択してください</option>
					<%
					List<GenreBean> genreList = (List<GenreBean>) request.getAttribute("genreList");
					Integer searchGenreId = (Integer) request.getAttribute("searchGenreId");

					if (genreList != null) {
						for (GenreBean genre : genreList) {
							String selected = "";
							if (searchGenreId != null && searchGenreId.equals(genre.getGenreId())) {
						selected = "selected";
							}
					%>
					<option value="<%=genre.getGenreId()%>" <%=selected%>><%=genre.getGenreName()%></option>
					<%
					}
					}
					%>
				</select>
				<!-- ---------------------------------------------------------------------------------- -->

			</div>


			<div class="button">
				<input type="submit" value="検索">
			</div>
			<br>
		</div>
	</form>


	<div class="shoplistcontainer">
		<!-- shoplist 店舗一覧全体 -->

		<div class="listtitle">
			<!-- listtitle タイトル -->
			<h2>店舗一覧</h2>
		</div>
		<div class="list">
			<!-- list 一覧 -->
			<%
			List<ShopBean> shopList = (List<ShopBean>) request.getAttribute("shopList");
			if (shopList != null && !shopList.isEmpty()) {
			%>
			<%
			for (ShopBean shop : shopList) {
			%><br>
			<div class="listdetail">
				<!-- listdetail 一店舗ごとのブロック -->
				<form action="shop-detail" method="post">
					<%=shop.getShopName()%>
					<div class="shop-photo">
					<input type="image" src="/ramen/upload/<%=shop.getPhoto()%>">
					<input type="hidden" name="shopId" value="<%=shop.getShopId()%>"><br>
					</div>
					<!-- 5/30---------------------------------- -->
					ジャンル:
					<%
					if (shop.getGenre() != null && shop.getGenre().isEmpty())
					%>
					<%=shop.getGenre()%><br>
					<!-- -------------------------------------- -->

					<div class="walk">
					<%
					if (shop.isWalkingDistance()) {
					%>
					徒歩圏内
					<%} else {%>
					徒歩圏外
					<%} %></div>
				</form>
				<%} %>
			</div>
			<%}else{%>
			一致する内容がありません。
			<%} %>
		</div>
	</div>

</body>
</html>