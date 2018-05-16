package com.rainsoft.core.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.rainsoft.constant.Constants;
import com.rainsoft.core.shiro.redis.SessionUtils;
import com.rainsoft.util.CoreUtil;



/**
 * 用户认证信息
 */
public class UserRealm extends AuthorizingRealm {

	/*@Autowired
	private SysUsersService sysUsersService;*/
	@Autowired
	private SessionDAO sessionDAO;
	@Autowired
	private SessionUtils sessionUtils;
	//	@Autowired
	//	private RedisCacheManager shiroCacheManager;
	//	@Autowired
	//	private PasswordHelper passwordHelper;

	/**
	 * 资源验证授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username = (String) principals.getPrimaryPrincipal();

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		/*Map<String, Object> map = sysUsersService.queryRoleNoByUserName(username);
		String roleNo = "";
		if(map.get("ROLENO") != null && !map.get("ROLENO").toString().isEmpty()){
			//获取用户角色
			Set<String> set = new HashSet<String>();
			roleNo = map.get("ROLENO").toString();
			set.add(roleNo);
			authorizationInfo.setRoles(set);
			//获取用户资源
			List<SysResource> list =  sysUsersService.getResoureListByRoleNo(map);
			set = new HashSet<String>();
			for (int i = 0; i < list.size(); i++) {
				set.add(list.get(i).getPermission());
			}
			authorizationInfo.setStringPermissions(set);
		}*/
		return authorizationInfo;
	}

	/**
	 * 用户登录验证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authToken) {
		SimpleAuthenticationInfo authenticationInfo = null;
		UsernamePasswordToken token = (UsernamePasswordToken) authToken;
		String username = (String) token.getPrincipal();
		/*SysUser user = new SysUser();*/
//		sysUser.setUserName(username);

		//		RedisCache ca=(RedisCache) shiroCacheManager.getCache("authenticationCache");
		//		ca.put("aaa", 123123);
		// 效验
//		SysUser user = sysUsersService.queryBean(sysUser);
		/*if (user == null) {
			SessionUtils.setShiroObject(Constants.Realm_Login_Message, "用户名/密码不正确");
			return authenticationInfo;
		}*/
		//用户密码加密,验证
		//sysUsers.setUserName(username);
		//sysUsers.setUserPass(String.valueOf(token.getPassword()));
		//sysUsers.setSalt(user.getSalt());
		if( token.getPassword() == null && token.getPassword().toString().isEmpty()){
			SessionUtils.setShiroObject(Constants.Realm_Login_Message, "用户名/密码不正确");
			return authenticationInfo;
		}
		String inputPassword = String.valueOf(token.getPassword());
		/*if (!user.getUserPass().equalsIgnoreCase(MD5Util.getMD5Str(inputPassword))) {
			SessionUtils.setShiroObject(Constants.Realm_Login_Message, "用户名/密码不正确");
			return authenticationInfo;
		}
		if (user.getUserStatus() == null && user.getUserStatus().equals(UserStatus.DISABLE.getId())) {
			SessionUtils.setShiroObject(Constants.Realm_Login_Message, "账号被锁定");
			return authenticationInfo;
		}*/

		//		if (Constant.KickOutBeforeLogin) {// 剔除前者
		//			kickOutBeforeLogin(username);
		//		} else {
		//			if (isPreLogin(username)) {// 后者不允许登录
		//				SessionUtils.setShiroObject(Constant.Realm_Login_Message, "账号已登录");
		//				return authenticationInfo;
		//			}
		//		}
		authenticationInfo = new SimpleAuthenticationInfo(token.getUsername(), // 用户名
				token.getPassword(), // 密码
				getName() // realm name
				);
		/*Map<String, Object> map = sysUsersService.queryRoleNoByUserName(username);
		if( map !=null && map.get("ROLENAME")!=null && !map.get("ROLENAME").toString().isEmpty()){
			user.setRoleName(map.get("ROLENAME").toString());
		}
		if( map !=null && map.get("ROLENO")!=null && !map.get("ROLENO").toString().isEmpty()){
			user.setRoleNo(map.get("ROLENO").toString());
		}*/
//		SessionUtils.setShiroObject(Constants.CURRENT_USER, user);//存储用户登录信息
		return authenticationInfo;
	}
    /*清除资源授权*/
	@Override
	public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		super.clearCachedAuthorizationInfo(principals);
	}
	/*清除认证用户*/
	@Override
	public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		super.clearCachedAuthenticationInfo(principals);
	}
	
	/**
	 * 判断该用户 是不是已经登录
	 * 
	 * @param userName
	 */
	public boolean isPreLogin(String userName) {
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		for (Session session : sessions) {
			// DefaultSubjectContext.PRINCIPALS_SESSION_KEY存储的是登录的用户姓名
			if (!CoreUtil.isEmpty(session) && !CoreUtil.isEmpty(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY))) {
				String loginUser = CoreUtil.getNotNullStr(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
				if (loginUser.equals(userName)) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * 剔除之前登录的用户
	 * 
	 * @param userName
	 */
	public void kickOutBeforeLogin(String userName) {
		Collection<Session> sessions = sessionDAO.getActiveSessions();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String webName = request.getContextPath();
		List<Session> before = new ArrayList<Session>();
		for (Session session : sessions) {
			// DefaultSubjectContext.PRINCIPALS_SESSION_KEY存储的是登录的用户姓名
			if (!CoreUtil.isEmpty(session) && !CoreUtil.isEmpty(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY))
					&& !CoreUtil.isEmpty(session.getAttribute(Constants.CURRENT_WEB_PROJECT))) {
				if (CoreUtil.getNotNullStr(session.getAttribute(Constants.CURRENT_WEB_PROJECT)).endsWith(webName)) {// 集群多项目时，只统计本项目的活跃用户
					String loginUser = CoreUtil.getNotNullStr(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
					if (loginUser.equals(userName)) {
						before.add(session);
					}
				}
			}
			if (!CoreUtil.isEmpty(session) && !CoreUtil.isEmpty(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY))) {
				String loginUser = CoreUtil.getNotNullStr(session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY));
				if (loginUser.equals(userName)) {
					before.add(session);
				}
			}
		}
		// 剔除userName账户，本次登录之前所有登录信息
		for (int i = 0; i < before.size(); i++) {
			Session session = before.get(i);
			session.setAttribute(Constants.SESSION_FORCE_LOGOUT_KEY, 2);// 账户登录后者剔除前者
			sessionUtils.update(session);
		}
	}
}
