<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録</title>
</head>
<body>
	<form action="shop-regist-confirm-servlet" method="post"enctype="multipart/form-data">
		店名入力：<input type="text" name="shopName"> <br>
		店名かな入力：<input type="text" name="shopKana"> <br>
		住所：<input type="text"name="address"> <br>
		開店時間：
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
		閉店時間：
		 <select name="closeTime">
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
    	定休日：<input type="text" name="closedDay"><br>
		詳細：<input type="text" name="detail"> <br>
		
		徒歩圏内：<input type="radio" name="walkingDistance" value="true">
		徒歩圏外：<input type="radio" name="walkingDistance" value="false">
		<br>
		写真：<input type="file" name="image">
		<br>
		<input type="submit" value="確認へ">
	</form>
	<button onclick="history.back()">戻る</button>

</body>
</html>