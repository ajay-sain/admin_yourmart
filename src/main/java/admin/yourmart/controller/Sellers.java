package admin.yourmart.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.tags.Param;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import admin.yourmart.model.Seller;
import admin.yourmart.model.TableForm;
import admin.yourmart.services.HibernateService;
import admin.yourmart.services.SortingService;

@Controller
public class Sellers {
	private int pageStart = 0;
	private int pageSize = 20;
	private boolean desc = false;
	private String sortingBase;
	private String status="";
	
	@RequestMapping("/home")
	public ModelAndView rootPage(@RequestParam Map<String,String> parms,ModelMap model) {
		ModelAndView mav = new ModelAndView("home");
		try {
			
			if(parms.get("pageSize")!=null && !parms.get("pageSize").equals("")) {
				this.pageStart = 0;
				this.pageSize = Integer.parseInt( parms.get("pageSize"));
			}
			if(parms.get("status")!=null)
				this.status = parms.get("status");
			
			if(parms.get("pageStart")!=null) {
				this.pageStart = Integer.parseInt(parms.get("pageStart"));
			}
			
			
			Session session = HibernateService.getSessionFactory().openSession();
			
			
			String str = "SELECT p FROM Seller p ";
			
			if(parms.get("searchParam")!=null) {
				str = str + "where p.companyName like :searchString or p.ownerName like :searchString or p.telephone like :searchString";
			}
			if(!this.status.equals("")) {
				if(parms.get("searchParam")==null)
					str = str + " where ";
				else
					str = str + " and ";
				str = str + " p.status= :status ";
			}
			if(parms.get("sortBy")==null){
				str = str + " order by p.status";
			}
			if(parms.get("sortBy")!=null && !parms.get("sortBy").equals("") ) {
				if(!parms.get("sortBy").equals(this.sortingBase)) {
					this.sortingBase = parms.get("sortBy");
					this.desc = false;
					this.pageStart = 0;
				}
				else {
//					this.desc = !this.desc;
				}
				if(this.desc) {
					str = str + " order by p."+this.sortingBase + " desc";
				}
				else {
					str = str + " order by p."+parms.get("sortBy");
				}
			}
			Query query = session.createQuery(str);
			
			if(parms.get("searchParam")!=null) {
				model.put("searchParam",parms.get("searchParam"));
				query.setParameter("searchString", "%"+parms.get("searchParam")+"%");
			}
			if(!this.status.equals("")) {
				query.setParameter("status",this.status);
			}
			query.setMaxResults(this.pageSize);
			query.setFirstResult(this.pageStart);
			List<Seller> sellers = query.getResultList();
			this.desc = !this.desc;
			model.put("sellers",sellers);
			
			
			
			
			model.put("pageStart",this.pageStart);
			model.put("contentSize", sellers.size());
			str = "SELECT count(*) FROM Seller p ";
			if(parms.get("searchParam")!=null) {
				str = str + " where p.companyName like :searchString or p.ownerName like :searchString or p.telephone like :searchString";
			}
			if(!this.status.equals("")) {
				if(parms.get("searchParam")==null)
					str = str + " where ";
				else
					str = str + " and ";
				str = str + " p.status= :status ";
			}
			if(parms.get("sortBy")==null){
				str = str + " order by p.status";
			}
			if(parms.get("sortBy")!=null && !parms.get("sortBy").equals("") ) {
				if(this.desc)
					str = str + " order by p."+this.sortingBase + " desc";
				else
					str = str + " order by p."+this.sortingBase;
			}
			query = session.createQuery(str);
			if(!this.status.equals("")) {
				query.setParameter("status",this.status);
			}
			if(parms.get("searchParam")!=null) {
				query.setParameter("searchString", "%"+parms.get("searchParam")+"%");
			}
			TableForm tableForm = new TableForm();
			tableForm.setStatus("APPROVED");
			model.addAttribute("table",tableForm );
			model.put("pageSize", this.pageSize);
			model.put("totalRecords", query.getSingleResult());
			model.put("status",this.status);
			session.close();
		}catch(Exception e) {
			mav.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return mav;
	}
	
	@PostMapping("/status-update")
	public ModelAndView statusUpdate(@ModelAttribute("SpringWeb") TableForm tableForm, 
		      ModelMap model) {
		ModelAndView mvn = new ModelAndView("redirect:home");
		try {
			Session session = HibernateService.getSessionFactory().openSession();
			String str = "UPDATE Seller p SET p.status = :newStatus where p.sellerId in :sellerList ";
			Query query = session.createQuery(str);
			query.setParameter("sellerList", tableForm.getId());
			query.setParameter("newStatus", tableForm.getStatus());
			session.beginTransaction();
			int result = query.executeUpdate();
			session.getTransaction().commit();
			session.close();
		}catch(Exception e) {
			mvn.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return mvn;
	}
	
	@GetMapping("/seller")
	public ModelAndView sellerDetails(@RequestParam Map<String, String> parms,ModelMap model) {
		ModelAndView mvn = new ModelAndView("seller");
		Session session = HibernateService.getSessionFactory().openSession();
		String str = "SELECT p FROM Seller p where p.sellerId= : id";
		Query query = session.createQuery(str);
		query.setParameter("id", parms.get("sellerId"));
		Seller seller = (Seller) query.getSingleResult();
		TableForm tableForm = new TableForm();
		tableForm.setStatus(seller.getStatus());
		List<String> sellers = Arrays.asList(seller.getSellerId());
		tableForm.setId(sellers);
		model.addAttribute("tableForm",tableForm);
		model.addAttribute("seller",seller);
		return mvn;
	}
	
}
