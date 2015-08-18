package kdb.foodtruck.action.sales;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ActionForward forward = new ActionForward();
		SalesDAO dao = SalesDAO.getInstance();
		Sales sales = new Sales();
		
		Date date = Date.valueOf(request.getParameter("date"));
		
		sales.setSalesDate(date);
		sales.setSalesValue(Integer.parseInt(request.getParameter("sale")));
		
		if(dao.updateSales(sales)) {
			forward.setForward(false);
			forward.setNextURL("foodtruck?cmd=SalesRegisterForm");
		} else {
			System.out.println("에러났습니다.");
		}
		
		return forward;
	}

}
