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


</head>

<body>

	<div class="d-flex" id="wrapper">

		<jsp:include page="/WEB-INF/views/sidebar.jsp" />

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<jsp:include page="/WEB-INF/views/topbar.jsp" />

			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">봉사활동 게시판</h1>

				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">${vList.boardTitle}</h6>
					</div>
					<div class="card-body">
						제목 본문 조회수 지역 확인여부 마감일
						<form name="tx_editor_form" id="tx_editor_form"
							action="/corona/volunteer/write" method="post"
							accept-charset="utf-8">
							<jsp:include
								page="/WEB-INF/views/daumOpenEditor/editor_frame.jsp"></jsp:include>

							<div>
								<button id="submitBtn" type="button">전송</button>
							</div>
							<div>
								<button onclick='saveContent()'>SAMPLE - submit
									contents</button>
							</div>
							<!-- End: Saving Contents -->

							<!-- Sample: Loading Contents -->
							<textarea id="sample_contents_source" style="display: none;">
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	<p style="text-align: center;">
		<img src="http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8"
										class="tx-daum-image" style="clear: none; float: none;" />
	</p>﻿
	<p>
		<a href="http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644"><img
										src="snapshot/images/icon/p_gif_s.gif" /> editor_bi.gif</a>
	</p>
</textarea>

							<div>
								<button onclick='loadContent()'>SAMPLE - load contents
									to editor</button>
							</div>
							<!-- End: Loading Contents -->

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

	<script src="/corona/resources/daumOpenEditor/js/editor_loader.js"
		type="text/javascript" charset="utf-8"></script>
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

			/* 
			//$("#dataTable_wrapper > div.row:last-child > div:first-child").empty().remove();
			$("#dataTable_info").text("").css("padding-top", "0");
			$("<button class='btn btn-primary'>").text("글쓰기").appendTo("#dataTable_info");
			$("<div class='col-sm-12 col-md-5'>").attr({"id" : "btnArea"}).appendTo("#dataTable_wrapper > div.row:last-child");
			//$("<button>").text("글쓰기").appendTo("#btnArea");
			 */

			$("#submitBtn").on('click', function(){
				Editor.save();
				// '수정하기' 모드일 때, 다음과 같이 데이터를 다음오픈에디터에 대입할 수 있다. 
				// ${board}는 컨트롤러에서 넘어오는 게시판 객체, ${board.board_content}는 게시판 내용
				//if('${board!=null}'=='true') 
				//	Editor.modify({'content': '${board.board_content}'});

				$("#tx_editor_form").submit();
			})
		});
		//$.fn.DataTable.ext.pager.numbers_length = 9;
	</script>

	<script type="text/javascript">
		var config = {
			txHost : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
			txPath : '', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
			txService : 'sample', /* 수정필요없음. */
			txProject : 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
			initializedId : "", /* 대부분의 경우에 빈문자열 */
			wrapper : "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
			form : 'tx_editor_form' + "", /* 등록하기 위한 Form 이름 */
			txIconPath : "/corona/resources/daumOpenEditor/images/icon/editor/", /* 에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
			txDecoPath : "/corona/resources/daumOpenEditor/images/deco/contents/", /* 본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
			canvas : {
				exitEditor : { /* desc:'빠져 나오시려면 shift+b를 누르세요.', hotKey: { shiftKey:true, keyCode:66 }, nextElement: document.getElementsByTagName('button')[0] */},
				styles : {
					color : "#123456", /* 기본 글자색 */
					fontFamily : "굴림", /* 기본 글자체 */
					fontSize : "10pt", /* 기본 글자크기 */
					backgroundColor : "#fff", /*기본 배경색 */
					lineHeight : "1.5", /*기본 줄간격 */
					padding : "8px" /* 위지윅 영역의 여백 */
				},
				showGuideArea : false
			},
			events : {
				preventUnload : false
			},
			sidebar : {
				attachbox : {
					show : true,
					confirmForDeleteAll : true
				},
				// 이미지첨부 관련 추가 config 
				attacher : { 
					image : { 
						features : { left : 250, top : 65, width : 400, height : 190, scrollbars : 0 }, //팝업창 사이즈 
						popPageUrl : '/corona/daumOpenEditor/imagePopup' //팝업창 주소 
					},
					file:{ 
						features : { left : 250, top : 65, width : 400, height : 190, scrollbars : 0 }, // 팝업창 사이즈 
						popPageUrl:'/corona/daumOpenEditor/filePopup' // 팝업창 주소 
					}
				},
				capacity : { 
					maximum : 5*1024*1024 // 최대 첨부 용량 (5MB) 
				}
			},
			size : {
				contentWidth : 700
			/* 지정된 본문영역의 넓이가 있을 경우에 설정 */}
		};
		EditorJSLoader.ready(function(Editor) {
			var editor = new Editor(config);
		});
		function validForm(editor) {
			var validator = new Trex.Validator();
			var content = editor.getContent();
			if (!validator.exists(content)) {
				alert('내용을 입력하세요');
				return false;
			}
			return true;
		}
		function setForm(editor) {
			var i, input;
			var form = editor.getForm();
			var content = editor.getContent();

			// 본문 내용을 필드를 생성하여 값을 할당하는 부분
			var textarea = document.createElement('textarea');
			textarea.name = 'board_content'; //name값 수정
			textarea.value = content;
			form.createField(textarea);

			return true;
		}
	</script>

</body>

</html>