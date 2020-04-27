<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

                    
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th width="7%">번호</th>
                                        <th width="59%">제목</th>
                                        <th width="10%">글쓴이</th>
                                        <th width="10%">날짜</th>
                                        <th width="7%">추천</th>
                                        <th width="7%">조회</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${ freeList }" var="freeList">
                                
                                    <tr>
                                        <td>${ freeList.boardNo }</td>
                                        <td><a href="/corona/freeboard/freeDetail?boardNo=${ freeList.boardNo }">${ freeList.boardTitle }</a></td>
                                        <td>${ freeList.memberNo }</td>
                                        <td><fmt:formatDate value="${ freeList.boardRegdate }" pattern="yyyy.MM.dd"/></td>
                                        <td>${ freeList.boardReco }</td>
                                        <td>${ freeList.boardCount }</td>
                                    </tr>
                                
                                </c:forEach>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    
    
	
   