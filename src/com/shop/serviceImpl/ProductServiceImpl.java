package com.shop.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.swing.text.StyledEditorKit.ForegroundAction;

import org.springframework.beans.factory.annotation.Autowired;

import com.shop.Utils.PageBean;
import com.shop.mapper.CategorysecondMapper;
import com.shop.mapper.ProductMapper;
import com.shop.po.Category;
import com.shop.po.CategoryExample;
import com.shop.po.Categorysecond;
import com.shop.po.CategorysecondExample;
import com.shop.po.Product;
import com.shop.po.ProductExample;
import com.shop.po.ProductExample.Criteria;
import com.shop.service.ProductService;


public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private CategorysecondMapper categorysecondMapper;
//	查询热门商品 带分页的查询
	public List<Product> findHotProduct() throws Exception {
		 ProductExample example = new ProductExample();
		 ProductExample.Criteria criteria = example.createCriteria();
		 criteria.andIsHotEqualTo(1);
		 example.setOrderByClause("pdate DESC");
		 example.setBeginPage(0);
		 example.setEnd(4);		 
		 List<Product> list = productMapper.selectByExample(example);
		 /*for (Product product : list) {
			System.out.println(product.getPname());
		}*/
		 if(list!=null && list.size()>0){
			 return list;
		 }
		 return null;
	}
	@Override
	public List<Product> findNewProduct() throws Exception {
		 ProductExample example = new ProductExample();
		 ProductExample.Criteria criteria = example.createCriteria();
		 example.setOrderByClause("pdate DESC");
		 example.setBeginPage(0);
		 example.setEnd(8);		 
		 List<Product> list = productMapper.selectByExample(example);
		 /*for (Product product : list) {
			System.out.println(product.getPname());
		}*/
		 if(list!=null && list.size()>0){
			 return list;
		 }
		 return null;
	}
//	根据id查找商品
	public Product productFindByPid(int pid) throws Exception {
		return productMapper.selectByPrimaryKey(pid);
	}
//	根据cid查找商品
	public PageBean<Product> findProductyBycid(int cid, int page)
			throws Exception {
		PageBean<Product> pageBean = new PageBean<>();
//		设置这是第几页
		pageBean.setPage(page);
//		设置10个
		int limitPage =12;
		pageBean.setLimitPage(limitPage);
//		设置一共多少页
		int totlePage = 0;
//		查询一共有多少页
		totlePage = productMapper.countProducyByCid(cid);
		if(Math.ceil(totlePage % limitPage)==0){
			totlePage=totlePage / limitPage;
		}else{
			totlePage=totlePage / limitPage+1;
		}
		pageBean.setTotlePage(totlePage);
		int beginPage= (page-1)*limitPage;
//		商品集合
		List<Product> list = productMapper.findProductByCid(cid,beginPage,limitPage);
		pageBean.setList(list);
		
		return pageBean;
	}
