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
				var formObj = $("form[name='readForm']");
				
				// 수정 
				$(".update_btn").on("click", function(){
					formObj.attr("action", "/board/updateView");
					formObj.attr("method", "get");
					formObj.submit();				
				})
				
				// 삭제
				$(".delete_btn").on("click", function(){
					formObj.attr("action", "/board/delete");
					formObj.attr("method", "post");
					formObj.submit();
				})
				
				// 취소
				$(".list_btn").on("click", function(){
					
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
				<form name="readForm" role="form2" method="post">
					<input type="hidden" id="board_num" name="board_num" value="${read.board_num}" />
				</form>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="board_num">글 번호</label><input type="text" id="board_num" name="board_num" value="${read.board_num}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="board_title">제목</label><input type="text" id="board_title" name="board_title" value="${read.board_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="board_comment">내용</label><textarea id="board_comment" name="board_comment"><c:out value="${read.board_comment}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="creator">작성자</label><input type="text" id="creator" name="creator" value="${read.creator}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="create_time">작성날짜</label>
									<fmt:formatDate value="${read.create_time}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
			</section>
			<hr />
		</div>
	</body>
</html>
