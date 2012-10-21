package com.scau.model.goose;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Good {
	private Long id;
	private String name;
	private Long goodTypeId;
	private String unit;
	private Long stock;
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Long getGoodTypeId() {
		return goodTypeId;
	}
	public void setGoodTypeId(Long goodTypeId) {
		this.goodTypeId = goodTypeId;
	}
	/** 返回当前的存货量
	 * @return
	 */
	public Long getStock() {
		return this.stock;
	}
	
	
	public void setStock(Long stock) {
		this.stock = stock;
	}
}
