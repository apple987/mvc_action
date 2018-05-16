package com.rainsoft.core;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
/*import org.springframework.web.bind.WebDataBinder;
import java.beans.PropertyEditorSupport;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.web.bind.annotation.InitBinder;*/
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.rainsoft.constant.Constants;
import com.rainsoft.core.page.PageList;
import com.rainsoft.core.shiro.UserRealm;
import com.rainsoft.util.CoreUtil;
import com.rainsoft.util.DateUtil;

public class BaseController {

	/**
	 * 初始化数据绑定 1. 将所有传递进来的String进行HTML编码，防止XSS攻击 2. 将字段中Date类型转换为String类型，
	 * date类型暂时不需要此处binder 采用注解即可@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	 */
	/*@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}

			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		// Date 类型转换
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtil.parseDate(text));
			}

			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? DateUtil.formatDateTime((Date) value) : "";
			}
		});
	}*/

	public static final List<Object> noRrcords = new ArrayList<Object>(0);

	/**
	 * 所有ActionMap 统一从这里获取
	 * 
	 * @return
	 */
	public Map<String, Object> getRootMap() {
		Map<String, Object> rootMap = new LinkedHashMap<String, Object>();
		return rootMap;
	}

	/**
	 * 所有ActionMap 统一从这里获取
	 * 
	 * @return
	 */
	public Map<String, Object> getRootMap(int length) {
		Map<String, Object> rootMap = new HashMap<String, Object>(length);
		return rootMap;
	}

	public Map<String, Object> getRootMap(Map<String, Object> map) {
		if (map == null) {
			map = new HashMap<String, Object>();
		}
		return map;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView forword(String viewName, @SuppressWarnings("rawtypes") Map context) {
		viewName = Constants.TEMPLATE + viewName;
		return new ModelAndView(viewName, context);
	}

	public static String forword(String page) {
		return Constants.TEMPLATE + page;
	}

	@SuppressWarnings("unchecked")
	public ModelAndView redirect(String viewName, @SuppressWarnings("rawtypes") Map context) {
		return new ModelAndView(new RedirectView(viewName), context);
	}

	public ModelAndView redirect(String viewName) {
		return new ModelAndView(new RedirectView(viewName));
	}

	public ModelAndView error(String errMsg) {
		return new ModelAndView("error");
	}

	/**
	 * 过滤查询参数的字符串""
	 * 
	 * @param mp
	 * @return
	 */
	public Map<String, Object> filterEmpty(Map<String, Object> mp) {
		Iterator<String> it = mp.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			String temp = CoreUtil.conventEmpty2Null(mp.get(key));
			mp.put(key, temp);
		}
		return mp;
	}

	/**
	 * 响应bootstrap-table分页
	 * 
	 * @param <T>
	 * @param <T>
	 */
	public final Map<String, Object> responseSelectPage(PageList<?> pageNoList) {
		Map<String, Object> result = getRootMap();
		if (null != pageNoList && null != pageNoList.getList()) {
			result.put("rows", pageNoList.getList());
		} else {
			result.put("rows", noRrcords);
		}
		// 总记录条数
		if (null != pageNoList && null != pageNoList.getPageInfo().getRecordCount()) {
			result.put("total", pageNoList.getPageInfo().getRecordCount());
		} else {
			result.put("total", 0);
		}
		return result;
	}

	/**
	 * 不用分页使用此方法封装返回值
	 * 
	 * @param list
	 * @return
	 */
	public final Map<String, Object> responseSelectNoPage(List<?> list) {
		Map<String, Object> result = getRootMap();
		if (list == null) {
			result.put("rows", noRrcords);
			result.put("total", 0);
		} else {
			result.put("rows", list);
			result.put("total", list.size());
		}
		return result;
	}

	/**
	 * 清除当前用户认证信息
	 */
	public static final void clearCurrentAuth() {
		RealmSecurityManager securityManager = (RealmSecurityManager) SecurityUtils.getSecurityManager();
		UserRealm userRealm = (UserRealm) securityManager.getRealms().iterator().next();
		userRealm.clearCachedAuthenticationInfo(SecurityUtils.getSubject().getPrincipals());
		userRealm.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}

	public final void simpleViewFormat(List<?> list) {
		if (list == null) {
			return;
		}
		for (Object object : list) {
			if ((object instanceof Map)) {
				@SuppressWarnings("unchecked")
				Map<String, Object> map = (Map<String, Object>) object;
				Object startTime = map.get("startTime");
				if (startTime != null && startTime instanceof Date) {
					map.put("startTime", DateUtil.getStringDateByDate((Date) startTime));
				}
				Object endTime = map.get("endTime");
				if (endTime != null && endTime instanceof Date) {
					map.put("endTime", DateUtil.getStringDateByDate((Date) endTime));
				}
				Object createTime = map.get("createTime");
				if (createTime != null && createTime instanceof Date) {
					map.put("createTime", DateUtil.getStringDateByDate((Date) createTime));
				}
				Object updateTime = map.get("updateTime");
				if (updateTime != null && updateTime instanceof Date) {
					map.put("updateTime", DateUtil.getStringDateByDate((Date) updateTime));
				}
			} else {
				break;
			}
		}
	}
}
