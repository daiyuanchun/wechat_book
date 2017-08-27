package com.yuxudong.po;

public class SearchVO {
	private Integer page;
	private Integer typeId;
	private Integer provinceId;
	private Integer cityId;
	private Integer startPos;

	public SearchVO() {

	}
	public SearchVO(Integer page, Integer typeId, Integer provinceId, Integer cityId, Integer startPos) {
		super();
		this.page = page;
		this.typeId = typeId;
		this.provinceId = provinceId;
		this.cityId = cityId;
		this.startPos = startPos;
	}
	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getStartPos() {
		return startPos;
	}

	public void setStartPos(Integer startPos) {
		this.startPos = startPos;
	}

}
