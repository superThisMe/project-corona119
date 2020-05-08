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
			<div>
			<pre>
		확인용 : ${ loginuser.memberName } 님
		관리자-01	회원리스트	■ 관리자 페이지에서 회원리스트 조회(검색, 삭제)
						■ 관리자는 회원 탈퇴 가능함		• 관리자만 조회가 가능함		• 회원리스트 조회		• 탈퇴정보는 살려둠
		관리자-02	공지사항		■ 관리자 페이지에서 공지사항 등록		• 관리자만 등록 가능함
		관리자-03	게시글 관리	■ 게시글 삭제 권한
						■ 신고 게시글 조회
						■ 봉사활동 게시글 승인			• 모든 게시글 삭제 권한 있음
			</pre>
			</div>
			<div class="widget-content widget-content-area tab-justify-centered" id="adminContainer">

				<ul class="nav nav-tabs  mb-3 mt-3 justify-content-center" id="justifyCenterTab" role="tablist">
				    <li class="nav-item">
				        <a class="nav-link active" id="justify-center-member-tab" data-toggle="tab" href="#justify-center-member" role="tab" aria-controls="justify-center-member" aria-selected="true">회원관리</a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" id="justify-center-notice-tab" data-toggle="tab" href="#justify-center-notice" role="tab" aria-controls="justify-center-notice" aria-selected="false">공지관리</a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" id="justify-center-board-tab" data-toggle="tab" href="#justify-center-board" role="tab" aria-controls="justify-center-board" aria-selected="false">게시판관리</a>
				    </li>
				    <li class="nav-item">
				        <a class="nav-link" id="justify-center-confirm-tab" data-toggle="tab" href="#justify-center-confirm" role="tab" aria-controls="justify-center-confirm" aria-selected="false">봉사활동 승인관리</a>
				    </li>
				</ul>
				
				<div class="tab-content" id="justifyCenterTabContent">
					<div class="tab-pane fade show active" id="justify-center-member" role="tabpanel" aria-labelledby="justify-center-member-tab">

						<div class="widget-content widget-content-area br-6">
							<div class="table-responsive mb-4 mt-4">
								<table id="zero-config" class="table table-hover" style="width:100%">
									<thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>이메일</th>
                                            <th>주소</th>
                                            <!-- <th>탈퇴여부</th> -->
                                            <th class="no-content"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${member}" var="mem">
                                    	<tr>
                                            <td>${mem.memberId}</td>
                                            <td>${mem.memberName}</td>
                                            <td>${mem.memberNickname}</td>
                                            <td>${mem.memberEmail}</td>
                                            <td>${mem.memberAddr} ${mem.memberAddrDetail}</td>
                                            <%-- <td>${mem.memberDeleted}</td> --%>
                                            <td><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle table-cancel" onClick="banMember(${mem.memberNo});"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15" ></line></svg></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
<!--                                     <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                            <th></th>
                                        </tr>
                                    </tfoot> -->
                                </table>
                            </div>
                        </div>
	
	

				    </div>
				    <div class="tab-pane fade" id="justify-center-notice" role="tabpanel" aria-labelledby="justify-center-notice-tab">
<!-- 				        <div class="media">
				            <img class="mr-3" src="assets/img/profile-32.jpeg" alt="Generic placeholder image">
				            <div class="media-body">
				                	공지
				            </div>
				          </div> -->
						<div class="widget-content widget-content-area br-6">
   							<div class="moveBlank"><a href="/corona/notice" target="_blank">공지사항게시판 새창 열기</a></div>
   							<div id="writeNoticeArea"><button id="writeBtn">공지글 올리기</button></div>
    							
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
   							 
                            <div class="table-responsive mb-4 mt-4">
                                <table id="zero-config-b1" class="table table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                        	<th>제목</th>
                                            <th>등록일</th>
                                            <th>조회수</th>
											<th>관리자번호</th>
                                            <th class="no-content"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${notice}" var="no">
                                    	<tr>
                                    		<td>
												<a href="/corona/notice/${no.boardNo}" target="_blank">
                               					<c:choose>
                        							<c:when test="${fn:length(no.boardTitle) > 25}">
                        								${ fn:substring(no.boardTitle,0,25) }...
                        							</c:when>
                        							<c:otherwise>${no.boardTitle}</c:otherwise>
                       							</c:choose>
                       							</a>
                       						</td>
                                            <td><fmt:formatDate value="${no.boardRegdate}" pattern="yyyy-MM-dd" /></td>
                                            <td>${no.boardCount}</td>
                                            <td>${no.memberNo}</td>
                                            <td><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle table-cancel" onClick="deleteNotice(${no.boardNo});"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15" ></line></svg></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
