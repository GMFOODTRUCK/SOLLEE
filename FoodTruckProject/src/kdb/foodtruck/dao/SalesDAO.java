package kdb.foodtruck.dao;


import java.util.HashMap;
import java.util.List;

import kdb.foodtruck.dao.DBManager;
import kdb.foodtruck.dto.Sales;

import org.apache.ibatis.session.SqlSession;

public class SalesDAO {
	private static SalesDAO dao = new SalesDAO();
	
	public SalesDAO() {
		System.out.println("SalesDAO-------------");
	}
	
	public static SalesDAO getInstance() {
		return dao;
	}
	
	public boolean insertSales(Sales sales) {
		
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertSales", sales) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Sales> selectWeekSales() {
		SqlSession session=null;
		List<Sales> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectWeekSales");
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public List<Sales> selectAllSales() {
		SqlSession session=null;
		List<Sales> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectAllSales");
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
	public boolean updateSales(Sales sales) {
		SqlSession session=null;
		boolean result=false;
		
		try {
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.updateSales", sales) > 0 ? true : false;
		} finally {
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Integer> selectSalesValue() {
		SqlSession session=null;
		List<Integer> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.selectSalesValue");
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
	
}
