package com.project.corona.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.corona.vo.MemberVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
					
			String uri = request.getRequestURI();
			HttpSession session = request.getSession();

			MemberVO member = (MemberVO)session.getAttribute("loginuser");
//
//			if ( uri.contains("/admin") ) {
//				if ( uri.contains("/admin/login") ) {
//					System.out.println("3 : " + member);
//					if(member != null && member.getMemberType() == "ADMIN") {
//						response.sendRedirect("/corona/admin");
//						return true;
//					}
//				}
//				System.out.println("2 : " + member);
//				if(member == null || member.getMemberType() != "ADMIN") {
//					response.sendRedirect("/corona/admin/login");
//					return false;
//				}
//			}
			

			
//			if ( uri.contains("/manage") ) {
//				if( uri.contains("/manage/getindustry2")) {
//					return true;
//				}
//				if(member == null || !member.getAdmin_type()) {
//					response.sendRedirect("/goottjobplanet");
//					return false;
//				}
//			}
//			
//			if ( uri.contains("/resumepool/write") || uri.contains("/resumepool/update")) {
//				if(member == null) {
//					response.sendRedirect("/goottjobplanet/account/login");
//					return false;
//				} else if(member.getMclass() || member.getAdmin_type()) {
//					response.sendRedirect("/goottjobplanet/resumepool/list");
//					return false;
//				} else {
//					return true;
//				}
//			}
//
//			if ( uri.contains("/resumepool/list") || uri.contains("/resumepool/detail")) {
//				if(member == null) {
//					response.sendRedirect("/goottjobplanet/account/login");
//					return false;
//				} else if(member.getAdmin_type()) {
//					return true;
//				} else if(!member.getMclass()) {
//					response.sendRedirect("/goottjobplanet/resumepool/write");
//					return false;
//				} else {
//					return true;
//				}
//			}
//
//			if ( uri.contains("/recruit/write") || uri.contains("/recruit/update")) {
//				if(member == null) {
//					response.sendRedirect("/goottjobplanet/account/login");
//					return false;
//				} else if(!member.getMclass() || member.getAdmin_type()) {
//					response.sendRedirect("/goottjobplanet/recruit/list");
//					return false;
//				} else {
//					return true;
//				}
//			}
//
//			if ( uri.contains("/company/write") || uri.contains("/company/update")) {
//				if(member == null) {
//					response.sendRedirect("/goottjobplanet/account/login");
//					return false;
//				} else if(!member.getMclass() || member.getAdmin_type()) {
//					response.sendRedirect("/goottjobplanet/company/list");
//					return false;
//				} else {
//					return true;
//				}
//			}
//
//			if ( uri.contains("/review/write") || uri.contains("/review/update")) {
//				if(member == null) {
//					response.sendRedirect("/goottjobplanet/account/login");
//					return false;
//				} else if(member.getMclass() || member.getAdmin_type()) {
//					response.sendRedirect("/goottjobplanet/");
//					return false;
//				} else {
//					return true;
//				}
//			}

			return true;

		}
		
		// Controller 실행 (호출) 후
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			
		}
		
		// 요청 처리 후 (View 처리 후)
		@Override
		public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
				throws Exception {
			
		}
}
