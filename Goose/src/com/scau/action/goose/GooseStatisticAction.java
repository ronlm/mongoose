package com.scau.action.goose;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.goose.vo.AppearOnMarket;
import com.scau.goose.vo.DeadInfo;
import com.scau.goose.vo.FarmStock;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.MarketService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;
import com.scau.view.goose.Market;

@Component
public class GooseStatisticAction extends BaseAction {
	private final static Log logger = LogFactory
			.getLog(GooseStatisticAction.class);
	private PageController pager;
	private MarketService marketService;
	private FarmService farmService;
	private GooseService gooseService;
	private Goose goose;
	private int onMarketDay = 90;//设定的鹅只成熟日期
	private int interval = 15;
	private ReceiveGooseService receiveGooseService;
	
	public String market() throws Exception{
		String URL = request.getRequestURI();
		this.pager.setURL(URL);

		/* 查看鹅只可上市信息
		 *候选条件：从本日起全部 离90 + 15 天内的鹅苗接收批次的鹅只 		
		*/
		String hql = "select m from com.scau.view.goose.Market m where m.receiveDate >='"
				+ marketService.getDateBefore(onMarketDay + interval )+ "' order by m.receiveDate asc";
		// 以下的计算是找出记录的总数
		List<Market> totalList = marketService.findByCondition(hql);
		List<AppearOnMarket> totalAppearOnMarkets = new ArrayList<AppearOnMarket>();
		Date today = new Date(new java.util.Date().getTime());
		for (Market market : totalList) {	
			long difference = today.getTime() - market.getReceiveDate().getTime();//已养殖天数
			long day = onMarketDay - difference/(3600*24*1000);//离上市相差的天数
			//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
		
			String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + market.getReceiveId() + "' and "
					+ "g.isValid ='1' and g.tradeId=null";
			long gooseNum = gooseService.getRecordCount(gooseCondition);
				
			// 只显示45天内可上市的批次
			if( day < 45){
				AppearOnMarket a = new AppearOnMarket();
				a.setDayTo90(day);
				a.setGooseNum(gooseNum);
				a.setMarket(market);
				totalAppearOnMarkets.add(a);
			}
		}
			
		int totalRows = totalAppearOnMarkets.size();// 总的记录条数
		this.pager.setTotalRowsAmount(totalRows);
		
		int toIndex = totalAppearOnMarkets.size() <= pager.getPageStartRow() + pager.getPageSize() ? totalAppearOnMarkets.size()  : pager.getPageStartRow() + pager.getPageSize();
		List<AppearOnMarket> resourceList = totalAppearOnMarkets.subList(this.pager.getPageStartRow(), toIndex);
			
		pager.setData(resourceList);
		request.setAttribute("pager", pager);
		request.setAttribute("today", new Date(new java.util.Date().getTime()));
		return "market";
	} 

	/**
	 * @return
	 */
	public String stock() throws Exception{
			// 查看全部农场的存栏量
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			
			int totalRowCount = farmService.list(new Farm()).size();
			this.pager.setTotalRowsAmount(totalRowCount);
			
			List<Farm> farmList = farmService.findByCondition(pager.getPageStartRow(),pager.getPageSize(),"from com.scau.model.goose.Farm f order by f.id asc");
			
			List<FarmStock> resourceList = new ArrayList<FarmStock>();
			for(Farm f :farmList){
				
				//找出所有属于某个农场的所有接收鹅苗批次:接收日期在今天的200天之后（打死你也不相信养一个鹅200天 + 吧）
				String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + f.getId()
						+" and rg.receiveDate >='" + receiveGooseService.getDateBefore(200) + "' order by rg.receiveDate desc";
				List<ReceiveGoose>	receiveList = receiveGooseService.findByCondition(hql);
				
				long gooseNum = 0;
				for(ReceiveGoose receiveGoose : receiveList){
					String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + receiveGoose.getId() + "' and "
							+ "g.isValid ='1' and g.tradeId=null";
					gooseNum += gooseService.getRecordCount(gooseCondition);
				}
				FarmStock stock = new FarmStock();
				stock.setFarm(f);
				stock.setStock(gooseNum);
				resourceList.add(stock);
			}
			
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("today", new Date(new java.util.Date().getTime()));
			return "stock";
	}
		
