package com.itwill.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.dispatcher.Controller;
import com.itwill.product.Product;
import com.itwill.product.ProductService;

public class ProductDetailViewController implements Controller{

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		String productNo=request.getParameter("productNo");
		if (productNo==null||productNo.equals("")) {
			forwardPath="redirect:productListView.jsp";
		}else {
			try {
				ProductService productService = new ProductService();
				Product product = productService.findByNo(Integer.parseInt(productNo));
				if (product==null) {
					forwardPath="redirect:productListView.jsp";
				}else {
					request.setAttribute("product", product);
					forwardPath="forward:/productDetailView.jsp";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return forwardPath;
	}

}
