/**
 *
 */
package com.projectMatrix.configration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.projectMatrix.model.UserInfo;
import com.projectMatrix.to.UserInfoTo;

/**
 * @author yogavarun.m
 *
 */
@Component
public class RequestProcessingTimeInterceptor implements HandlerInterceptor {

	@Autowired
	HttpSession httpSession;

	/**
	 * {@inheritDoc}
	 *
	 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse, java.lang.Object,
	 *      java.lang.Exception)
	 */
	@Override
	public void afterCompletion(final HttpServletRequest request,
			final HttpServletResponse response, final Object handler,
			final Exception ex) throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * {@inheritDoc}
	 *
	 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse, java.lang.Object,
	 *      org.springframework.web.servlet.ModelAndView)
	 */
	@Override
	public void postHandle(final HttpServletRequest request,
			final HttpServletResponse response, final Object handler,
			final ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}

	/**
	 * {@inheritDoc}
	 *
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */

	/*
	 * @Override public boolean preHandle(final HttpServletRequest request,
	 * final HttpServletResponse response, final Object handler) throws
	 * Exception { if (request.getRequestURI().equals("/projectMatrix/") ||
	 * request.getRequestURI().equals("/projectMatrix/login")) { return true; }
	 * UserInfoTo userData = (UserInfoTo)
	 * request.getSession().getAttribute("sessionobject"); if (userData != null)
	 * { return true; } else { String url =
	 * request.getServletContext().getContextPath(); response.sendRedirect(url +
	 * "/"); return false; } }
	 */

	@Override
	public boolean preHandle(final HttpServletRequest request,
			final HttpServletResponse response, final Object handler)
			throws Exception {

		UserInfoTo userData = (UserInfoTo) request.getSession().getAttribute(
				"sessionobject");
		String url = request.getServletContext().getContextPath();

		if (userData != null) {
			return true;
		} else {
			// System.out.println(request.getRequestURI()+"  "+url);
			if (request.getRequestURI().equals("/projectMatrix")) {

				response.sendRedirect(url + "/centillion");

			} else if (request.getRequestURI().contains(
					"/projectMatrix/centillion")
					|| request.getRequestURI().contains("/projectMatrix/login")
					|| request.getRequestURI().contains(
							"/projectMatrix/forgotPassword")
					|| request.getRequestURI().contains(
							"/projectMatrix/confirmSecurityQuestion")
					|| request.getRequestURI().contains(
							"/projectMatrix/getSecurityQuestionByUserId")
							|| request.getRequestURI().contains("/projectMatrix/confirmPassword")
							|| request.getRequestURI().contains("/projectMatrix/loginws")
							|| request.getRequestURI().contains("/projectMatrix/empListWs")
					) {
				return true;
				// response.sendRedirect(request.getRequestURI());
			} else if (userData == null
					&& (!request.getRequestURI().equals("/projectMatrix") || !request
							.getRequestURI()
							.equals("/projectMatrix/centillion"))) {

				response.sendRedirect(url + "/centillion");
				return false;
			}
		}

		return true;

	}
}
