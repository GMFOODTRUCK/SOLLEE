package kdb.foodtruck.action.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kdb.foodtruck.action.Action;
import kdb.foodtruck.action.ActionForward;
import kdb.foodtruck.dao.CustomerDAO;
import kdb.foodtruck.dao.OwnerDAO;
import kdb.foodtruck.dto.Customer;
import kdb.foodtruck.dto.Owner;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		/* customer */
		Customer customer = new Customer();
		CustomerDAO cDao = CustomerDAO.getInstance();
		customer.setCustomerEmail(email);
		
		/* owner */
		Owner owner = new Owner();
		OwnerDAO oDao = OwnerDAO.getInstance();
		owner.setOwnerEmail(email);
		
		List<Customer> clist = cDao.checkCustomer(customer);
		List<Owner> olist = oDao.checkOwner(owner);
		
		if(clist.get(0)!=null) {
			/* 고객인 경우 */
			System.out.println("고객 아이디 검색 성공!");
			
			if(clist.get(0).getCustomerPwd().equals(password)) {
				/* 비밀번호 검사 검사 */
				// 고객 로그인 처리
				System.out.println("고객 로그인 성공");
				session.setAttribute("customerNum", clist.get(0).getCustomerNum());
				session.setAttribute("id", clist.get(0).getCustomerName());
			} else {
				System.out.println("고객 로그인 실패");
			}
			
		} else if(olist.get(0)!=null) {
			/* 업주인 경우 */
			System.out.println("업주 아이디 검색 성공!");
			
			if(olist.get(0).getOwnerPwd().equals(password)) {
				/* 비밀번호 검사 검사 */
				// 업주 로그인 처리
				System.out.println("업주 로그인 성공");
				session.setAttribute("ownerNum", olist.get(0).getOwnerNum());
				session.setAttribute("id", olist.get(0).getOwnerName());
			} else {
				System.out.println("업주 로그인 실패");
			}
			
		} else {
			/* 둘다 아닌 경우 */
			System.out.println("회원이 아니시네요");
		}
		
		forward.setForward(true);
		forward.setNextURL("./page/owner.jsp");
		return forward;
	}

}
