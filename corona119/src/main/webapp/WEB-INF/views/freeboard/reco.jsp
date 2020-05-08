<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:choose>
								<c:when test="${ loginuser.memberNo ne board.memberNo }">
									<button class="nonbutton recoBtn" id="recoBtn"><img src="/corona/resources/img/thumbups.png"> 추천
										<c:if test="${reco.boardReco ne 0}"> ${reco.boardReco}</c:if>
									</button>
									<button class="nonbutton nrecoBtn" id="nrecoBtn"><img src="/corona/resources/img/thumbdowns.png"> 비추천
										<c:if test="${reco.boardNreco ne 0}"> ${reco.boardNreco}</c:if>
									</button>
									<button class="nonbutton singoBtn" id="singoBtn"><img src="/corona/resources/img/singos.png">신고하기
									</button>
								</c:when>
								<c:otherwise>
									<button class="nonbutton" disabled><img src="/corona/resources/img/thumbups.png"> 추천
										<c:if test="${reco.boardReco ne 0}"> ${reco.boardReco}</c:if>
									</button>
									<button class="nonbutton" disabled><img src="/corona/resources/img/thumbdowns.png"> 비추천
										<c:if test="${reco.boardNreco ne 0}"> ${reco.boardNreco}</c:if>
									</button>
									<button class="nonbutton" disabled><img src="/corona/resources/img/singos.png">신고하기
									</button>
								</c:otherwise>
</c:choose>                    		
