<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">

    <title>코로나 119 - 관리 페이지</title>

	<link href="/corona/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<jsp:include page="/WEB-INF/views/ccss.jsp" />

	<link href="/corona/resources/assets/css/components/tabs-accordian/custom-tabs.css" rel="stylesheet" type="text/css">

	<link href="/corona/resources/assets/css/structure.css" rel="stylesheet" type="text/css">

	<link href="/corona/resources/assets/css/main.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" type="text/css" href="/corona/resources/plugins/table/datatable/datatables.css">
    <link rel="stylesheet" type="text/css" href="/corona/resources/plugins/table/datatable/dt-global_style.css">

	<link href="/corona/resources/assets/css/admin.css" rel="stylesheet" type="text/css">
	
	<link rel="stylesheet" href="/corona/resources/daumOpenEditor/css/editor.css" type="text/css" charset="utf-8" />
	<link href="/corona/resources/css/jquery-ui.css" rel="stylesheet">
	

</head>

<body>

	<jsp:useBean id="now" class="java.util.Date" scope="page" />
	<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy-MM-dd" /> 
    <div class="d-flex" id="wrapper">

        <!-- Page Content -->
        <div id="page-content-wrapper" style="margin:0 auto;">
			
            <div class="container-fluid">
			<div style="text-align:center;padding-bottom:20px;">
				<img src="/corona/resources/img/logo.png">
			</div>
			<div class="widget-content widget-content-area tab-justify-centered" id="adminContainer">

				<ul class="nav nav-tabs  mb-3 mt-3 justify-content-center" id="justifyCenterTab" role="tablist">
				    <li class="nav-item">
				        <a class="nav-link active" id="justify-center-notice-tab" data-toggle="tab" href="#justify-center-notice" role="tab" aria-controls="justify-center-notice" aria-selected="true">공지관리</a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" id="justify-center-member-tab" data-toggle="tab" href="#justify-center-member" role="tab" aria-controls="justify-center-member" aria-selected="false">회원관리</a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" id="justify-center-board-tab" data-toggle="tab" href="#justify-center-board" role="tab" aria-controls="justify-center-board" aria-selected="false">게시판관리</a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" id="justify-center-confirm-tab" data-toggle="tab" href="#justify-center-confirm" role="tab" aria-controls="justify-center-confirm" aria-selected="false">봉사활동 승인관리</a>
				    </li>
				</ul>
				
				<div class="tab-content" id="justifyCenterTabContent">
				
				    <div class="tab-pane fade show active" id="justify-center-notice" role="tabpanel" aria-labelledby="justify-center-notice-tab">
