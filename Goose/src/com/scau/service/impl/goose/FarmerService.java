package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommUser;
import com.scau.model.goose.Farmer;
import com.scau.service.BaseService;

@Component
public class FarmerService extends BaseService<Farmer>{
	public void save(Farmer farmer) throws BusinessException{
		if (null != farmer && null != farmer.getName()) {
			if(null != farmer.getId() && 0 != farmer.getId()){
				update(farmer);
			}else{
				add(farmer);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public Farmer get(Farmer entity) {
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
