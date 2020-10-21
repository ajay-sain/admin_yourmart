package admin.yourmart.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.core.codec.Hints;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.yourmart.model.Product;
import admin.yourmart.model.ProductForm;
import admin.yourmart.model.TableForm;
import admin.yourmart.services.HibernateService;
@Controller
public class Sellable {
	@GetMapping("sellable")
	public ModelAndView getProductDetails(@RequestParam Map<String,String> parms,ModelMap model) {
		ModelAndView mvn = new ModelAndView("sellable");
		Session session = HibernateService.getSessionFactory().openSession();
		Query query = session.createQuery("select p from Product p where p.productId=:id");
		query.setParameter("id", parms.get("productId"));	
		Product product = (Product) query.getResultList().get(0);
		model.addAttribute("product",product);
		ProductForm productForm = new ProductForm();
		productForm.setStatus(product.getStatus());
		List<String> productId = Arrays.asList(product.getProductId());
		System.out.println(product.getProductId());
		productForm.setId(productId);
		model.addAttribute("productForm",productForm);
		return mvn;
	}
	@PostMapping("sellable")
	public ModelAndView updateProduct(ProductForm productForm ) {
		ModelAndView mvn = new ModelAndView("redirect:products");
		Session session = HibernateService.getSessionFactory().openSession();
		String str = "UPDATE Product p set p.status=:status ,p.comment=:comment where p.productId like :id";
		
		System.out.println( productForm.getStatus());
		System.out.println(productForm.getComment());
		System.out.println(productForm.getId());
		
		Query query = session.createQuery(str);
		query.setParameter("status", productForm.getStatus());
		query.setParameter("comment", productForm.getComment());
		query.setParameter("id", productForm.getId());

		session.beginTransaction();
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		return mvn;
	}
}
