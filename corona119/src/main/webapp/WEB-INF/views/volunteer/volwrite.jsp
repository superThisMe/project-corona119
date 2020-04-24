<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>

<!-- Bootstrap core CSS -->
<link href="/corona/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/corona/resources/css/simple-sidebar.css" rel="stylesheet">

<!-- Custom fonts for this template-->
<link
	href="/corona/resources/vendor/fontawesome-free-5.13.0-web/css/all.css"
	rel="stylesheet">
<!--load all styles -->

<!-- Custom styles for this template -->
<link href="/corona/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/corona/resources/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="/corona/resources/daumOpenEditor/css/editor.css" type="text/css"
	charset="utf-8" />
	
<link href="/corona/resources/css/common.css"
	rel="stylesheet">

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>

	<div class="d-flex" id="wrapper">

		<jsp:include page="/WEB-INF/views/sidebar.jsp" />

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<jsp:include page="/WEB-INF/views/topbar.jsp" />

			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800"></h1>

				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">봉사활동 모집 글쓰기${vList.boardTitle}</h6>
					</div>
					<div class="card-body">
						<form name="tx_editor_form" id="tx_editor_form"
							action="/corona/volunteer/write" method="post"
							accept-charset="utf-8">
							
							<div class="voltitle">
								<p>제목</p>
								<input type="text" id="boardTitle" name="boardTitle" />
							</div>
							<div class="volloc">
								<p>지역</p>
								<input type="text" id="volLocation" name="volLocation" autocomplete="off"/>
							</div>
							<div class="voldate">
								<p>모집마감</p>
								<input type="text" id="volDuedate" name="volDuedate" placeholder="2020-01-01" autocomplete="off"/>
							</div>
							<div class="voldate">
								<p>시작일</p>
								<input type="text" id="volWdate1" name="volWdate1" placeholder="2020-01-01" autocomplete="off"/>
							</div>
							<div class="voldate">
								<p>종료일</p>
								<input type="text" id="volWdate2" name="volWdate2" placeholder="2020-01-01" autocomplete="off"/>
							</div>							
							<jsp:include
								page="/WEB-INF/views/daumOpenEditor/editor_frame.jsp"></jsp:include>

							<div>
								<input id="submitBtn" class="btn btn-success" type="button" value="전송">
							</div>
							
							<!-- End: Saving Contents -->
							<div><button onclick='loadContent()'>SAMPLE - load contents to editor</button></div>
							
							<input type="hidden" id="volLocshort" name="volLocshort"/>
							<input type="hidden" id="volLocation2" name="volLocation2"/>
						</form>

					</div>
				</div>
			</div>
		</div>

		<!-- /#page-content-wrapper -->


	</div>
	<!-- /#wrapper -->

	<!-- Bootstrap core JavaScript -->
	<script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->

	<!-- Core plugin JavaScript-->
	<script src="/corona/resources/datatables/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
	<script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/corona/resources/datatables/datatables-demo.js"></script>
	<script src="/corona/resources/js/common.js"></script>
	<script src="/corona/resources/js/common-vol.js"></script>

	<script src="/corona/resources/daumOpenEditor/js/editor_loader.js"
		type="text/javascript" charset="utf-8"></script>
	
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/corona/resources/js/datepicker.js"></script>
	<script src="/corona/resources/js/editor.js"></script>
	

	<!-- <script src="/corona/resources/js/editor.js"></script> -->

	<!-- Menu Toggle Script -->
	<script>
	$(function() {
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
				if ($("#wrapper").hasClass("toggled")) {
					$("#menu-toggle").html("메뉴 열기");
				} else {
					$("#menu-toggle").html("메뉴 닫기");
				}
			});

			$(".voldate input").datepicker();

			$(".voldate input").focus(function(){
				$("#ui-datepicker-div").css("z-index", "100");
			})

			/* 
			//$("#dataTable_wrapper > div.row:last-child > div:first-child").empty().remove();
			$("#dataTable_info").text("").css("padding-top", "0");
			$("<button class='btn btn-primary'>").text("글쓰기").appendTo("#dataTable_info");
			$("<div class='col-sm-12 col-md-5'>").attr({"id" : "btnArea"}).appendTo("#dataTable_wrapper > div.row:last-child");
			//$("<button>").text("글쓰기").appendTo("#btnArea");
			 */

	    	$("#volList").on('click', function(){
	    		location.href="/corona/volunteer";
	    	})
		    				 
			$("#submitBtn").on('click', function(){
				Editor.save();
				// '수정하기' 모드일 때, 다음과 같이 데이터를 다음오픈에디터에 대입할 수 있다. 
				// ${board}는 컨트롤러에서 넘어오는 게시판 객체, ${board.board_content}는 게시판 내용
				//if('${board!=null}'=='true') 
				//	Editor.modify({'content': '${board.board_content}'});

				//saveContent()
				//$("#tx_editor_form").submit();
			})
		});
		//$.fn.DataTable.ext.pager.numbers_length = 9;
	</script>

	<script type="text/javascript">
	function loadContent() {
		var attachments = {};
		attachments['image'] = [];
		attachments['image'].push({
			'attacher': 'image',
			'data': {
				'imageurl': 'http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8',
				'filename': 'github.gif',
				'filesize': 59501,
				'originalurl': 'http://cfile273.uf.daum.net/original/2064CD374EE1ACCB0F15C8',
				'thumburl': 'http://cfile273.uf.daum.net/P150x100/2064CD374EE1ACCB0F15C8'
			}
		});
		attachments['file'] = [];
		attachments['file'].push({
			'attacher': 'file',
			'data': {
				'attachurl': 'http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644',
				'filemime': 'image/gif',
				'filename': 'editor_bi.gif',
				'filesize': 640
			}
		});
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content": document.getElementById("sample_contents_source") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
		});
	}
</script>


</body>

</html>