<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                               
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

                            <script src="/corona/resources/assets/js/libs/jquery-3.1.1.min.js"></script>
                            <script src="/corona/resources/bootstrap/js/popper.min.js"></script>
							<script src="/corona/resources/bootstrap/js/bootstrap.min.js"></script>
							<script src="/corona/resources/plugins/table/datatable/datatables.js"></script> 
                            <script>
                        	$("#zero-config-b2").DataTable({
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