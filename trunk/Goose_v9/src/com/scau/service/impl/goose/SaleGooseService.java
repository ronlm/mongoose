package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.SaleGoose;
import com.scau.service.BaseService;

@Component
public class SaleGooseService extends BaseService<SaleGoose>{
	@Transactional
	public void save(SaleGoose entity) throws BusinessException{
		if (null != entity && null != entity.getRetailerId()) {
			if(null != entity.getId() && 0 != entity.getId()){
				//id不为null,更新，为null则add
				entity.setTotalValue(entity.getTotalWeight() * entity.getUnitPrice());//自动计算该次销售的总金额
				update(entity);
			}else{
				entity.setTotalValue(entity.getTotalWeight() * entity.getUnitPrice());//自动计算该次销售的总金额
				add(entity);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public SaleGoose get(SaleGoose entity) {
		if(null != entity && null != entity.getId() && 0!= entity.getId()){
			return super.get(entity, entity.getId());
		}
		else if(null != entity) {
			return super.get(entity);
		}
		else {
			return null;
		}
	}
}
