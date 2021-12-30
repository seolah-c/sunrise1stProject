<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
		})
	
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form3" method="post" action="/board/update">
					<input type="hidden" name="board_num" value="${update.board_num}" readonly="readonly"/>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="board_title">제목</label><input type="text" id="board_title" name="board_title" value="${update.board_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="board_comment">내용</label><textarea id="board_comment" name="board_comment"><c:out value="${update.board_comment}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="creator">작성자</label><input type="text" id="creator" name="creator" value="${update.creator}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="create_time">작성날짜</label>
									<fmt:formatDate value="${update.create_time}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="submit" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>