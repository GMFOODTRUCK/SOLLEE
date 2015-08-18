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

public class SalesAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		
		SalesDAO dao = SalesDAO.getInstance();
		List<Integer> mlist = dao.selectSalesValue();
		request.setAttribute("monthList", mlist);
		
		forward.setForward(true);
		forward.setNextURL("./page/chartData.jsp");
		
		return forward;
	}

}
