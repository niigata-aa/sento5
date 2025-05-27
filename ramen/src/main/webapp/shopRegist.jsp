<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店舗登録</title>
</head>
<body>
<form action="shop-regist-confirm-servlet" method="post">
店名入力<input type="text" name="shopName">
店名かな入力<input type="text" name="shopKana">
住所<input type="text" name="address">
開店時間<input type="number" name="openTime">
閉店時間<input type="number" name="endTime">
詳細<input type="text" name="detail">
写真<input type="file" >
ジャンル<select name="genre">
<option value="syoyu">醤油</option>
<option value="sio">塩</option>
<option value="miso">味噌</option>
<option value="seabura">背油</option>
<option value="tonnkotu">豚骨</option>
<option value="syougasyoyu">生姜醤油</option>
<option value="mabo">麻婆</option>
<option value="tanntannmenn">担々麵</option>
<option value="etc">その他</option>
</select>
</form>
<button onclick="history.back()" value="戻る"></button>
<button type="submit" value="確認へ"></button>
</body>
</html>