package com.kh.admin.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.notice.model.service.NoticeService;

@WebServlet("/delete.mn")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NoticeDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		int result = new NoticeService().deleteNotice(noticeNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "공지사항 삭제 성공 !");
			response.sendRedirect(request.getContextPath() + "/notice.mn");
		}else {
			request.getSession().setAttribute("alertMsg", "공지사항 삭제 실패");
			request.getRequestDispatcher(request.getContextPath() + "/notice.mn").forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
