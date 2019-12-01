package com.itwill.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class ProductSortActionController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		String productCategory=request.getParameter("categoryNo");
		String columnName=request.getParameter("columnName");
		String sortOrder= request.getParameter("sortOrder");
		if(productCategory==null||productCategory==""||columnName==null||columnName=="") {
			forwardPath="redirect:productListView.jsp";
		}else {
			ProductService productService;
			try {
				productService = new ProductService();
				ArrayList<Product> productList =
						productService.sort(Integer.parseInt(productCategory), columnName, sortOrder);
				if (productList==null) {
					forwardPath="redirect:productListView.jsp";
				}else {
					request.setAttribute("productList", productList);
					forwardPath="redirect:productListView.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return forwardPath;
	}

}
