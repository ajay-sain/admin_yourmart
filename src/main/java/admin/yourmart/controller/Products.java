package admin.yourmart.controller;

import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.yourmart.services.HibernateService;
import admin.yourmart.model.Product;
import admin.yourmart.model.TableForm;

@Controller
public class Products {
	private int pageStart = 0;
	private int pageSize = 20;
	private boolean desc ;
	private String orderBy = "";
	
	@GetMapping("/products")
	public ModelAndView getProducts(@RequestParam Map<String,String> parms,ModelMap model) {
		ModelAndView mvn = new ModelAndView("products");
		try {
		System.out.println(parms.get("orderBy"));
			if(parms.get("pageSize")!=null && !parms.get("pageSize").equals("")) {
				this.pageStart = 0;
				this.pageSize = Integer.parseInt( parms.get("pageSize"));
			}
			
			if(parms.get("pageStart")!=null) {
				this.pageStart = Integer.parseInt(parms.get("pageStart"));
			}
			
			
			Session session = HibernateService.getSessionFactory().openSession();
			
			String str = "SELECT p FROM Product p";
			if(parms.get("searchParam")!=null) {
				str = str + " where p.sellerProductId like :searchString or p.name like :searchString or p.productId like :searchString";
			}
			if(parms.get("orderBy")!=null && !parms.get("orderBy").equals("")) {
				if(!this.orderBy.equals(parms.get("orderBy"))) {
					this.orderBy = parms.get("orderBy");
					this.desc = false;
				}else {
					this.desc = !this.desc;
				}
				System.out.println(parms.get("orderBy"));
				this.pageStart = 0;
				if(desc) 
					str = str + " order by p."+this.orderBy+" desc";
				else
					str = str + " order by p."+this.orderBy;
			}
			Query query = session.createQuery(str);
			if(parms.get("searchParam")!=null) {
				model.put("searchParam",parms.get("searchParam"));
				query.setParameter("searchString", "%"+parms.get("searchParam")+"%");
			}
			query.setMaxResults(this.pageSize);
			query.setFirstResult(this.pageStart);
			List<Product> products = query.getResultList();
			model.addAttribute("product",products);
			
			
			
			str = "SELECT count(*) FROM Product p";
			if(parms.get("searchParam")!=null) {
				str = str + " where p.sellerProductId like :searchString or p.name like :searchString or p.productId like :searchString";
			}
			query = session.createQuery(str);
			if(parms.get("searchParam")!=null) {
				model.put("searchParam",parms.get("searchParam"));
				query.setParameter("searchString", "%"+parms.get("searchParam")+"%");
			}
			model.put("totalRecords",query.getResultList().get(0));
			
			
			
			model.put("contentSize", products.size());
			model.put("pageSize", this.pageSize);
			model.put("pageStart",this.pageStart+1);
			model.put("pageStart",this.pageStart);
			
		}catch(Exception e) {
			System.out.println("exception accoured" + e);
		}
		TableForm tableForm = new TableForm();
		tableForm.setStatus("APPROVED");
		model.addAttribute("table",tableForm );
		return mvn;
	}
	
	@PostMapping("/products")
	public ModelAndView updateStatus(@ModelAttribute("SpringWeb") TableForm tableForm) {
		ModelAndView mvn = new ModelAndView("redirect:products");
		Session session = HibernateService.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("UPDATE Product p SET status=: newStatus WHERE p.productId in :id");
		query.setParameter("id", tableForm.getId());
		query.setParameter("newStatus", tableForm.getStatus());
		int response = query.executeUpdate();
		System.out.println(response);
		session.getTransaction().commit();
		session.close();
		for(String i: tableForm.getId()) {
			System.out.println(i);
		}
		return mvn;
	}
}
