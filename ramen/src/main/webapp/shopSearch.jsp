<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Bean.ShopBean, model.Bean.GenreBean"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗検索・一覧</title>
<!--<link rel="stylesheet" href="css/shoplist.css">-->
<link rel="stylesheet" href="css/shopSearch.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
  var pagetop = $('.pagetop');
    $(window).scroll(function () {
       if ($(this).scrollTop() > 100) {
            pagetop.fadeIn();
       } else {
            pagetop.fadeOut();
            }
       });
       pagetop.click(function () {
           $('body, html').animate({ scrollTop: 0 }, 500);
              return false;
   });
});
</script>
</head>
<body>
<%
	int roll = (int)session.getAttribute("roll");
	if(roll==0){
%>
<%@include file = "header2.jsp" %>
<%	
	}else{
%>
<%@include file = "header.jsp" %>
<%
	}
%>

	<!--<div class="title"> title　タイトル -->
	<!--<h1>店舗検索・一覧</h1></div>-->
	<!--<div class="search"> search 検索フォーム全体 -->
<div class="shopsearchcontainer">
	<div class="searchtitle">
		<!-- searchtitle 検索タイトル -->
		<h2>店舗検索</h2>
	</div>


	<form action="shop-search-servlet" method="POST">
		<div class="searchcontainer">
		<div class="top">
		<a href="#shop">店舗一覧へ</a>
		</div>
			<div class="search">
				<!-- namesearch 店名入力 -->
				店舗名：<input type="text" name="shopName"
					value="<%=request.getAttribute("searchShopName") != null ? request.getAttribute("searchShopName") : ""%>"
					placeholder="店舗名を入力">
			</div>
			<br>

			<div class="search">
				<!-- areasearch 地域入力 -->
				 エリア：<input type="text" name="area"
					value="<%=request.getAttribute("searchArea") != null ? request.getAttribute("searchArea") : ""%>"
					placeholder="エリアを入力">
			</div>
			<br>


			<div class="search">

				<!-- 5/30追加分------------------------------------------------------------------------ -->
			
				ジャンル： 
				<select name="genreId">
					<option value="">ジャンル選択なし</option>
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
			<h2 id="shop">店舗一覧</h2>
		</div>
		<div class="list">
			<!-- list 一覧 -->
			<%
			List<ShopBean> shopList = (List<ShopBean>) request.getAttribute("shopList");
			if (shopList != null && !shopList.isEmpty()) {
			%>
			<div class="listdetail">
			<%
		
				for (int i = shopList.size() - 1; i >= 0; i--) {
		            ShopBean shop = shopList.get(i);
			%><br>
			
				<!-- listdetail 一店舗ごとのブロック -->
				<form action="shop-detail" method="post">
					
					<div class="shop-photo">
					<input type="image" src="/ramen/upload/<%=shop.getPhoto()%>">
					<input type="hidden" name="shopId" value="<%=shop.getShopId()%>"><br>
					</div>
					
					<div class="shop-info">
					<div class="shop-name">
					店舗名：
					<%=shop.getShopName()%></div><br>
					<!-- 5/30---------------------------------- -->
					<div class="genre">
					ジャンル：
                    <%
                    if (shop.getGenre() != null && !shop.getGenre().isEmpty()) {
                    %>
                    <%=shop.getGenre()%>
                    <%} else {%>
                    登録されていません
                    <%} %></div>
					<br>
					<!-- -------------------------------------- -->

					<div class="walk">
					<%
					if (shop.isWalkingDistance()) {
					%>
					徒歩圏内
					<%} else {%>
					徒歩圏外
					<%} %></div>
					</div>
				</form>
				<%} %>
			</div>
			<%}else{%>
			一致する内容がありません。
			<%} %>
		</div>
	</div>
	<p class="pagetop"><a href="#wrap">▲</a></p>
</div>
</body>
</html>