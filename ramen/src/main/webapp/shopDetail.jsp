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
ShopBean shop = (ShopBean) session.getAttribute("shopdetail");
%>
<title><%=shop.getShopName()%></title>
<link rel="stylesheet" href="css/shopDetail.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var pagetop = $('.pagetop');
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				pagetop.fadeIn();
			} else {
				pagetop.fadeOut();
			}
		});
		pagetop.click(function() {
			$('body, html').animate({
				scrollTop : 0
			}, 500);
			return false;
		});
	});
</script>
</head>

<body>
	<%
	int roll = (int) session.getAttribute("roll");
	if (roll == 0) {
	%>
	<%@include file="header2.jsp"%>
	<%
	} else {
	%>
	<%@include file="header.jsp"%>
	<%
	}
	%>

	<div class="main-container">
		<div class="shop-container">
			<h1>
				<ruby><%=shop.getShopName()%><rt><%=shop.getShopKana()%></rt>
				</ruby>
			</h1>

			<div class="admin-button">
				<%
				if (roll == 0) {
				%>

				<form action="shop-edit-info" method="post">
					<input type="hidden" name="shopId" value="<%=shop.getShopId()%>">
					<input type="submit" value="編集">
				</form>

				<form action="shop-delete-confirm" method="post">
					<input type="hidden" name="shopId" value="<%=shop.getShopId()%>">
					<input type="submit" value="削除">
				</form>
				<%
				}
				%>
			</div>
			<div class="shop-info">
				<img class="photo" src="/ramen/upload/<%=shop.getPhoto()%>"
					alt="<%=shop.getShopName()%>+の店舗の写真"> <br>
				<h2>店舗情報</h2>
				<table>
					<tr>
						<th>店名</th>
						<td><%=shop.getShopName()%></td>
					</tr>
					<tr>
						<th>住所</th>
						<td><%=shop.getAddress()%></td>
					</tr>
					<tr>
						<th>営業時間</th>
						<td><%=shop.getOpenTime()%>～<%=shop.getCloseTime()%></td>
					</tr>
					<tr>
						<th>定休日</th>
						<td><%=shop.getClosedDay()%></td>>
					</tr>
					<tr>
						<th>詳細</th>
						<td><%=shop.getDetail()%></td>
					</tr>
				</table>
			</div>
			<div class="comment">
				<h2 class="section-title">コメント</h2>
				<div class="comment-menu">
					<form action="genre-list-servlet" method="post">
						<input type="submit" value="コメント投稿">
					</form>
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
						</select> <input type="submit" value="コメント検索"> <input type="hidden"
							name="shopId" value="<%=shop.getShopId()%>">
					</form>
				</div>

				<div class="comment-card">
					<%
				List<CommentBean> commentList = (List<CommentBean>) request.getAttribute("commentList");
				for (CommentBean comment : commentList) {
				%>
				<div class="comment-img">
					<img 
						src="/ramen/upload/<%=comment.getCommentPhoto()%>"
						alt="<%=comment.getMenu()%>の写真"> メニュ：<%=comment.getMenu()%><br>
				</div>
					値段：<%=comment.getValue()%>円<br> 評価：<%=comment.getRate()%>/5<br>
					ジャンル：<%=comment.getGenreId()%><br> レビュー<br>
					<%=comment.getReview()%><br> ユーザID：<%=comment.getUserId()%><br>

					<%} %>

					<%if(commentList==null){ %>
					コメントはありません。
					<%} %>
				</div>
				</div>
			</div>
			<p class="pagetop">
				<a href="#wrap">▲</a>
			</p>

		</div>
</body>
</html>