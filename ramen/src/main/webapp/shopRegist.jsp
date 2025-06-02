<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録</title>
<link rel="stylesheet" href="css/shopRegist.css">
</head>
<body>
<%@include file = "header.jsp" %>
<div class="shopregist"> <!-- ショップ登録まとめ-->
	<form action="shop-regist-confirm-servlet" method="post"enctype="multipart/form-data">
		店名入力<div class="mast">※入力必須</div><input type="text" name="shopName"maxlength="50"required> <br>
		店名かな入力<div class="mast">※入力必須</div><input type="text" name="shopKana"maxlength="50"required> <br>
		住所<div class="mast">※入力必須</div><input type="text"name="address"maxlength="50"required> <br>
		開店時間
		<input type="time" name="openTime"><br>
		<%-- 
		 <select name="openTime">
        <%
        for (int h = 0; h < 24; h++) {
            for (int m = 0; m < 60; m += 30) {
                // 時と分を2桁表示にフォーマット
                String hour = String.format("%02d", h);
                String minute = String.format("%02d", m);

                String timeValue = hour + ":" + minute;
        %>
                <option value="<%= timeValue %>"><%= timeValue %></option>
        <%
            }
        }
        %>
    </select><br>
    --%>
		閉店時間<input type="time" name="closeTime"><br>

    	定休日<input type="text" name="closedDay"maxlength="50"><br>
		詳細<input type="text" name="detail"maxlength="200"> <br>
		
		<!--修正分-->
		<div class="walk">
		徒歩圏内<input type="radio" name="walkDistance" value="true" checked>
		徒歩圏外<input type="radio" name="walkDistance" value="false">
		<!----></div>
		<br>
		写真<div class="mast">※要アップロード</div><input type="file" name="image"required>
		<br>
		<input type="submit" value="確認へ">
	</form>
	</div>
	
	<div class="back"><!-- 戻るボタン -->
	<button onclick="history.back()">戻る</button>
	</div>

</body>
</html>