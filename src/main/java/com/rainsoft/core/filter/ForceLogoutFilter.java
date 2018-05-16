package com.rainsoft.core.filter;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.apache.shiro.session.Session;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import com.rainsoft.constant.Constants;
import com.rainsoft.util.CoreUtil;


/**
 * shiro强制剔除
 * 用户过滤器
 */
public class ForceLogoutFilter extends AccessControlFilter {
	/**
	 * 当某个session中的Constants.SESSION_FORCE_LOGOUT_KEY不是null时，
	 * 表示这个用户是被踢出得
	 */
	/**
	 * 是否允许访问 true:是 false:拒绝
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {
		Session session = getSubject(request, response).getSession(false);
		if (session == null ) {
             return true;
		}
		return session.getAttribute(Constants.SESSION_FORCE_LOGOUT_KEY) == null;
	}
    /**
     * 拒绝访问时，会出现这个问题
     */
	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		Session session=getSubject(request, response).getSession(false);
		String flag=CoreUtil.getNotNullStr(session.getAttribute(Constants.SESSION_FORCE_LOGOUT_KEY));
		//iframe账户被踢掉之后，需要重新跳转登录
		String loginUrl = getLoginUrl() + (getLoginUrl().contains("?") ? "&" : "?") + "forceLogout=2";
		if(flag.equals("1")){//页面剔除，不跳转
			loginUrl=loginUrl.replaceAll("forceLogout=2", "forceLogout=1");
		}
		try {
			getSubject(request, response).logout();// 强制退出
		} catch (Exception e) {/*ignore exception*/ }
		WebUtils.issueRedirect(request, response, loginUrl);
		return false;
	}
	
}
