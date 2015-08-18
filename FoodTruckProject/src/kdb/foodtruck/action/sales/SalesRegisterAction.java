package kdb.foodtruck.action.sales;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesRegisterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		SalesDAO dao = SalesDAO.getInstance();
		
		Sales sales = new Sales();
		
		sales.setFoodtrucknum(4);
		sales.setSalesValue(Integer.parseInt(request.getParameter("sale")));
		
		if(dao.insertSales(sales)) {
			forward.setForward(true);
			forward.setNextURL("./page/sales.jsp");
		} else {
			System.out.println("에러났습니다.");
		}
		
		return forward;
	}

}
