package com.kh.admin.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.model.service.NoticeService;
import com.kh.admin.notice.model.vo.Notice;
import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;

@WebServlet("/notice.no")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Notice> noticeList = new NoticeService().selectNoticeList();
		
		request.setAttribute("noticeList", noticeList);
		
		request.getRequestDispatcher("views/notice/noticeList.jsp").forward(request, response);	
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
