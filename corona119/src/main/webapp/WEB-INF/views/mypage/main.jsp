<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>코로나 119 - 신종 코로나 바이러스 종합 정보 포털</title>

	<jsp:include page="/WEB-INF/views/ccss.jsp" />

</head>

<body>

    <div class="d-flex" id="wrapper">

        <jsp:include page="/WEB-INF/views/sidebar.jsp" />

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <jsp:include page="/WEB-INF/views/topbar.jsp" />

            <div class="container-fluid">
            
            	<br>
            
            	<table width="100%" border="1" align="center" cellpadding="0"cellspacing="1">
            		<tbody>
                	<tr>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">회원 가입일</td>
	                	<td>&nbsp&nbsp<fmt:formatDate value="${ myInfo.memberRegdate }" pattern="yyyy.MM.dd"/></td>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">보유 포인트</td>
	                	<td>&nbsp&nbsp${myInfo.memberPoint }</td>
                	</tr>
                	<tr>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">회원 정보 수정</td>
	                	<td>&nbsp&nbsp<a id="myInfoUpdate" href="javascript:void(0);">회원 정보 수정하기</a></td>
	                	<td width="120" align="center" bgcolor="eeeeee" height="30">회원 탈퇴</td>
	                	<td>&nbsp&nbsp<a id="memberDel" href="javascript:void(0);">회원탈퇴하기</a></td>
                	</tr>
                	</tbody>
                </table>
                
				<br>
			
				<table width="100%" border="0" align="center" cellpadding="0"cellspacing="1">
					<tbody>
					<tr>
					<td width="50%" valign="top" align="left">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0">
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 작성한 게시물 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href="/corona/mypage/myBoardAll?memberNo=${ myInfo.memberNo }">더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												
													<c:forEach items="${ myBoard }" var="myBoard">
													
                                						<tr>
						                                	<td width="60px">[${ myBoard.category.category }] 
						                                        
						                                    </td>
						                                    <td>
						                                    	<a href="/corona/freeboard/freeDetail?boardNo=${ myBoard.boardNo }">${ myBoard.boardTitle }</a>
						                                   </td> 
						                                   <td width="60px">
						                                   		<fmt:formatDate value="${ myBoard.boardRegdate }" pattern="yyyy.MM.dd"/>
						                                   </td> 
					                                    </tr>
					                                    
					                                </c:forEach>
													
											</tbody>
										
										</table>

									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="10"></td>
					<td valign="top">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0" >
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 작성한 댓글 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href="/corona/mypage/myReplyAll?memberNo=${ myInfo.memberNo }">더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												
													<c:forEach items="${ myReply }" var="myReply">
													
                                						<tr>
						                                	<td>
						                                    	<a href="#">${ myReply.reply }</a>
						                                   </td> 
						                                   <td width="60px">
						                                   		<fmt:formatDate value="${ myReply.replyDate }" pattern="yyyy.MM.dd"/>
						                                   </td> 
					                                    </tr>
					                                    
					                                </c:forEach>
													
											</tbody>
										
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr>
					
					<tr height="10px"></tr>
					
					<tr>
					<td valign="top" align="left">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0">
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 스크랩 한 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href=#>더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>작성된 글이 없습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="10"></td>
					<td valign="top">
						<table width="100%" border="1" align="center" cellpadding="0"cellspacing="0">
							<tbody>
								<tr>
									<td style="position:relative;" bgcolor="eeeeee">
									<div>내가 보낸 쪽지 목록</div>
									<span style="position:absolute; right:10px; top:1px;">
										<a href=#>더보기</a>
									</span>
									</td>
								</tr>
								<tr>
									<td>작성된 글이 없습니다.
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					</tr>
					</tbody>
				</table>
				
              
            </div>
        </div>
		
		
		
		
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
<!-- Modal 1 -->
	<div class="modal fade" id="upRegisterModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	    aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="exampleModalLabel">회원 정보 수정</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <form id="upReg" action="/corona/account/upReg" method="POST">
	                    <div class="form-row">
	                        <div class="form-group col-md-6">
	                            <label for="inputId">아이디</label> <input type="text" class="form-control" id="memberId"
	                                name="memberId" maxlength="12"><span id="idCheck"></span>
	                        </div>
	                        <div class="form-group col-md-6">
	                            <label for="inputPassword">비밀번호</label> <input type="password" class="form-control"
	                                id="memberPsw" name="memberPsw" maxlength="20" required>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="inputEmail">이메일</label> <input type="email" class="form-control" id="memberEmail"
	                            name="memberEmail" placeholder="1234@abcd.com" required><span id="emailCheck"></span>
	                    </div>
	                    <div class="form-row">
	                        <div class="form-group col-md-6">
	                            <label for="inputName">이름</label> <input type="text" class="form-control" id="memberName"
	                                name="memberName" maxlength="50" required><span id="nameCheck"></span>
	                        </div>
	                        <div class="form-group col-md-6">
	                            <label for="inputNickname">닉네임</label> <input type="text" class="form-control"
	                                id="memberNickname" name="memberNickname" maxlength="20" required><span id="nickCheck"></span>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label for="inputAddress">주소</label> <input type="text" class="form-control"
	                            id="inputAddress" name="memberAddr" placeholder="서울특별시 구로구 시흥대로" required>
	                            
	                    </div>
	                    <div class="form-group">
	                        <label for="inputAddress2">상세주소</label> <input type="text" class="form-control"
	                            id="inputAddress2" name="memberAddrDetail" placeholder="">
	                    </div>
	                    <!-- 
	                    <div class="form-row">
	                        <div class="form-group col-md-6">
	                            <button type="button" class="btn btn-info">회원약관</button>
	                        </div>
	                        <div class="form-check">
	                            <input class="form-check-input" type="checkbox" id="gridCheck">
	                            <label class="form-check-label" for="gridCheck">동의합니다</label>
	                        </div>
	                    </div>
	                     -->
	                    <div align="right">
	                        <button type="submit" id="upReg_submit" class="btn btn-primary">수정</button>
	                    </div>
	                    <input type="hidden" name="memberNo" value=${ myInfo.memberNo }>
	                </form>
	            </div>
	            <div class="modal-footer"></div>
	        </div>
	    </div>
	</div>




    <!-- Bootstrap core JavaScript -->
    <script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/corona/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/corona/resources/datatables/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/corona/resources/datatables/jquery.dataTables.min.js"></script>
    <script src="/corona/resources/datatables/dataTables.bootstrap4.min.js"></script>
    
    <!-- Page level custom scripts -->
    <script src="/corona/resources/datatables/datatables-demo.js"></script>
    <script src="/corona/resources/js/common.js"></script>
        
	<!-- Menu Toggle Script -->
	<script>	
	    $("#menu-toggle").click(function (e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("toggled");
	        if ($("#wrapper").hasClass("toggled")) {
	            $("#menu-toggle").html("메뉴 열기");
	        } else {
	            $("#menu-toggle").html("메뉴 닫기");
	        }
	    });
	</script>
	
	<script type="text/javascript">
		$("#memberDel").on('click',function(){
			var check = confirm("회원님 CORONA119 사이트를 탈퇴 하시겠습니까?")
			if(check){
				location.href="/corona/account/memberDel?memberNo=${loginuser.memberNo}"
				}
			});
	</script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('#myInfoUpdate').on('click',  function(event) {

			$('#upRegisterModal #memberId').attr({ "readonly": true }).val("");
			
			$('#upRegisterModal input[name=memberId]').val("${myInfo.memberId}");
			$('#upRegisterModal input[name=memberEmail]').val("${myInfo.memberEmail}");
			$('#upRegisterModal input[name=memberName]').val("${myInfo.memberName}");
			$('#upRegisterModal input[name=memberNickname]').val("${myInfo.memberNickname}");
			$('#upRegisterModal input[name=memberAddr]').val("${myInfo.memberAddr}");
			$('#upRegisterModal input[name=memberAddrDetail]').val("${myInfo.memberAddrDetail}");
				
			$('#upRegisterModal').modal('show');
	
		});
/* 
		$('#upReg_submit').on('click', function(event){
				

		}); */
		function formChk(){
			
		       document.upReg.submit();
		       return true;
		    }
		  
		

	});

i
	</script>

</body>

</html>