<!-- 				        <div class="media">
				            <img class="mr-3" src="assets/img/profile-32.jpeg" alt="Generic placeholder image">
				            <div class="media-body">
				                	공지
				            </div>
				          </div> -->
						<div class="widget-content widget-content-area br-6">
   							<div class="moveBlank"><a href="/corona/notice" target="_blank">공지사항게시판 새창 열기</a></div>
   							<div id="writeNoticeArea"><button id="writeBtn" class="btn btn-purple btn-sm">공지글 올리기</button></div>
    							
   							<div id="editorArea">
								<form name="tx_editor_form" id="tx_editor_form" action="/corona/notice/write" method="post" accept-charset="utf-8">
									<div class="noticeTitle">
										<input type="text" id="boardTitle" class="topInput" name="boardTitle" placeholder="제목을 입력해 주세요."/>
									</div>
									<jsp:include page="/WEB-INF/views/daumOpenEditor/editor_frame.jsp"></jsp:include>
									<div>
										<input id="submitBtn" class="btn btn-success" type="button" value="등록">
										<input id="cancelBtn" class="btn btn-secondary" type="button" value="취소">
									</div>
									
									<!-- End: Saving Contents -->
									
									<input type="hidden" id="memberNo" name="memberNo" value="${loginuser.memberNo}"/>
								</form>
   							
   							</div>
   							 
							<div id="tblNot">
							<jsp:include page="/WEB-INF/views/admin/anot.jsp"></jsp:include>
							</div>
                        </div>
                        
				    </div>
				
				
				
					<div class="tab-pane fade" id="justify-center-member" role="tabpanel" aria-labelledby="justify-center-member-tab">

						<div class="widget-content widget-content-area br-6">
							<div id="tblMem">
							<jsp:include page="/WEB-INF/views/admin/amem.jsp"></jsp:include>
							</div>
                        </div>
	
	

				    </div>

				    
				    <div class="tab-pane fade" id="justify-center-board" role="tabpanel" aria-labelledby="justify-center-board-tab">
                        <div class="widget-content widget-content-area br-6">
   							<div class="moveBlank"><a href="/corona/freeboard/free-list" target="_blank">자유게시판 새창 열기</a></div>
   							
							<div id="tblBor">
							<jsp:include page="/WEB-INF/views/admin/abor.jsp"></jsp:include>
							</div>

                        </div>

				    </div>
				    
				  	<div class="tab-pane fade" id="justify-center-confirm" role="tabpanel" aria-labelledby="justify-center-confirm-tab">
                        <div class="widget-content widget-content-area br-6">
                        	<div class="moveBlank"><a href="/corona/volunteer" target="_blank">봉사활동게시판 새창 열기</a></div>
                        	
                    		<div id="tblVol">
							<jsp:include page="/WEB-INF/views/admin/avol.jsp"></jsp:include>
							</div>

                        </div>
                        
				    </div>
				</div>

			</div>

            </div>
        </div>

        <!-- /#page-content-wrapper -->


    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap core JavaScript -->
	<script src="/corona/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
	<script src="/corona/resources/bootstrap/js/popper.min.js"></script>
	<script src="/corona/resources/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="/corona/resources/assets/js/app.js"></script>
    
    <!-- Page level plugins -->

    <!-- Page level custom scripts -->

    <script src="/corona/resources/plugins/table/datatable/datatables.js"></script>
    
   	<script src="/corona/resources/daumOpenEditor/js/editor_loader.js" type="text/javascript" charset="utf-8"></script>
	<script src="/corona/resources/js/jquery-ui.js"></script>
	<script src="/corona/resources/js/editor.js"></script>
   
    <script>
	$("#tblMem").load("/corona/admin/mem");
	$("#tblNot").load("/corona/admin/not");
	$("#tblBor").load("/corona/admin/bor");
	$("#tblVol").load("/corona/admin/vol");
	
	$('#writeBtn').on('click', function(){
		$('#editorArea').css({"display":"block"});
		$('#writeBtn').css({"display":"none"});
	});

	$("#submitBtn").on('click', function(){
		Editor.save();
	});
	$("#cancelBtn").on('click', function(){
		$('#editorArea').css({"display":"none"});
		$('#writeBtn').css({"display":"block"});
		$('#writeNoticeArea').css({"text-align":"-webkit-center"});
	});
	
	function banMember(member){
		if(!confirm(member + "번 멤버를 강퇴하겠습니까?")){
			return false;
		}
		var data = {"memberNo": member};
		$.ajax({
			"url": "/corona/admin/memberDelete",
			"method": "PUT",
			"data": JSON.stringify(data),
			"contentType": "application/json",
			"success": function(data, status, xhr){
				if(data == "success") {
					alert(member + "번 멤버의 탈퇴처리가 완료되었습니다.");
					$("#tblMem").load("/corona/admin/mem");
					//location.reload();
				} else {
					alert(member + "번 멤버의 탈퇴처리가 실패했습니다.");
				}
			},
			"error": function(xhr, status, err){
				alert("전송 에러");
			}
		});
	};
	function deleteNotice(notice){
		if(!confirm(notice + "번 공지를 삭제하겠습니까?")){
			return false;
		}
		var data = {"noticeNo": notice};
		$.ajax({
			"url": "/corona/admin/noticeDelete",
			"method": "PUT",
			"data": JSON.stringify(data),
			"contentType": "application/json",
			"success": function(data){
				if(data == "success") {
					alert(notice + "번 공지를 삭제하였습니다.");
					$("#tblNot").load("/corona/admin/not");
					//location.reload();
				} else {
					alert(notice + "번 공지 삭제에 실패했습니다.");
				}
			},
			"error": function(){
				alert("전송 에러");
			}
		});
	};
	function deleteBoard(board){
		if(!confirm(board + "번 게시글을 삭제하겠습니까?")){
			return false;
		}
		var data = {"boardNo": board};
		$.ajax({
			"url": "/corona/admin/boardDelete",
			"method": "PUT",
			"data": JSON.stringify(data),
			"contentType": "application/json",
			"success": function(data){
				if(data == "success") {
					alert(board + "번 게시글울 삭제하였습니다.");
					$("#tblBor").load("/corona/admin/bor");
					$("#tblVol").load("/corona/admin/vol");
					//location.reload();
				} else {
					alert(board + "번 게시글 삭제에 실패했습니다.");
				}
			},
			"error": function(){
				alert("전송 에러");
			}
		});
	};
	function volConfirm(vol){
		if(!confirm(vol + "번 게시글을 승인하겠습니까?")){
			return false;
		}
		var data = {"volNo": vol};
		$.ajax({
			"url": "/corona/admin/volConfirm",
			"method": "PUT",
			"data": JSON.stringify(data),
			"contentType": "application/json",
			"success": function(data){
				if(data == "success") {
					alert(vol + "번 게시글울 승인하였습니다.");
					$("#tblVol").load("/corona/admin/vol");
					//location.reload();
				} else {
					alert(vol + "번 게시글 승인에 실패했습니다.");
				}
			},
			"error": function(){
				alert("전송 에러");
			},
		});
	}
	
    </script>






	
	

</body>

</html>