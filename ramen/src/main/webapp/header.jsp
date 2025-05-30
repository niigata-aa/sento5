<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding= "UTF-8" %>

<link rel="stylesheet" href="css/header.css">

<div class="container">
<div class="topbutton"><!-- topbutton トップページボタン -->
<form action = "ranking-servlet" method = "POST">
<input type = "submit"  value = "トップページへ">
</form></div>
<div class = "rogo"><!-- ロゴのやつ --></div>
<form action="ranking-servlet" method="post">
			<input type="image" src="img/rogo2.png" >
			</form>
</div>
			

<!--<a href="#" id="triggerPost">Ra-share</a>-->
<!--    <script>-->
<!--        document.getElementById('triggerPost').addEventListener('click', function(event) {-->
<!--            event.preventDefault(); // リンクのデフォルト動作（GETリクエスト）をキャンセルだお-->

<!--            const url = "${pageContext.request.contextPath}/ranking-servlet"; // サーブレットのURLを指定-->

<!--            // 動的に <form> 要素を作成し、POST送信-->
<!--            const form = document.createElement('form');-->
<!--            form.method = 'POST'; // メソッドをPOSTに設定-->
<!--            form.action = url;     // 送信先URLを設定-->

<!--            document.body.appendChild(form); // フォームを一時的にDOMに追加-->
<!--            form.submit(); // フォームを送信-->

<!--            // フォームは送信後に不要になるため、削除しても構いません（省略可）-->
<!--            // form.remove();-->
<!--        });-->
<!--    </script>-->

<div class="name"><!-- name ユーザー名 -->
ログインユーザ：<%=session.getAttribute("userName") %></div>

<div class="outbutton"><!-- outbutton ログアウトボタン -->
<form action = "logout-servlet" method = "POST">
<input type = "submit"  value = "ログアウト">
</form></div>
</div>



