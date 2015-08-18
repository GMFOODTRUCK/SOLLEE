package kdb.foodtruck.action.sales;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.SalesDAO;
import kdb.foodtruck.dto.Sales;

public class SalesRegisterFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		SalesDAO dao = SalesDAO.getInstance(); 
		List<Sales> wlist = dao.selectWeekSales();
		request.setAttribute("weekList", wlist);
		
		forward.setForward(true);
		forward.setNextURL("./page/sales.jsp");
		
		return forward;
	}

}
