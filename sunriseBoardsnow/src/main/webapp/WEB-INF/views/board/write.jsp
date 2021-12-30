<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
			
			  label {
				  display: inline-block;
				  width: 100px;
				  text-align: center;
				}
				
				#board_comment {
				margin-top: 10px;
				height: 300px;
				}
				
				#board_comment1 {
				border: hidden;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				height: 100%;
				margin: auto;
				}
				
				#board_title, #board_comment,#creator{
				width: 390px;
				margin-left: 5px;
				}
				
				#select_board {
				margin-left: 7px;
				]}
				#header {
				color: #6a5fb8;
				}
	 	</style>
	 	
	</head>
	<script type="text/javascript">
	var isRun = false;
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$("#write").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		
			
		//var dataList = getDataList(); //ajax사용하여 가져오기
		var $select = $('select #select_board');
		for (var i = 0; i < dataList.length; i++) {
			var data= dataList[i];
			var $option = $('<option>')
			$option.attr('value', i);
			$option.text(data);
			$select.append($option);
		}
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		function fn_bTypes() {
			var bList;
			var param = {
				code_type : "menu"
			};
			
			$.ajax({
				url : "/member/menu",
				type : "post",
				contentType : 'application/json; charset=UTF-8',
				data : JSON.stringify(param),
				datatype : "json",
				
				success : function(data) {
					if(isRun == true) { 
						return; 
					} 
					isRun = true;
					bList = data;
					console.log(data.length);
					for(var i=0; i<data.length; i++){
						
						//selectbox 위치를 갖고온다. (id값으로)
						$("#board_type").append("<option value='"+data[i].code_id+"'>"+data[i].code_name+"</option>");

						console.log(data[i].code_id );//selectbox value에 이 값을 넣는다.
						console.log(data[i].code_name);//selectbox text부분에 이 값을 넣는다.
						
					}
				}
			})
		}
		

	</script>
	
		<div id="root">
			<header>
				<h1 id="header"> 게시판</h1>
			</header>
			
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
			<form name="writeForm" method="post" action="/board/write">
					<table  >
						<tbody>
							<c:if test="${member.user_id != null}">
								<tr >
									<td>
										<label for="board_type">타입</label></td>
										<td><select id="board_type" name="board_type" onclick="fn_bTypes();">
											  <option value="">::게시판 타입::</option>
											</select>
										</td>
								</tr>
								<tr>
									<td>
										<label for="board_title">제목</label></td>
										<td><input type="text" id="board_title" name="board_title" class="chk" title="제목을 입력하세요."/>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="board_comment" id="board_comment1">내용</label>
										<td><textarea id="board_comment" name="board_comment" class="chk" title="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="creator">작성자</label></td><td><input type="text" id="creator" name="creator" class="chk" title="작성자를 입력하세요." value="${member.user_id}" />
									</td>
								</tr>
								
							</c:if>
							<c:if test="${member.user_id == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if>
							<tr align="right"><td colspan="2">
								<button class="btn btn-success" type="submit" id="write">작성</button>&nbsp;&nbsp;<button class="cancel btn btn-danger" type="button">취소</button>&nbsp;&nbsp;
								</td>
							</tr>
						</tbody>			
					</table>
					
				</form>
				
			</section>
			
			<hr />
		</div>
		
	</body>
</html>