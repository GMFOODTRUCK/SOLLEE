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
			/* ���� ��� */
			System.out.println("�� ���̵� �˻� ����!");
			
			if(clist.get(0).getCustomerPwd().equals(password)) {
				/* ��й�ȣ �˻� �˻� */
				// �� �α��� ó��
				System.out.println("�� �α��� ����");
				session.setAttribute("customerNum", clist.get(0).getCustomerNum());
				session.setAttribute("id", clist.get(0).getCustomerName());
			} else {
				System.out.println("�� �α��� ����");
			}
			
		} else if(olist.get(0)!=null) {
			/* ������ ��� */
			System.out.println("���� ���̵� �˻� ����!");
			
			if(olist.get(0).getOwnerPwd().equals(password)) {
				/* ��й�ȣ �˻� �˻� */
				// ���� �α��� ó��
				System.out.println("���� �α��� ����");
				session.setAttribute("ownerNum", olist.get(0).getOwnerNum());
				session.setAttribute("id", olist.get(0).getOwnerName());
			} else {
				System.out.println("���� �α��� ����");
			}
			
		} else {
			/* �Ѵ� �ƴ� ��� */
			System.out.println("ȸ���� �ƴϽó׿�");
		}
		
		forward.setForward(true);
		forward.setNextURL("./page/owner.jsp");
		return forward;
	}

}
