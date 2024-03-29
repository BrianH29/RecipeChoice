package com.kh.admin.faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.faq.model.service.FaqService;
import com.kh.admin.faq.model.vo.Faq;

/**
 * Servlet implementation class FaqUpdateFormServlet
 */
@WebServlet("/updateForm.mf")
public class FaqUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		Faq f = new FaqService().selectFaq(fno); //게시글 제목, 게시글 내용 , 번호
		
		request.setAttribute("f",f);
		
		RequestDispatcher view = request.getRequestDispatcher("views/faq/faqUpdateForm.jsp");
		view.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
