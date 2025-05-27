<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント一覧</title>
</head>
<body>
	<form action="mypqge.jsp" method="post">
		<input type="submit" value="戻る">
	</form>
	<% List<String>commentList=(List)session.getAttribute("commentList");%>
	<%for(String comment:commentList){ %>
		<%=comment%><br>
	
	<form action="CommentDelete" method="post">
		<input type="submit" value="削除">
		</form>
	<%} %>
</body>
</html>