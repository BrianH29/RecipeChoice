package com.kh.user.recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeSearchTemplateServlet
 */
@WebServlet("/searchTemplate.rp")
public class RecipeSearchTemplateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeSearchTemplateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String rcpDishType = request.getParameter("dishType");
		String[] rcpTags = request.getParameterValues("tag");
		String rcpTag = "";
		if(rcpTags != null) {
			rcpTag = String.join(",", rcpTags); 
		}
		System.out.println(rcpTag);
		
		int rcpTime = Integer.parseInt(request.getParameter("time"));
		
		ArrayList<Recipe> tags = new RecipeService().tagSearch(rcpTags,rcpTime, rcpDishType);

		int themeCount = new RecipeService().themeCount(rcpTag, rcpTime, rcpDishType);
		
		
		request.setAttribute("tags", tags);
		request.setAttribute("themeCount", themeCount); 
		request.getRequestDispatcher("views/recipe/recipeThemeSearchView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
