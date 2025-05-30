<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.Bean.ShopBean,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップページ</title>
<link rel="stylesheet" href="css/top.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="menu">
		<div class="menubutton">
			<!-- mypage マイページボタン -->
			<input type="button" onclick="location.href='mypage.jsp'"
				value="マイページ">
		</div>

		<div class="menubutton">
			<!-- shopsearch 検索ボタン -->
			<form action="shop-list-servlet" method="post">
				<input type="submit" value="店舗検索">
			</form>
		</div>

		<div class="menubutton">
			<!-- shopregist 登録ボタン -->
			<input type="button" onclick="location.href='shopRegist.jsp'"
				value="店舗登録">
		</div>

	</div>
	<div class="ave-cotainer">
		<!-- ave-cotainer 評価のコンテナ -->
		<div class="ave">
			<!-- ave ランキングタイトル -->
			<h2>平均評価点ランキング</h2>
		</div>
	</div>

	<div class="rankcontainer">
		<!-- rankcontainer ランキングコンテナ -->

		<%
		List<ShopBean> shoprankList = (List<ShopBean>) request.getAttribute("shoprankList");
		int rank = 1;
		if (shoprankList == null || shoprankList.size() == 0) {
		%>
		<div class="notlist">
			<!-- notlist 何もなかった時 -->
			何もありません
		</div>
		<%
		} else {
		for (ShopBean shop : shoprankList) {
		%>
		<div class="rankbox">
			<!-- rankbox ランクごとの箱 -->
			第<%=rank%>位<br>
			<%=shop.getShopName()%><br> 
			平均評価点：
			<%=Math.floor(shop.getAverageRate() * 10) / 10%>点<br>
			<form action="shop-detail" method="POST">
			<div class="image">
				<input type="image" src="/ramen/upload/<%=shop.getPhoto()%>"
					alt="<%=shop.getPhoto()%>" title="<%=shop.getShopName()%>">
			</div>
				<input type="hidden" name="shopId" value="<%=shop.getShopId()%>">
			</form>
			<br>
		</div>

		<%
		rank += 1;
		}
		}
		%>


	</div>
</body>
</html>