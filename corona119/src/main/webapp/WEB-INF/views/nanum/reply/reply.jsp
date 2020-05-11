<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<jsp:useBean id="now" class="java.util.Date" scope="page" />
	<fmt:formatDate var="nowTime" value="${now}" pattern="yyyy" />
<c:choose>
<c:when test="${ nanumReply ne '[]' }">
	<c:forEach items="${ nanumReply }" var="nRe">
	<div class="form-row">
		<div class="form-group col-md-12 applyDiv">
			${nRe.member.memberNickname}님 | ${nRe.reply}
		</div>
	</div>
	</c:forEach>
</c:when>
<c:otherwise>
	신청 댓글이 없습니다.
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
