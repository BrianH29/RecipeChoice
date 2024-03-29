package com.kh.admin.contact.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.contact.model.service.ContactService;
import com.kh.admin.contact.model.vo.Contact;

/**
 * Servlet implementation class ContactInsertServlet
 */
@WebServlet("/insert.co")
public class ContactInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String userNo = request.getParameter("userNo"); 
		String conTitle = request.getParameter("title");
		String conType = request.getParameter("category");	
		String conContent = request.getParameter("content");
		
		Contact c = new Contact(); //매개변수 대신 기본생성자로
		c.setUserNo(userNo);
		c.setConTitle(conTitle);
		c.setConType(conType);
		c.setConContent(conContent);
		
		int result = new ContactService().insertContact(c);//처리된 행 수 받아냄
		
		if(result > 0) {//성공 ==> 1:1문의 리스트 페이지
			
			request.getSession().setAttribute("alertMsg", "성공적으로 문의가 등록되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/contactList.co?currentPage=1");
			
		}else { // 실패 ==> 에러페이지
			
			request.setAttribute("errorMsg","문의 등록이 실패하였습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
