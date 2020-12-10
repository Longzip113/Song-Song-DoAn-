package com.longnguyen.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.longnguyen.model.SachModel;
import com.longnguyen.service.SachService;

@WebServlet(urlPatterns = { "/web-home", "/run", "/search" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	SachService sachService;
	List<SachModel> listKetQua;

	public HomeController() {
		sachService = new SachService();
		listKetQua = new ArrayList<SachModel>();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action.equals("random")) {
			String number = req.getParameter("number");
			sachService.setSizeArray(Long.parseLong(number));
			sachService.setNumberThreads(null);

			SachModel sachModelSingle = new SachModel();
			SachModel sachModelThreads = new SachModel();
			sachService.listSingle = new ArrayList<SachModel>();
			sachService.listThreads = new ArrayList<SachModel>();
            try {
                sachService.getListSach(Integer.parseInt(number));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            sachModelSingle.setListResult(sachService.listSingle);
			sachModelThreads.setListResult(sachService.listThreads);

			req.setAttribute("modelSingle", sachModelSingle);
			req.setAttribute("modelThreads", sachModelThreads);
		} else if (action.equals("search")) {
			String input = req.getParameter("input");
            String styleSearch = req.getParameter("styleSearch");
			if(sachService.listThreads != null) {
				listKetQua = sachService.search(input, sachService.listThreads, styleSearch);
				req.setAttribute("ketqua", listKetQua);
			}
		}

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/home.jsp");
		requestDispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String selectSort = req.getParameter("selectSort");
		String styleSort = req.getParameter("styleSort");

		if (styleSort.equals("single")) {
			sachService.setTimeSingle(sachService.SortSingle(sachService.listSingle, selectSort));
		} else {
			String numberThread = req.getParameter("numberThread");
			sachService.setNumberThreads(Long.parseLong(numberThread));
			sachService.SortThreaded(Integer.parseInt(numberThread), sachService.listThreads, selectSort);
		}

		SachModel sachModelSingle = new SachModel();
		SachModel sachModelThreads = new SachModel();
		sachModelSingle.setListResult(sachService.listSingle);
		sachModelThreads.setListResult(sachService.listThreads);

		req.setAttribute("modelSingle", sachModelSingle);
		req.setAttribute("modelThreads", sachModelThreads);

		req.setAttribute("timeSingle", sachService.getTimeSingle() + " ms");
		req.setAttribute("timeThreads", sachService.getTimeThreads() + " ms");

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/home.jsp");
		requestDispatcher.forward(req, resp);
	}

}
