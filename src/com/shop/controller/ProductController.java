package com.shop.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.mapper.CategorysecondMapper;
import com.shop.po.Categorysecond;
import com.shop.po.CategorysecondExample;
import com.shop.po.Product;
import com.shop.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService prodcutService;
	@Autowired
	private CategorysecondMapper categorysecondMapper;

	@RequestMapping("/productFindByPid")
	public String productFindByPid(@RequestParam int pid,Model model) throws Exception {
		Product product = prodcutService.productFindByPid(pid);
		ArrayList<Integer> tempList = new ArrayList<Integer>();//一级分类的美容和医疗
		tempList.add(7);
		tempList.add(8);
		CategorysecondExample categorysecondExample = new CategorysecondExample();
		com.shop.po.CategorysecondExample.Criteria categorysecondExampleCriteria = categorysecondExample.createCriteria();
		categorysecondExampleCriteria.andCsidEqualTo(product.getCsid());
		categorysecondExample.setBeginPage(0);
		categorysecondExample.setLimitPage(100);
		List<Categorysecond> cslist = categorysecondMapper.selectByExample(categorysecondExample);
		product.setService(0);
		for(Categorysecond categorysecond:cslist) {
			if(categorysecond.getCid() == 7||categorysecond.getCid() == 8) {
				product.setService(1);
			}
		}
		model.addAttribute("product", product);
		return "product";
	}
}
