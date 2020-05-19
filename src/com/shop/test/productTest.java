package com.shop.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shop.mapper.CategoryMapper;
import com.shop.mapper.ProductMapper;
import com.shop.po.Category;
import com.shop.po.CategoryExample;


public class productTest {
	private ApplicationContext applicationContext;


	public void before() {
		applicationContext = new ClassPathXmlApplicationContext(
				"classpath:spring/applicationContext-dao.xml");
	}

	public void test() throws Exception {
		ProductMapper productMapper = applicationContext.getBean(ProductMapper.class);
//		List<Product> findProductByCid = productMapper.findProductByCid(1);
//		for (Product product : findProductByCid) {
//			System.out.println(product.getPname());
//		}
		/*ProductServiceImpl productServiceImpl = new ProductServiceImpl();
//		List<Product> list=productServiceImpl.findHotProduct();
		 ProductExample example = new ProductExample();
		 ProductExample.Criteria criteria = example.createCriteria();
		 criteria.andIsHotEqualTo(1);
		 example.setOrderByClause("pdate DESC");
		 example.setBeginPage(1);
		 example.setEnd(4);		 
		 List<Product> list = productMapper.selectByExample(example);
		 for (Product product : list) {
		 System.out.println(product.getPdate());
		 }	*/
	}


	public void testselectByExample() throws Exception {
		CategoryMapper categoryMapper = applicationContext.getBean(CategoryMapper.class);
		Category category = new Category();
		category.setCname("123");
		categoryMapper.insert(category);
		CategoryExample example = new CategoryExample();
		List<Category> list = categoryMapper.selectByExample(example);
		for (Category categoryList : list) {
			System.out.println(categoryList.getCname());
		}
	}

	public void testCategoryService() throws Exception {
		CategoryMapper categoryMapper = applicationContext.getBean(CategoryMapper.class);
	}
}
