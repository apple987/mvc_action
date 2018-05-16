package com.rainsoft.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 此处添加过滤器，JSP页面添加
 * 解决session跨域filter
 * @author Administrator
 *
 */
public class TransNameFilter extends HttpServlet implements Filter {
	
	
	private static final long serialVersionUID = -1561756402436637931L;
	
	static  Logger log=LoggerFactory.getLogger(TransNameFilter.class);
	

	public TransNameFilter() {
		super();
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hreq = (HttpServletRequest) request;
		String transName = hreq.getParameter("transName");
		if (StringUtils.isBlank(transName)) {
			log.info(" there is no transName for this request");
		} else {
			log.info(" transName is " + transName);
		}
		HttpServletResponse res = (HttpServletResponse) response;
		// iframe引起的内部cookie丢失
		res.setHeader("P3P", "CP=CAO PSA OUR");
		if (chain != null)
			chain.doFilter(request, response);
	}

	public void destroy() {
	}

}
