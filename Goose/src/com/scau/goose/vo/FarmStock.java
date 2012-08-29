package com.scau.goose.vo;

import com.scau.model.goose.Farm;

/** 用于存贮对象，在页面与action间传递
 * @author jianhao
 *
 */
public class FarmStock {
	private Farm farm;
	private Integer stock;
	public Farm getFarm() {
		return farm;
	}
	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	
	
}
