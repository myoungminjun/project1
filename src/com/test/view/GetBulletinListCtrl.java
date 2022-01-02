package com.test.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.biz.BulletinDAO;
import com.test.model.BulletinVO;

@WebServlet("/GetBulletinListCtrl")
public class GetBulletinListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;   
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			
			
			BulletinDAO dao = new BulletinDAO();
	      ArrayList<BulletinVO> bulletinList = dao.getBulletinList();
	      
	      request.setAttribute("bulletinList", bulletinList);
	      RequestDispatcher view = request.getRequestDispatcher("/Bulletin/GetBulletinList.jsp");
	      view.forward(request, response);
	   }
	}
