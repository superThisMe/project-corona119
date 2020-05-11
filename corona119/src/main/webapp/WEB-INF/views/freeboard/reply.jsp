<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:forEach items="${ replies }" var="reply" >
	<div class="media text-muted pt-3" >
	   <!--  <svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg"
	        preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">
	        <title>Placeholder</title>
	        <rect width="100%" height="100%" fill="#007bff"></rect>
	        <text x="50%" fill="#007bff" dy=".3em">32x32</text>
	    </svg> -->
	    <p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">
	        <span class="d-block">
	            <strong class="text-gray-dark">${reply.RNo}/${reply.member.memberNickname} / ${reply.replyDate }</strong>
	            <span style="padding-left: 7px; font-size: 9pt">
	               	<c:if test="${ loginuser.memberNo == reply.memberNo }">
		                <a href="javascript:void(0);" data-rno="${reply.RNo}" id="updateReply" class="reply-update">수정</a>
						<a href="javascript:void(0);" data-rno="${reply.RNo}" id="deleteReply" class="reply-delete">삭제</a>
					</c:if>				
	            </span>
	        </span>
	        ${reply.reply}
	       
	    </p>
	    </div>
	   
	    <div id="rid_${reply.RNo}" class="rid" style="display: none" data-rno="${reply.RNo}" >
	    
	     	
	        <table style="width: 100%; font-size: 9pt">
			                    <tr>	
			                        <td style="width: 95%" 	>
			                        <form id="updateReplyForm_${reply.RNo }">
			                            <input id="upReply" name="upReply" style="width: 100%" value="${reply.reply}">
			                        </form>
			                        </td>
			                        <td>
				                        <table>
				                        <tr>
					                        <td width="60pt" align="center">
					                            <button id="updateK" data-rno="${reply.RNo}" class="updateK">수정</button>
					                        </td>
				                        </tr>
				                        <tr>
					                        <td width="60pt" align="center">
					                            <button id="updateC"  data-rno="${reply.RNo}" class="updateC" >취소</button>	
					                        </td>
				                        </tr>
				                        </table>
			                        </td>
			                    </tr>
			
				</table>
				
			</div> 
			


</c:forEach> 	
                    		