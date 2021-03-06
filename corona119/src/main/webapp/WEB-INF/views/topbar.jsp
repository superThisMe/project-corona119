<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
    <button class="btn btn-primary" id="menu-toggle">메뉴 닫기</button>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active"><a class="nav-link" href="#">Home
                    <span class="sr-only">(current)</span>
                </a></li>
            <c:choose>
	            <c:when test="${ empty sessionScope.loginuser }">
		            <li class="nav-item">
		                <button type="button" class="btn btn-link" data-toggle="modal"
		                    data-target="#registerModal">회원가입</button>
		                <button type="button" class="btn btn-link" data-toggle="modal" data-target="#loginModal">로그인</button>
		            </li>
	            </c:when>
	            <c:otherwise>
		            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
		                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> ${ loginuser.memberNickname }님 환영합니다 </a>
		                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
		                	<c:choose>
		                		<c:when test="${loginuser.memberType eq 'ADMIN' }">
		                			<a class="dropdown-item" href="/corona/admin">관리페이지</a>
		                		</c:when>
		                		<c:otherwise>
		                			<a class="dropdown-item" href="/corona/mypage/main?memberNo=${loginuser.memberNo }">마이페이지</a>
		                		</c:otherwise>
		                    </c:choose>
		                    <div class="dropdown-divider"></div>
		                    <a class="dropdown-item" href="#">쪽지함</a>
		                    <div class="dropdown-divider"></div>
		                    <a class="dropdown-item" href="/corona/logout">로그아웃</a>
		                </div>
		            </li>
	            </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<!-- Modal 1 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="signUp" action="/corona/account/signup" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputId">아이디</label> <input type="text" class="form-control" id="memberId"
                                name="memberId" maxlength="12"><span id="idCheck"></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword">비밀번호</label> <input type="password" class="form-control"
                                id="memberPsw" name="memberPsw" maxlength="20">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">이메일</label> <input type="email" class="form-control" id="memberEmail"
                            name="memberEmail" placeholder="1234@abcd.com"><span id="emailCheck"></span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputName">이름</label> <input type="text" class="form-control" id="memberName"
                                name="memberName" maxlength="50"><span id="nameCheck"></span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputNickname">닉네임</label> <input type="text" class="form-control"
                                id="memberNickname" name="memberNickname" maxlength="20"><span id="nickCheck"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">주소</label> <input type="text" class="form-control"
                            id="inputAddress" name="memberAddr" placeholder="서울특별시 구로구 시흥대로">
                            
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
                        <button type="submit" id="reg_submit" class="btn btn-primary" disabled>완료</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<!-- Modal 2 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/corona/login" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">아이디</label> <input type="text" class="form-control" id="id" name="memberId">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">비밀번호</label> <input type="password" class="form-control"
                            id="passwd" name="memberPsw">
                    </div>
                    <div align="right">
                        <button type="submit" class="btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>

<script src="/corona/resources/vendor/jquery/jquery.min.js"></script>
<script src="/corona/resources/js/validate.js"></script>
