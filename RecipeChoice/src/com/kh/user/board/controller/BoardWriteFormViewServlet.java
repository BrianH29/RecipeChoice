package com.kh.user.board.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.board.model.service.BoardService;
import com.kh.user.board.model.vo.Board;

/**
 * Servlet implementation class BoardWriteFormViewServlet
 */
@WebServlet("/boardWriteForm.bo")
public class BoardWriteFormViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteFormViewServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String getBno = request.getParameter("bno");
		String regex = "^[0-9]*$";
		
		if(getBno != null && Pattern.matches(regex, getBno)) {
			int bno = Integer.parseInt(getBno);
			
			Board b = new BoardService().selectBoardDetail(bno);
			
			if(b != null) {
				request.setAttribute("boardInfo", b);
			}
		}
		
		request.getRequestDispatcher("/views/board/boardEnrollForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
