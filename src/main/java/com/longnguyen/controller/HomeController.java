package com.longnguyen.controller;

import java.io.IOException;
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
			sachService.setTimeSingle(null);
			sachService.setTimeThreads(null);

			SachModel sachModelSingle = new SachModel();
			SachModel sachModelThreads = new SachModel();
			sachService.listSingle = new ArrayList<SachModel>();
			sachService.listThreads = new ArrayList<SachModel>();
			sachService.getListSach(Integer.parseInt(number));
			sachModelSingle.setListResult(sachService.listSingle);
			sachModelThreads.setListResult(sachService.listThreads);

			req.setAttribute("modelSingle", sachModelSingle);
			req.setAttribute("modelThreads", sachModelThreads);
		} else if (action.equals("search")) {
			String tenNguoiMuon = req.getParameter("namePeople");
			if(sachService.listThreads != null) {
				SachModel item = new SachModel();
				item.setTenNguoiMuon(tenNguoiMuon);
				listKetQua = sachService.search(item, sachService.listThreads);
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
			if (selectSort.equals("people")) {
				sachService.setTimeSingle(sachService.SortSingle(sachService.listSingle, "people"));
			} else {
				sachService.setTimeSingle(sachService.SortSingle(sachService.listSingle, "nameBook"));
			}
		} else {
			String numberThread = req.getParameter("numberThread");
			sachService.setNumberThreads(Long.parseLong(numberThread));
			if (selectSort.equals("people")) {
				sachService.setTimeThreads(
						sachService.SortThreaded(Integer.parseInt(numberThread), sachService.listThreads, "people"));
			} else {
				sachService.setTimeThreads(
						sachService.SortThreaded(Integer.parseInt(numberThread), sachService.listThreads, "nameBook"));
			}
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
