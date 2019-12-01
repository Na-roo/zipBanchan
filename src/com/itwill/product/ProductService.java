package com.itwill.product;

import java.util.ArrayList;

public class ProductService {
	private ProductDao productDao;
	
	public ProductService() throws Exception{
		productDao = new ProductDao();
	}
	
	//상품추가
	public boolean create(Product product) throws Exception {
		return productDao.create(product);
	}
	
	//상품번호로 찾기
	public Product findByNo(int productNo) throws Exception {
		return productDao.findByNo(productNo);
	}
	
	//상품이름으로 찾기
	public Product findByName(String productName) throws Exception {
		return productDao.findByName(productName);
	}
	
	//상품전체찾기
	public ArrayList<Product> findByAll() throws Exception {
		return productDao.findList();
	}
	
	//상품카테고리로 찾기
	public ArrayList<Product> findCategory(int categoryNo) throws Exception {
		return productDao.findCateList(categoryNo);
	}
	
	//상품삭제
	public boolean remove(int productNo) throws Exception {
		return productDao.remove(productNo);
	}
	
	//상품정보수정
	public boolean update(Product product) throws Exception {
		return productDao.update(product);
	}
	
	//상품주문수량에 따라 재고 변경
	public boolean updateByNoInvenDown(int productNo, int tempNo) throws Exception {
		return productDao.updateByNoInvenDown(productNo, tempNo);
	}
	
	//상품오름차순정렬
	public ArrayList<Product> sort(int categoryNo, String columnName, String sortOrder) throws Exception {
		return productDao.sort(categoryNo,columnName,sortOrder);
	}
	
	
	/*상품내림차순정렬
	public ArrayList<Product> sortByDesc(int categoryNo, String columnName) throws Exception {
		return productDao.sortByDesc(categoryNo,columnName);
	}
	*/
	
	
}
