package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/updateCareTip.mn")
public class CareTipUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
	
		int tipNo = Integer.parseInt(request.getParameter("tipNo"));
		String tipCategory = request.getParameter("손질법");
		String tipTitle = request.getParameter("tipTitle");
		String tipInfo = request.getParameter("tipInfo");
		String tipTagName = request.getParameter("tipTagName"); 	//태그들 String으로 합쳐서 가져올것
		String tipPic = request.getParameter("tipPic");
		String tipContent = request.getParameter("summernote");
		
		Tip t = new Tip();
		t.setTipNo(tipNo);
		t.setTipCategory(tipCategory);
		t.setTipTitle(tipTitle);
		t.setTipInfo(tipInfo);
		t.setTipIngredientTag(tipTagName);
		t.setTipPicture(tipPic);
		t.setTipContent(tipContent);
		
		System.out.println(t);
		
		int result = new TipService().updateCareTip(t);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "손질법 글 수정 성공 !");
			response.sendRedirect(request.getContextPath()+"/careTipDetail.mn?tno="+tipNo);
		}else {
			request.setAttribute("alertMsg", "손질법 글 수정 실패");
			request.getRequestDispatcher("views/tip/careTipList.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}