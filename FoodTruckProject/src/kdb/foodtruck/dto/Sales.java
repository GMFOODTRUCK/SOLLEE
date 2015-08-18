package kdb.foodtruck.dto;

import java.sql.Date;

public class Sales {
	private	int		salesNum;
	private	int		foodtruckNum;
	private	Date	salesDate;
	private int		salesValue;
	
	public int getSalesNum() {
		return salesNum;
	}
	
	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	
	public int getFoodtrucknum() {
		return foodtruckNum;
	}
	
	public void setFoodtrucknum(int foodtruckNum) {
		this.foodtruckNum = foodtruckNum;
	}
	
	public Date getSalesDate() {
		return salesDate;
	}
	
	public void setSalesDate(Date salesDate) {
		this.salesDate = salesDate;
	}
	
	public int getSalesValue() {
		return salesValue;
	}
	
	public void setSalesValue(int salesValue) {
		this.salesValue = salesValue;
	}
	
	public String dateToString() {
		String day = "";
		
		switch(salesDate.getDay()) {
			case 0: day="일요일"; break;
			case 1: day="월요일"; break;
			case 2: day="화요일"; break;
			case 3: day="수요일"; break;
			case 4: day="목요일"; break;
			case 5: day="금요일"; break;
			case 6: day="토요일"; break;
		}
		
		return day;
	}
	
	public String getMonthDate() {
		String md = "";
		
		int month = salesDate.getMonth()+1;
		int date = salesDate.getDate();
		
		if(month<10)
			md = "0"+ Integer.toString(month) + "/";
		else
			md = Integer.toString(month) + "/";
		
		if(date<10)
			md += "0" + Integer.toString(date);
		else
			md += Integer.toString(date);
		
		
		return md;
	}
	
}
