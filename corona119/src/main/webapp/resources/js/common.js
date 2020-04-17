$(function() {
	$("#inputAddress").on('click', function(){
		goPopup();
	})
	
	$("#volList").on('click', function(){
		location.href="/corona/volunteer";
	})

});

//// 주소 API
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/corona/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1, addrDetail){
	console.log(roadAddrPart1);
	document.getElementById('signUp').memberAddr.value = roadAddrPart1;
	document.getElementById('signUp').memberAddrDetail.value = addrDetail;
}	


				
				
				
				
