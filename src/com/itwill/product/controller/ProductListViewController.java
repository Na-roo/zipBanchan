package com.itwill.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class ProductListViewController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath = "";
		String productCategory = request.getParameter("categoryNo");
		String columnName = request.getParameter("columnName");
		String sortOrder = request.getParameter("sortOrder");
		if (productCategory == null || productCategory == "") {
			forwardPath = "redirect:/main.jsp";
		} else {
			try {
				ProductService productService = new ProductService();
				ArrayList<Product> categoryList = productService.findCategory(Integer.parseInt(productCategory));
				request.setAttribute("categoryList", categoryList);
				forwardPath = "forward:/productListView.jsp";

				if (sortOrder != null && columnName != null)  {

					productService = new ProductService();
					ArrayList<Product> productList = productService.sort(Integer.parseInt(productCategory), columnName, sortOrder);
					if (productList == null) {
						forwardPath = "redirect:/main.do";
					} else {
						request.setAttribute("productList", productList);
						forwardPath = "forward:/productListView.jsp";
						System.out.println(productList);
					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return forwardPath;
	}
}
