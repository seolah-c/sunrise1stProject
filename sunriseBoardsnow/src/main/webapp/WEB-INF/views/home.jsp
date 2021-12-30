<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
		<!-- 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


 <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/sign-in/">

</head>

<style>
	#container {
	position: absolute;
  	top: 50%;
  	left: 50%;
  	transform: translate(-49%,-49%);
	}
	body {
	background-color: #dbc5da;}
	
	</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		
		$("#loginBtn").on("click", function(){
			console.log("test--");
			location.href="member/login?user_id="+$('#user_id').val()+ "&user_pw="+$('#user_pw').val();
		})

		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
		
		$("#goBoardBtn").on("click", function(){
			location.href="board/write";
		})
		
	})
</script>
<body>

<form id="container">
		<c:if test="${member == null}">
		
			<div>
				<label for="user_id">ID &nbsp;&nbsp;: </label>
				<input type="text" id="user_id" name="user_id">
			</div>
			
			<div>
				<label for="user_pw">PW : </label>
				<input type="password" id="user_pw" name="user_pw">
			</div>
			
			<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="loginBtn" type="button" type="submit">로그인</button>&nbsp;&nbsp;&nbsp;
				<button id="registerBtn" type="button" type="submit">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p><button id="goBoardBtn" type="button">게시판으로 이동</button></p>
				<p>${member.user_id}님 환영 합니다.</p>
				<button id="memberUpdateBtn" type="button">회원정보수정</button>
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>


		</form>
		
</body>

</html>