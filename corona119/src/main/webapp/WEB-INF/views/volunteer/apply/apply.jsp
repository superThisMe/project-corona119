<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import= "java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
<c:choose>
<c:when test="${ applyList ne '[]' }">
<c:forEach items="${ applyList }" var="apply">
<div>
	${apply.memberNo}님이 신청
	${apply.applyId}님
	${apply.applyPhone}
	${apply.applyBirth}
</div>
</c:forEach>
</c:when>
<c:otherwise>
	신청자 모집 중입니다.
</c:otherwise>
</c:choose>
</div>
<!-- 신청자 현황판<br>
근데 의문점이 있다<br>
일반회원이 아무나 쓸수 있는 게시판이라던데<br>
신청자 현황이라고 하면 그 안에 신청자 이름 연락처 나이 같은게 있어야 할것이고<br>
그걸 받으려면 결국 회원가입 양식이 더 복잡해질거고<br>
DB에도 새로 칼럼 추가해야되고<br>
신청방식이 그냥 버튼 하나 누르는건지 댓글을 다는건지 모르겠다요<br>
봉사활동 게시판 제시한사람 누구요~~~~~~~~~~~~~~~~~~~~~~~<br>
그냥 신청자랑 연락처만 가지고 신청/확인하는건가요<br> -->
