$(function(){
	var memberId = $('#memberId').val();
	var memberEmail = $('#memberEmail').val();
	var memberName = $('#memberName').val();
	var memberNickname = $('#memberNickname').val();
	var inputAddress = $("#inputAddress").val();
	var inputAddress2 = $("#inputAddress2").val();
	var idJ = /^[a-z0-9]{3,12}$/;
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]*\.[a-zA-Z]{2,4}$/i;
	var nameJ = /^[가-힣]{2,50}$/i;
	var nickJ = /^[가-힣0-9a-zA-Z]{2,20}$/;
	var a = false, b = false, c = false, d = false, e = false;
	
	$("#memberId").on('keyup', function() {
		memberId = $('#memberId').val();
		memberEmail = $('#memberEmail').val();
		memberName = $('#memberName').val();
		memberNickname = $('#memberNickname').val();
		inputAddress = $('#inputAddress').val();
		$.ajax({
			url: '/corona/check/id',
			method: 'POST',
			data: {'memberId': memberId},
			success: function(data) {
				if (data == '1') {
					$("#idCheck").text("사용 중인 아이디입니다");
					$("#idCheck").css("color", "red");
					a = false;
					$("#reg_submit").attr("disabled", true);
				} else {
					if(idJ.test(memberId)){
						$("#idCheck").text("");
						a = true;
						(a && b && c && d) ? e = true : e = false;
						if (e){
							$("#reg_submit").attr("disabled", false);
						}
					} else if(memberId == ""){
						$('#idCheck').text('아이디를 입력해주세요');
						$('#idCheck').css('color', 'red');
						a = false;
						$("#reg_submit").attr("disabled", true);
					} else {
						$('#idCheck').text("소문자와 숫자 3~12자리만 가능합니다");
						$('#idCheck').css('color', 'red');
						a = false;
						$("#reg_submit").attr("disabled", true);
					}
				}
			},
			error: function() {
					console.log("실패");
			}
		});
	});

	$("#memberEmail").on('keyup', function() {
		memberId = $('#memberId').val();
		memberEmail = $('#memberEmail').val();
		memberName = $('#memberName').val();
		memberNickname = $('#memberNickname').val();
		inputAddress = $('#inputAddress').val();
		$.ajax({
			url: '/corona/check/email',
			method: 'POST',
			data: {'memberEmail': memberEmail},
			success: function(data) {
				if (data == '1') {
					$("#emailCheck").text("이미 등록된 이메일입니다");
					$("#emailCheck").css("color", "red");
					b = false;
					$("#reg_submit").attr("disabled", true);
				} else {
					if(regExp.test(memberEmail)){
						$("#emailCheck").text("");
						b = true;
						(a && b && c && d) ? e = true : e = false;
						if (e){
							$("#reg_submit").attr("disabled", false);
						}
					} else if(memberEmail == ""){
						$('#emailCheck').text('이메일을 입력해주세요');
						$('#emailCheck').css('color', 'red');
						b = false;
						$("#reg_submit").attr("disabled", true);
					} else {
						$('#emailCheck').text("등록 불가능한 이메일 주소입니다");
						$('#emailCheck').css('color', 'red');
						b = false;
						$("#reg_submit").attr("disabled", true);
					}
				}
			},
			error: function() {
					console.log("실패");
			}
		});
	});

	$("#memberName").on('keyup', function() {
		memberId = $('#memberId').val();
		memberEmail = $('#memberEmail').val();
		memberName = $('#memberName').val();
		memberNickname = $('#memberNickname').val();
		inputAddress = $('#inputAddress').val();
		if(nameJ.test(memberName)){
			$("#nameCheck").text("");
			c = true;
			(a && b && c && d) ? e = true : e = false;
			if (e){
				$("#reg_submit").attr("disabled", false);
			}
		} else if(memberName == ""){
			$('#nameCheck').text('이름을 입력해주세요');
			$('#nameCheck').css('color', 'red');
			c = false;
			$("#reg_submit").attr("disabled", true);
		} else {
			$('#nameCheck').text("한글 2글자부터 입력 가능합니다");
			$('#nameCheck').css('color', 'red');
			c = false;
			$("#reg_submit").attr("disabled", true);
		}
	});

	$("#memberNickname").on('keyup', function() {
		memberId = $('#memberId').val();
		memberEmail = $('#memberEmail').val();
		memberName = $('#memberName').val();
		memberNickname = $('#memberNickname').val();
		inputAddress = $('#inputAddress').val();
		$.ajax({
			url: '/corona/check/nick',
			method: 'POST',
			data: {'memberNickname': memberNickname},
			success: function(data) {
				if (data == '1') {
					$("#nickCheck").text("사용 중인 닉네임입니다");
					$("#nickCheck").css("color", "red");
					d = false;
					$("#reg_submit").attr("disabled", true);
				} else {
					if(nickJ.test(memberNickname)){
						$("#nickCheck").text("");
						d = true;
						(a && b && c && d) ? e = true : e = false;
						if (e){
							$("#reg_submit").attr("disabled", false);
						}
					} else if(memberNickname == ""){
						$('#nickCheck').text('닉네임을 입력해주세요');
						$('#nickCheck').css('color', 'red');
						d = false;
						$("#reg_submit").attr("disabled", true);
					} else {
						$('#nickCheck').text("2글자부터 한글,영문,숫자만 가능합니다");
						$('#nickCheck').css('color', 'red');
						d = false;
						$("#reg_submit").attr("disabled", true);
					}
				}
			},
			error: function() {
					console.log("실패");
			}
		});
	});

	$("#reg_submit").on('click', function(event) {
		var memberPsw = $("#memberPsw").val();
		inputAddress = $("#inputAddress").val();
		if (memberPsw == "") {
			event.preventDefault();
			alert("비밀번호를 입력해주세요");
		} else if(inputAddress == "") {
			event.preventDefault();
			alert("주소를 입력해주세요");
		} else {
			alert("회원가입이 완료되었습니다");
		}
	});

});