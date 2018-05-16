package test;

import java.util.List;

public class Sort {

	
	private String sort;
	private String order;
	private int offset;
	private int limit;
	private List<Data> multiSort;
	
	class Data{
		private String sortName;
		private String sortOrder;
		
		public String getSortName() {
			return sortName;
		}
		public void setSortName(String sortName) {
			this.sortName = sortName;
		}
		public String getSortOrder() {
			return sortOrder;
		}
		public void setSortOrder(String sortOrder) {
			this.sortOrder = sortOrder;
		}
		
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public List<Data> getMultiSort() {
		return multiSort;
	}

	public void setMultiSort(List<Data> multiSort) {
		this.multiSort = multiSort;
	}
	
	
	
	
}
