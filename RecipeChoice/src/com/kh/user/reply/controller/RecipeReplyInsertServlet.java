package com.kh.user.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.member.model.vo.*;
import com.kh.user.reply.model.vo.*;
import com.kh.user.recipe.model.service.*;
/**
 * Servlet implementation class RecipeReplyInsertServlet
 */
@WebServlet("/replyInsert.re")
public class RecipeReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("content"); 
		int bno = Integer.parseInt(request.getParameter("bno"));
		String memName = request.getParameter("memName"); 
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Reply re = new Reply(); 
		re.setReplyContent(replyContent);
		re.setBno(bno);
		re.setUserNo(userNo);
		re.setMemName(memName);
		
		int result = new RecipeService().insertReply(re);
		
		response.getWriter().print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
