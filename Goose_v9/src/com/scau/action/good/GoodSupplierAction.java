package com.scau.action.good;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.GoodSupplier;
import com.scau.service.impl.goose.GoodSupplierService;
import com.scau.util.PageController;
/**
 * 处理与物资供应商相关的请求
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class GoodSupplierAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(GoodSupplierAction.class);
	private PageController pager;
	private GoodSupplierService goodSupplierService;
	private GoodSupplier goodSupplier;
		
	/**
	 * 获得供应商列表
	 * @return
	 */
	public String list() {
		// 取列表	
			
			int totalRows = goodSupplierService.getRecordCount(new GoodSupplier());
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<GoodSupplier> resourceList = goodSupplierService.list(new GoodSupplier(),
					this.pager.getPageStartRow(), pager.getPageSize(), null, null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}
	
	/**
	 *  点了添加或者点了修改	
	 * @return
	 */
	public String get() {
			goodSupplier = goodSupplierService.get(goodSupplier);
			request.setAttribute("goodSupplier", goodSupplier);
			return "edit";
	}

	/**
	 * 保存编辑的供应商信息表单
	 * @return
	 */
	public String save() {
		// 保存表单
		try {
			goodSupplierService.save(goodSupplier);
		
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("user", goodSupplier);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	/**
	 * 删除一条供应商信息
	 * @return
	 */
	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			GoodSupplier goodSupplier= new GoodSupplier();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					goodSupplierService.delete(goodSupplier,Long.parseLong(id));
				}
			}
			return list();//返回取列表页面，并刷新列表
	}

	


	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public GoodSupplierService getGoodSupplierService() {
		return goodSupplierService;
	}

	@Resource
	public void setGoodSupplierService(GoodSupplierService goodSupplierService) {
		this.goodSupplierService = goodSupplierService;
	}

	public GoodSupplier getGoodSupplier() {
		return goodSupplier;
	}

	
	public void setGoodSupplier(GoodSupplier goodSupplier) {
		this.goodSupplier = goodSupplier;
	}

	
}