//	根据csid查找商品
	public PageBean<Product> finbProductByCsid(int csid, int page) {
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setPage(page);
//		设置10个
		int limitPage =12;
		pageBean.setLimitPage(limitPage);
//		设置一共多少页
		int totlePage = 0;
//		查询一共有多少页
		totlePage = productMapper.countProducyByCsid(csid);
		if(Math.ceil(totlePage % limitPage)==0){
			totlePage=totlePage / limitPage;
		}else{
			totlePage=totlePage / limitPage+1;
		}
		pageBean.setTotlePage(totlePage);
		int beginPage= (page-1)*limitPage;
//		商品集合
		List<Product> list = productMapper.findProductBycsid(csid,beginPage,limitPage);
		pageBean.setList(list);
		return pageBean;
	}
	@Override
	public Product finbProductByPid(int pid) {
		return productMapper.selectByPrimaryKey(pid);
	}
	@Override
	public PageBean<Product> findAllProduct(int page) throws Exception {
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setPage(page);
//		设置10个
		int limitPage =12;
		pageBean.setLimitPage(limitPage);
//		设置一共多少页
		int totlePage = 0;
//		查询一共有多少页
		ArrayList<Integer> tempList = new ArrayList<Integer>();//一级分类的美容和医疗
		tempList.add(7);
		tempList.add(8);
		CategorysecondExample categorysecondExample = new CategorysecondExample();
		com.shop.po.CategorysecondExample.Criteria categorysecondExampleCriteria = categorysecondExample.createCriteria();
		categorysecondExampleCriteria.andCidNotIn(tempList);
		categorysecondExample.setBeginPage(0);
		categorysecondExample.setLimitPage(100);
		List<Integer> secondCsidList = new ArrayList<Integer>();
		List<Categorysecond> secondCateList = categorysecondMapper.selectByExample(categorysecondExample);
		for(Categorysecond categorysecond:secondCateList) {
			secondCsidList.add(categorysecond.getCsid());
		}
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		if(secondCsidList.size() > 0) {
			criteria.andCsidIn(secondCsidList);
			totlePage = productMapper.countByExample(example);
			if(Math.ceil(totlePage % limitPage)==0){
				totlePage=totlePage / limitPage;
			}else{
				totlePage=totlePage / limitPage+1;
			}
			pageBean.setTotlePage(totlePage);
			int beginPage= (page-1)*limitPage;
//			商品集合
			List<Product> list = new ArrayList<Product>();
			ProductExample productExample = new ProductExample();
			productExample.setBeginPage(beginPage);
			productExample.setEnd(limitPage);
			
			list = productMapper.selectByExample(productExample);
			
			
			List<Product> returnList = new ArrayList<>(list);

			for(Product product:list) {
				if(!secondCsidList.contains(product.getCsid())) {
					returnList.remove(product);
				}
			}
			pageBean.setList(returnList);
		}
		
		return pageBean;
	}
	
	@Override
	public PageBean<Product> findAllService(int page) throws Exception {
		PageBean<Product> pageBean = new PageBean<>();
		pageBean.setPage(page);
//		设置10个
		int limitPage =12;
		pageBean.setLimitPage(limitPage);
//		设置一共多少页
		int totlePage = 0;
//		查询一共有多少页
		ArrayList<Integer> tempList = new ArrayList<Integer>();//一级分类的美容和医疗
		tempList.add(7);
		tempList.add(8);
		CategorysecondExample categorysecondExample = new CategorysecondExample();
		com.shop.po.CategorysecondExample.Criteria categorysecondExampleCriteria = categorysecondExample.createCriteria();
		categorysecondExampleCriteria.andCidIn(tempList);
		categorysecondExample.setBeginPage(0);
		categorysecondExample.setLimitPage(100);
		List<Integer> secondCsidList = new ArrayList<Integer>();
		List<Categorysecond> secondCateList = categorysecondMapper.selectByExample(categorysecondExample);
		for(Categorysecond categorysecond:secondCateList) {
			secondCsidList.add(categorysecond.getCsid());
		}
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		if(secondCsidList.size() > 0) {
			criteria.andCsidIn(secondCsidList);
			totlePage = productMapper.countByExample(example);
			if(Math.ceil(totlePage % limitPage)==0){
				totlePage=totlePage / limitPage;
			}else{
				totlePage=totlePage / limitPage+1;
			}
			pageBean.setTotlePage(totlePage);
			int beginPage= (page-1)*limitPage;
//			商品集合
			List<Product> list = new ArrayList<Product>();
			for(Integer csid:secondCsidList) {
				list.addAll(productMapper.findProductBycsid(csid,beginPage,limitPage));
			}
			
			pageBean.setList(list);
		}
		return pageBean;
	}
	@Override
	public void adminProduct_save(Product product) throws Exception {
		productMapper.insert(product);
	}
	@Override
	public void adminProduct_deletecs(int pid) throws Exception {
		productMapper.deleteByPrimaryKey(pid);
	}
	@Override
	public void adminProduct_update(Product product) throws Exception {
		productMapper.updateByPrimaryKey(product);
	}
	@Override
	public List<Product> searchProduct(String condition) throws Exception {
		 	 
		 List<Product> list = productMapper.searchProduct(condition) ;
		  
		 if(list!=null && list.size()>0){
			 return list;
		 }
		 return null;
	}
}
