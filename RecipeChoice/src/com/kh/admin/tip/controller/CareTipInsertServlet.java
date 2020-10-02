package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/insertCareTip.mn")
public class CareTipInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// careTipEnrollForm.jsp에서 받은 파라미터 넣어서 tip객체 생성
		String tipCategory = request.getParameter("손질법");
		String tipTitle = request.getParameter("tipTitle");
		String tipInfo = request.getParameter("tipInfo");
		String tipTagName = request.getParameter("tipTagName");
		String tipPic = request.getParameter("tipPic");
		String tipContent = request.getParameter("summernote");
		
		Tip t = new Tip();
		t.setTipCategory(tipCategory);
		t.setTipTitle(tipTitle);
		t.setTipInfo(tipInfo);
		t.setTipIngredientTag(tipTagName);
		t.setTipPicture(tipPic);
		t.setTipContent(tipContent);
		
		int result = new TipService().insertCareTip(t);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "손질법 게시판에 글등록 성공!");
		}else {
			request.getSession().setAttribute("alertMsg","손질법 게시판에 글등록 실패");
		}
		
		response.sendRedirect(request.getContextPath()+"/careTipList.mn");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}