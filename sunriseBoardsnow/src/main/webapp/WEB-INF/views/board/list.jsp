<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>

<style type="text/css">
	 	<style>
			  table {
			    width: 100%;
			    border: 1px solid #444444;
			  }
			  
			  th, td ,tr {
			    border: 1px solid #444444;
			  }
			  
			  #header {
			  color : #6a5fb8;
			  }
			  
			  th {
			  width : 80px;
			  background-color : #e6d1e3;
			  }
			  
			  td {
			  text-align : center;
			  }
			
	 	</style>
</head>

<script type="text/javascript">
			$(document).ready(function(){
				
				// board/write 페이지로 이동
				$(".writeP_btn").on("click", function(){
					
					location.href = "/board/write";
				})
			})
		</script>

<body>
	<div id="root">
		<header id="header">
			<h1>게시판</h1>
		</header>

		<hr />

		<section id="container">
			<form role="form2" method="post" action="/board/write">
				<table>
						<tr id="trSize">
							<th>타입</th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>

						<c:forEach items="${list}" var="list">

							<tr>
								<td><c:out value="${list.board_type}" /></td>
								<td><c:out value="${list.board_num}" /></td>
								<td><a href="/board/read?board_num=${list.board_num}"><c:out
											value="${list.board_title}" /></a></td>
								<td><c:out value="${list.creator}" /></td>
								<td><fmt:formatDate value="${list.create_time}"
										pattern="yy/MM/dd" /></td>
							</tr>
						</c:forEach>
				</table>
			</form>
			<div>
			<button type="submit" class="writeP_btn">글 작성 페이지로 이동</button>	
			</div>
		</section>
		<hr />
	</div>
</body>
</html>