<!--
                                     <tfoot>
				                         <tr>
				                             <th>Name</th>
				                             <th>Position</th>
				                             <th>Office</th>
				                             <th>Age</th>
				                             <th>Start date</th>
				                             <th>Salary</th>
				                             <th></th>
				                         </tr>
                                    </tfoot>
 -->
                                </table>
                            </div>
                        </div>
                        
				    </div>
				    
				    <div class="tab-pane fade" id="justify-center-board" role="tabpanel" aria-labelledby="justify-center-board-tab">
                        <div class="widget-content widget-content-area br-6">
   							<div class="moveBlank"><a href="/corona/freeboard/free-list" target="_blank">자유게시판 새창 열기</a></div>
                            <div class="table-responsive mb-4 mt-4">
                                <table id="zero-config-b2" class="table table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                        	<th>카테고리</th>
                                            <th>글쓴이</th>
                                            <th>제목</th>
                                            <th>추천</th>
                                            <th>비추천</th>
                                            <th>조회수</th>
                                            <th>신고</th>
                                            <th class="no-content"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${board}" var="bo">
                                    	<tr>
                                    		<td>
                                    			<c:choose>
                                    				<c:when test="${bo.catNo eq 0}">뉴스&이슈</c:when>
                                    				<c:when test="${bo.catNo eq 2}">무료나눔</c:when>
                                    				<c:otherwise>자유게시판</c:otherwise>
                                    			</c:choose>
                                    		</td>
                                            <td>${bo.member.memberNickname}</td>
                                            <td>
                                            	<a href="/corona/freeboard/freeDetail?boardNo=${bo.boardNo}" target="_blank">
                               					<c:choose>
                        							<c:when test="${fn:length(bo.boardTitle) > 20}">
                        								${ fn:substring(bo.boardTitle,0,20) }...
                        							</c:when>
                        							<c:otherwise>${ bo.boardTitle }</c:otherwise>
                       							</c:choose>
                       							</a>
                                            </td>
                                            <td>${bo.boardReco}</td>
                                            <td>${bo.boardNreco}</td>
                                            <td>${bo.boardCount}</td>
                                            <td>${bo.boardSingo}</td>
                                            <td><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle table-cancel" onClick="deleteBoard(${bo.boardNo});"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15" ></line></svg></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
<!--
                                     <tfoot>
				                         <tr>
				                             <th>Name</th>
				                             <th>Position</th>
				                             <th>Office</th>
				                             <th>Age</th>
				                             <th>Start date</th>
				                             <th>Salary</th>
				                             <th></th>
				                         </tr>
                                    </tfoot>
 -->
                                </table>
                            </div>
                        </div>

				    </div>
				    
				  	<div class="tab-pane fade" id="justify-center-confirm" role="tabpanel" aria-labelledby="justify-center-confirm-tab">
                        <div class="widget-content widget-content-area br-6">
                        	<div class="moveBlank"><a href="/corona/volunteer" target="_blank">봉사활동게시판 새창 열기</a></div>
                            <div class="table-responsive mb-4 mt-4">
                                <table id="zero-config-b3" class="table table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                        	<th>제목</th>
                                            <th>작성자</th>
                                            <th>지역구</th>
                                            <th>마감일</th>
                                            <th>추천</th>
                                            <th>비추천</th>
                                            <th>신고</th>
                                            <th>승인</th>
                                            <th class="no-content"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${volunteer}" var="vol">
                                    	<tr>
											<td>
												<a href="/corona/volunteer/detail/${vol.boardNo}" target="_blank">
                               					<c:choose>
                        							<c:when test="${fn:length(vol.boardTitle) > 19}">
                        								${ fn:substring(vol.boardTitle,0,19) }...
                        							</c:when>
                        							<c:otherwise>${ vol.boardTitle }</c:otherwise>
                       							</c:choose>
                       							</a>
                                            </td>
                                            <td>${vol.member.memberNickname}</td>
                                            <td>${vol.volunteers.volLocshort}</td>
                                            <td><fmt:formatDate value="${vol.volunteers.volDuedate}" pattern="yyyy-MM-dd" /></td>
                                            <td>${vol.boardReco}</td>
                                            <td>${vol.boardNreco}</td>
                                            <td>${vol.boardSingo}</td>
                                            <td>
                                            	<c:choose>
                                            		<c:when test="${!vol.volunteers.volConfirm}">
                                            			<a href="#" onclick="volConfirm(${vol.boardNo});">${vol.volunteers.volConfirm}</a>
                                            		</c:when>
                                            		<c:otherwise>
                                            			${vol.volunteers.volConfirm}
                                            		</c:otherwise>
                                            	</c:choose>
                                            </td>
                                            <td><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-circle table-cancel" onClick="deleteBoard(${vol.boardNo});"><circle cx="12" cy="12" r="10"></circle><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15" ></line></svg></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
<!--
                                     <tfoot>
				                         <tr>
				                             <th>Name</th>
				                             <th>Position</th>
				                             <th>Office</th>
				                             <th>Age</th>
				                             <th>Start date</th>
				                             <th>Salary</th>
				                             <th></th>
				                         </tr>
                                    </tfoot>
 -->
                                </table>
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
	$('#zero-config').DataTable({
        "oLanguage": {
            "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
            "sInfo": "총 _PAGES_페이지 중 _PAGE_페이지",
			"sInfoEmpty" : "",
			"sInfoFiltered" : "",
            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            "sSearchPlaceholder": "검색어",
			"sZeroRecords": "조회된 결과가 없습니다",
			"sEmptyTable": "등록된 글이 없습니다",
			"sLengthMenu": "표시할 회원 수 :  _MENU_"
        },
        "stripeClasses": [],
        "lengthMenu": [7, 10, 20, 50],
        "pageLength": 7 
	});

	$("table[id^='zero-config-b']").DataTable({
        "oLanguage": {
            "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
            "sInfo": "총 _PAGES_페이지 중 _PAGE_페이지",
			"sInfoEmpty" : "",
			"sInfoFiltered" : "",
            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            "sSearchPlaceholder": "검색어",
			"sZeroRecords": "조회된 결과가 없습니다",
			"sEmptyTable": "등록된 글이 없습니다",
			"sLengthMenu": "표시할 글 수 :  _MENU_"
        },
        "stripeClasses": [],
        "lengthMenu": [10, 20, 50, 100],
        "pageLength": 10
	});

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
					location.reload();
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
					location.reload();
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
					location.reload();
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
					location.reload();
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