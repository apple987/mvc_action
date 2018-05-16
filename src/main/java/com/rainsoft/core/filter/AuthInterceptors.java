package com.rainsoft.core.filter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/*import com.qdone.common.Constant;
import com.qdone.common.util.ContextHolderUtils;
import com.whty.emallspc.model.ClientUser;*/

/**
 * 权限拦截器
 * 
 * @author
 * 
 */
public class AuthInterceptors implements HandlerInterceptor {

	private static final Logger logger = Logger.getLogger(AuthInterceptors.class);

	private List<String> excludeUrls;

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 在controller后拦截
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception exception)
			throws Exception {
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object object,
			ModelAndView modelAndView) throws Exception {

	}

	/**
	 * 在controller前拦截
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object object) throws Exception {
		// 获取访问路径，不包含参数 
		/*String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = requestUri.substring(contextPath.length());
		HttpSession session = ContextHolderUtils.getSession();
		logger.debug("=======进入拦截器=======");
		logger.debug(contextPath);
		
		
		if (excludeUrls.contains(url)) {
			return true;
		} else {			
			ClientUser clientUser = (ClientUser) session.getAttribute(Constant.USER_SESSION);
			// 如果没有登录，跳转到登录界面
			if (clientUser == null) {
				response.getWriter().write("<script>top.location.href='"+ contextPath+ "/jsp/login.jsp'</script>");
				return false;
			}
		}*/
		return true;
	}

}
