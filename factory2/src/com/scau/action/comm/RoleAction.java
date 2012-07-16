package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommRoleResource;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.service.impl.comm.CommRoleResourceService;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.util.PageController;

import cn.com.ege.mvc.exception.BusinessException;

@Component
public class RoleAction extends BaseAction implements Serializable {
	private final static Log logger = LogFactory.getLog(RoleAction.class);
	private PageController pager = null;
	private CommRoleService commRoleService;
	private CommRole commRole;
	private List<CommRoleResource> roleResourceList = null;
	private List<CommResource> resourceList = null;

	public String list() {
		try {
			// 取列表
			int totalRows = commRoleService.getRecordCount(new CommRole());
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<CommRole> resourceList = commRoleService.list(new CommRole(),
					this.pager.getPageStartRow(), pager.getPageSize(), null,
					true);
			pager.setData(resourceList);
			return "list";
		} catch (Exception e) {
			return "error";
		}
	}

	public String get() {
		// 点了添加或者点了修改
		try {
			commRole = commRoleService.get(commRole);
			// 获取该角色的资源
			if (null != commRole) {
				CommRoleResourceService commRoleResourceService = new CommRoleResourceService();
				CommRoleResource crr = new CommRoleResource();
				crr.setRoleId(commRole.getId());
				try {
					roleResourceList = commRoleResourceService
							.listByRoleId(crr);
					// request.setAttribute("roleResourceList",
					// roleResourceList);

				} catch (BusinessException e) {
					logger.error("查询获取该角色的资源时出错了: " + e.getMessage(), e);
				}
			}
			// 所有资源
			CommResourceService resourceService = new CommResourceService();
			resourceList = resourceService.listAll(new CommResource());
			return "EDIT";
		} catch (Exception e) {
			return "error";
		}

	}

	public String save() {
		try {
			Long key = commRoleService.save(commRole);
			// 如果插入或者更新记录成功, 会返回该记录的主键
			if (null != key) {
				// 获取选中了的权限资源
				String[] resources = request.getParameterValues("resource");
				CommRoleResourceService commRoleResourceService = new CommRoleResourceService();
				// 把选中了的插入中间表
				CommRoleResource crr = new CommRoleResource();
				crr.setRoleId(commRole.getId());
				// 首先把当前获取的这个角色记录全部删除,然后再新增
				commRoleResourceService.delete(crr);
				if (null != resources) {
					for (String string : resources) {
						crr.setResourceId(Long.valueOf(string));
						commRoleResourceService.add(crr);
					}
				}
			}
			return "getList";
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("role", commRole);
			request.setAttribute("message", e.getMessage());
			return "EDIT";
		}

	}

	public String del() {
		try {
			// 删除
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				CommRole role = new CommRole();
				if (null != id && !("".equals(id))) {
					role.setId(Long.valueOf(id));
					commRoleService.delete(role);
				}
			}
			return "getList";
		} catch (Exception e) {
			return "error";
		}
	}

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public CommRole getRole() {
		return commRole;
	}

	@Resource
	public void setRole(CommRole role) {
		this.commRole = role;
	}

	public List<CommRoleResource> getRoleResourceList() {
		return roleResourceList;
	}

	@Resource
	public void setRoleResourceList(List<CommRoleResource> roleResourceList) {
		this.roleResourceList = roleResourceList;
	}

	public List<CommResource> getResourceList() {
		return resourceList;
	}

	@Resource
	public void setResourceList(List<CommResource> resourceList) {
		this.resourceList = resourceList;
	}
}
