package admin.yourmart.controller;


import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.yourmart.model.Admin;
import admin.yourmart.services.HibernateService;

@Controller
public class Authentication {
	@GetMapping("/")
	public ModelAndView rootPage() {
		System.out.println("route is working");
		ModelAndView mav = new ModelAndView("redirect:login");
		return mav;
	}
	
	
	
	@RequestMapping("/login")
	public ModelAndView register(@RequestParam Map<String,String> parms,ModelMap model) {
		ModelAndView mav = null;
		try {
			if((parms.get("id")==null || parms.get("id").equals("")) || (parms.get("password")==null || parms.get("password").equals(""))) {
				mav = new ModelAndView("login");
				mav.setStatus(HttpStatus.OK);
				mav.addObject("errorMessage", "Please provide login and password");
			}
			else {
				Session session = HibernateService.getSessionFactory().openSession();
				Query query = session.createQuery("SELECT password FROM Admin p where p.id = :adminId");
				query.setParameter("adminId", parms.get("id"));
				String password = (String) query.getResultList().get(0);
				System.out.println(password + "           " +parms.get("password"));
				if(password==null) {
					mav = new ModelAndView("login");
					mav.setStatus(HttpStatus.UNAUTHORIZED);
					mav.addObject("errorMessage", "Wrong usermane");
				}
				else {
					if(password.equals(parms.get("password"))) {
						mav = new ModelAndView("redirect:home");
						mav.setStatus(HttpStatus.OK);
					}else {
						mav = new ModelAndView("login");
						mav.setStatus(HttpStatus.UNAUTHORIZED);
						mav.addObject("errorMessage", "Wrong password");
					}
				}
			}
		}catch(Exception e) {
			mav = new ModelAndView("login");
			mav.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
			mav.addObject("errorMessage", "Server error please connect to technical team");
		}
		model.addAttribute("admin", new Admin());
		return mav;
	}
}