	public String dead() {
			// 查看鹅只非正常死亡信息
		   	int daysWithin = 100;
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			
			// 取得要显示 的日期条件
			if(null != request.getParameter("daysWithin")){
					daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
					request.getSession().removeAttribute("daysWithin");
			}else if(null != request.getSession().getAttribute("daysWithin")){
					daysWithin = (Integer)request.getSession().getAttribute("daysWithin");
			}
			
			int totalRowCount = farmService.list(new Farm()).size();
			this.pager.setTotalRowsAmount(totalRowCount);//设置总记录条数
			
			List<Farm> farmList = farmService.findByCondition(pager.getPageStartRow(),pager.getPageSize(),"from com.scau.model.goose.Farm f order by f.id asc");
			List<DeadInfo> resourceList = new ArrayList<DeadInfo>();// 结果列
			for(Farm f:farmList){
				//查找每个农场的相关信息
				List<ReceiveGoose> receiveGooseList = receiveGooseService.findByCondition("from com.scau.model.goose.ReceiveGoose rg where"
						+ " rg.farmId='" + f.getId() +"' and rg.receiveDate >='" + receiveGooseService.getDateBefore(daysWithin) +"'");
				if(receiveGooseList.size() > 0){
					
					DeadInfo dead = new DeadInfo();
					dead.setFarm(f);
					List<Goose> gooseList = new ArrayList<Goose>();
					for(ReceiveGoose rg:receiveGooseList){
						// 得到一个批次的死亡鹅只死亡记录
						Goose g = new Goose();
						g.setReceiveId(rg.getId());
						g.setIsValid(0);
						List<Goose> tempList = gooseService.list(g);
						
						gooseList.addAll(tempList);
					}
					dead.setDeadNum(gooseList.size());
					dead.setDeadGooses(gooseList);
					resourceList.add(dead);// 加入到结果
				}
			}
			
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("today", new Date(new java.util.Date().getTime()));
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "dead";
	}
		
	

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public GooseService getGooseService() {
		return gooseService;
	}

	@Resource
	public void setGooseService(GooseService gooseService) {
		this.gooseService = gooseService;
	}

	public MarketService getMarketService() {
		return marketService;
	}

	@Resource
	public void setMarketService(MarketService marketService) {
		this.marketService = marketService;
	}

	/** 检查该批次的鹅只是否已被收购
	 * @param receiveId
	 * @return true:已经被公司收购 false:还在农户手中
	 *//*
	public boolean checkTraded(long receiveId){
		//选出该批次还存活的鹅只数
		String totalQuery = "select count(*) from com.scau.model.goose.Goose g where g.receiveId=" + receiveId ;
		//查出该批次还存活并没有交易的鹅只数
		String tradeQuery = "select count(*) from com.scau.model.goose.Goose g where g.receiveId=" + receiveId +
				" and g.isValid= 1";
		List<Goose> gList = gooseService.findByCondition(totalQuery);
		for(int i = 0 ;i<gList.size();){
			if( null != gList.get(i).getTradeId()){
				return true;
			}
			i = i + 10;
		}
		return false;
	}*/

	public ReceiveGooseService getReceiveGooseService() {
		return receiveGooseService;
	}

	@Resource
	public void setReceiveGooseService(ReceiveGooseService receiveGooseService) {
		this.receiveGooseService = receiveGooseService;
	}

	public FarmService getFarmService() {
		return farmService;
	}

	@Resource
	public void setFarmService(FarmService farmService) {
		this.farmService = farmService;
	}
	
}
