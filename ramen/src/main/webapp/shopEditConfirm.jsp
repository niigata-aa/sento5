<%--店舗編集確認画面--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.Bean.ShopBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗編集確認</title>
<link rel="stylesheet" href="css/shopEditConfirm.css">
</head>
<body>
<%@include file = "header.jsp" %>
	<%
	ShopBean editInfo = (ShopBean)session.getAttribute("editInfo"); 
	%>
	<h1>編集確認ページ</h1>
	<form action="shop-edit" method="post">
	<div class="shopeditconfirm"><!--ショップ編集確認一覧  -->
	<div class="editform">
	
	<div class="infoitem">
		店舗名:<div class="detaile">
		<%=editInfo.getShopName() %></div><br>
	</div>	
	
	<div class="infoitem">
		店舗名かな:<div class="detaile">
		<%=editInfo.getShopKana() %></div><br>
	</div>	
	
	<div class="infoitem">
		住所:<div class="detaile">
		<%=editInfo.getAddress() %></div><br>
	</div>	
	
	<div class="infoitem">
		開店時間:<div class="detaile">
		<%=editInfo.getOpenTime() %></div><br>
	</div>	
	
	<div class="infoitem">
		閉店時間:<div class="detaile">
		<%=editInfo.getCloseTime() %></div><br>
	</div>	
	
	<div class="infoitem">
		定休日:<div class="detaile">
		<%=editInfo.getClosedDay() %></div><br>
	</div>	
	
	<div class="infoitem">
		詳細:<div class="detaile">
		<%=editInfo.getDetail() %></div><br>
	</div>	
		
	<div class="infoitem">
	写真<div class="image">
	<img class="photo" src="/ramen/upload/<%=editInfo.getPhoto() %>" alt="店舗写真"></div><br>
	</div>
	
	<div class="edit"><!-- 登録ボタン -->
	<input type="submit" value="登録">
	</div>
	</div>
	</div>
	
	<div class="back"><!-- 戻るボタン -->
	<button type="button" onclick="history.back()">戻る</button>
	</div>
	
	</form>
	
</body>
</html>