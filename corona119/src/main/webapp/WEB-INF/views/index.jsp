<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>

    <!-- Bootstrap core CSS -->
    <link href="/corona/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/corona/resources/css/simple-sidebar.css" rel="stylesheet">

</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">
                <h1 class="mt-4">test text</h1>
                <p>Notice 테이블 상황 (임시)</p>
                <c:forEach items="${ notice }" var="nList">
                    ${ nList.noticeNo } | ${ nList.noticeTitle } | ${ nList.noticeContent } | ${ nList.noticeRegdate } |
                    ${ nList.noticeWriter }
                    <br>
                </c:forEach>
                <br>
                <p>The starting state of the menu will appear collapsed on smaller screens, and will appear
                    non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
                <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>. The top navbar is
                    optional, and just for demonstration. Just create an element with the <code>#menu-toggle</code> ID
                    which will toggle the menu when clicked.</p>
            </div>
        </div>

        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
    <script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
    
    <script src="/corona/resources/js/common.js"></script>
	<!-- Menu Toggle Script -->
	<script type="text/javascript">
	    $("#menu-toggle").click(function (e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("toggled");
	        if ($("#wrapper").hasClass("toggled")) {
	            $("#menu-toggle").html("메뉴 열기");
	        } else {
	            $("#menu-toggle").html("메뉴 닫기");
	        }
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
			document.getElementById('signUp').memberAddr.value = roadAddrPart1;
			document.getElementById('signUp').memberAddrDetail.value = addrDetail;
		}	
	</script>

</body>

</html>