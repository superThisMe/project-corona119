<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                               
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
												<a href="/corona/notice/detail/${no.boardNo}" target="_blank">
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

                            <script src="/corona/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
                            <script src="/corona/resources/bootstrap/js/popper.min.js"></script>
							<script src="/corona/resources/bootstrap/js/bootstrap.min.js"></script>
							<script src="/corona/resources/plugins/table/datatable/datatables.js"></script> 
                            <script>
                        	$("#zero-config-b1").DataTable({
                        		"stateSave" : true,
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
                            </script>