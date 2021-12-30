<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원가입</title>
<style>
#container {
width : 30%;
position: absolute;
  	top: 50%;
  	left: 50%;
  	transform: translate(-50%,-50%);
}
</style>
</head>
<script type="text/javascript">
	var isRun = false;
	$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/";
		})

		$("#submit").on("click", function() {
			if ($("#user_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#user_Id").focus();
				return false;
			}
			if ($("#user_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_pw").focus();
				return false;
			}
			if ($("#user_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}
			if ($("#user_phone1").val() == "") {
				alert("연락처를 입력해주세요.");
				$("#user_phone1").focus();
				return false;
			}
			if ($("#user_phone2").val() == "") {
				alert("연락처를 입력해주세요.");
				$("#user_phone2").focus();
				return false;
			}
			if ($("#user_phone3").val() == "") {
				alert("연락처를 입력해주세요.");
				$("#user_phone3").focus();
				return false;
			}
			if ($("#user_addr1").val() == "") {
				alert("주소를 입력해주세요.");
				$("#user_address").focus();
				return false;
			}
			if ($("#user_addr2").val() == "") {
				alert("주소를 입력해주세요.");
				$("#user_address").focus();
				return false;
			}
			if ($("#user_company").val() == "") {
				alert("소속을 입력해주세요.");
				$("#user_company").focus();
				return false;
			}
			
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
		});
	})

	function fn_idChk() {
		console.log("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");

		$.ajax({
			url : "/member/idChk",
			type : "post",
			dataType : "json",
			data : {
				"user_id" : $("#user_id").val()
			},
			success : function(data) {
				if (data == "1") {
					alert("중복된 아이디입니다.");
				} else if (data == "0") {

					console.log(data + "9999999999999999999999999");
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
		
		function fn_pTypes() {
			var pList;
			var param = {
				code_type : "phone"
			};
			
			$.ajax({
				url : "/member/phone",
				type : "post",
				contentType : 'application/json; charset=UTF-8',
				data : JSON.stringify(param),
				datatype : "json",
				
				success : function(data) {
					if(isRun == true) { 
						return; 
					} 
					isRun = true;
					pList = data;
					console.log(data.length);
					for(var i=0; i<data.length; i++){
						
						//selectbox 위치를 갖고온다. (id값으로)
						$("#user_phone1").append("<option value='"+data[i].code_name+"'>"+data[i].code_name+"</option>");

						console.log(data[i].code_id );//selectbox value에 이 값을 넣는다.
						console.log(data[i].code_name);//selectbox text부분에 이 값을 넣는다.
						
					}
				}
			})
		}
</script>
<body>
	<section id="container">
		<form action="/member/register" method="post">
			<div class="form-group has-feedback">
				<label class="control-label" for="user_id">아이디</label> <input
					class="form-control" type="text" id="user_id" name="user_id" />
				<button class="idChk" type="button" id="idChk" onclick="fn_idChk();"
					value="N">중복확인</button>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_pw">패스워드</label> <input
					class="form-control" type="text" id="user_pw" name="user_pw" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="phone_type">연락처</label> <select
					id="user_phone1" name="user_phone1" onclick="fn_pTypes();">
					<option value="">::번호 선택::</option>
				</select>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_phone2">연락처2</label> <input
					class="form-control" type="text" id="user_phone2"
					name="user_phone2" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_phone3">연락처3</label> <input
					class="form-control" type="text" id="user_phone3"
					name="user_phone3" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_addr1">주소</label> <input
					class="form-control" type="text" id="user_addr1" name="user_addr1" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_addr2">주소2</label> <input
					class="form-control" type="text" id="user_addr2" name="user_addr2" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="user_company">소속</label> <input
					class="form-control" type="text" id="user_company"
					name="user_company" />
			</div>
			
			<div class="form-group has-feedback">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="cancel btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

</body>

</html>