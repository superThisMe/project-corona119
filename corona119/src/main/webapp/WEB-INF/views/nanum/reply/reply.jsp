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
			<div style="width:10%;float:left;">${nRe.member.memberNickname}</div>
			<div style="width:90%;">${nRe.reply}</div>
		</div>
	</div>
	</c:forEach>
</c:when>
<c:otherwise>
	신청 댓글이 없습니다.
</c:otherwise>
</c:choose>
</div>

