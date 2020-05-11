<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


                    
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th style="width:45px">번호</th>
                                        <th style="width:45px">분류</th>
                                        <th >제목</th>
                                        <th style="width:55px">글쓴이</th>
                                        <th style="width:55px">날짜</th>
                                        <th style="width:45px">추천</th>
                                        <th style="width:45px">조회</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${ freeSisa }" var="freeSisa">
                                
                                    <tr>
                                        <td>${ freeSisa.boardNo }</td>
                                        <td>${ freeSisa.category.category }</td>
                                        <td><a href="/corona/freeboard/freeDetail?boardNo=${ freeSisa.boardNo }">${ freeSisa.boardTitle }</a></td>
                                        <td>${ freeSisa.member.memberNickname }</td>
                                        <td><fmt:formatDate value="${ freeSisa.boardRegdate }" pattern="yyyy.MM.dd"/></td>
                                        <td>${ freeSisa.boardReco }</td>
                                        <td>${ freeSisa.boardCount }</td>
                                    </tr>
                                
                                </c:forEach>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>

                    