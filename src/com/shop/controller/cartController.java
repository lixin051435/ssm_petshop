package com.shop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.mapper.CategorysecondMapper;
import com.shop.mapper.ProductMapper;
import com.shop.po.Cart;
import com.shop.po.CartItem;
import com.shop.po.Categorysecond;
import com.shop.po.CategorysecondExample;
import com.shop.po.Product;
import com.shop.po.User;
import com.shop.service.ProductService;


@Controller
public class cartController {
	@Autowired
	private ProductService productService;
	@Autowired
	private CategorysecondMapper categorysecondMapper; 
	@Autowired
	private ProductMapper productMapper;
	//	添加到购物车
	@RequestMapping("/addCart")
	public String addCart(HttpServletRequest request,@RequestParam int pid,@RequestParam(required = false) Integer count ,Model model){
		if(count == null) {
			count = 1;
		}
		Product product = productService.finbProductByPid(pid);
		ArrayList<Integer> tempList = new ArrayList<Integer>();//一级分类的美容和医疗
		tempList.add(7);
		tempList.add(8);
		CategorysecondExample categorysecondExample = new CategorysecondExample();
		com.shop.po.CategorysecondExample.Criteria categorysecondExampleCriteria = categorysecondExample.createCriteria();
		categorysecondExampleCriteria.andCidIn(tempList);
		categorysecondExample.setBeginPage(0);
		categorysecondExample.setLimitPage(100);
		List<Categorysecond> cslist = categorysecondMapper.selectByExample(categorysecondExample);
		List<Integer> list = new ArrayList<Integer>();
		for(Categorysecond categorysecond:cslist) {
			list.add(categorysecond.getCsid());
		}
		List<Product> products = new ArrayList<Product>();
		for(Integer csid:list) {
			products.addAll(productMapper.findProductBycsid(csid,0,100));
		}
		Cart cart=getCart(request);//		存进一个购物项
		CartItem cartItem = new CartItem();
		cartItem.setCount(count);
		cartItem.setProduct(product);
		cartItem.setSubtotle(count*product.getShopPrice());
		//		存进购物车
		cart.addCart(cartItem);
		Map<Integer, CartItem> map = cart.getCartItem();
		for(Map.Entry<Integer, CartItem> a:map.entrySet()){
			for(Product tempProduct:products) {
				if(tempProduct.getPid() == a.getValue().getProduct().getPid()) {
					if(a.getValue().getCount() > 1) {
						cartItem.setCount(-1);
						cartItem.setProduct(product);
						cartItem.setSubtotle(-product.getShopPrice());
						cart.addCart(cartItem);
					}
				}
			}
			

		}
		
		return "cart";
	}
	//	查看我的购物车
	@RequestMapping("/myCart")
	public String myCart(HttpServletRequest request,Model model){
		User loginUser = (User) request.getSession().getAttribute("loginUser");
		if (loginUser == null) {
			model.addAttribute("message","您还没有登录！");
			return "msg";
		}
		return "cart";
	}

	//	清空购物车
	@RequestMapping("/clearCart")
	public String clearCart(HttpServletRequest request){
		Cart cart=getCart(request);
		cart.clearCart();
		return "redirect:myCart.action";
	}
	//	删除某个购物项
	@RequestMapping("/delProFromCart")
	public String delProFromCart(@RequestParam int pid,HttpServletRequest request){
		Cart cart=getCart(request);
		cart.delProFromCart(pid);
		return "redirect:myCart.action";
	}
	public Cart getCart(HttpServletRequest request) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
}
