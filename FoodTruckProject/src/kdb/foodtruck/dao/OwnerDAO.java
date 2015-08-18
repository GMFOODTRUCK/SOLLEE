package kdb.foodtruck.dao;


import java.util.List;

import kdb.foodtruck.dao.DBManager;
import kdb.foodtruck.dto.Owner;

import org.apache.ibatis.session.SqlSession;

public class OwnerDAO {
	private static OwnerDAO dao = new OwnerDAO();
	
	public OwnerDAO() {
		System.out.print("OwnerDAO()----------------");
	}
	
	public static OwnerDAO getInstance() {
		return dao;
	}
	
	public boolean insertOwner(Owner owner) {
		
		SqlSession session=null;
		boolean result=false;
		
		try{
			session= DBManager.getSqlSession();
			result = session.insert("kdb.foodtruck.mapper.insertOwner", owner) > 0 ? true : false;
		}finally{
			DBManager.closeSqlSession(result, session);
		}
		
		return result;
	}
	
	public List<Owner> checkOwner(Owner owner) {
		SqlSession session=null;
		List<Owner> list = null;
		
		try{
			session= DBManager.getSqlSession();
			list = session.selectList("kdb.foodtruck.mapper.checkOwner", owner);
		} finally{
			DBManager.closeSqlSession(session);
		}
		
		return list;
	}
}
