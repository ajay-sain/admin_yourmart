package admin.yourmart.controller;

import java.nio.channels.FileChannel.MapMode;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.yourmart.model.Catagory;
import admin.yourmart.services.HibernateService;

@Controller
public class Catagories {
	@GetMapping("catagories")
	public ModelAndView getCatagories(ModelMap model) {
		try {
			Session session = HibernateService.getSessionFactory().openSession();
			List<Catagory> catagories = session.createQuery("select p from Catagory p").getResultList();
			model.put("catagories",catagories );
			session.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		ModelAndView mvn = new ModelAndView("catagory");
		return mvn;
	}
	@PostMapping("catagories")
	public ModelAndView addCatagories(Catagory catagory) {
		Session session = HibernateService.getSessionFactory().openSession();
		session.beginTransaction();
		session.saveOrUpdate(catagory);
		session.getTransaction().commit();
		session.close();
		ModelAndView mvn = new ModelAndView("redirect:catagories");
		return mvn;
	}
	@RequestMapping("delete")
	public ModelAndView removeCatagories(@RequestParam Map<String, String> data) {
		Session session = HibernateService.getSessionFactory().openSession();
		session.beginTransaction();
		Query query = session.createQuery("DELETE FROM Catagory p where p.id in :id");
		query.setParameter("id", Integer.parseInt(data.get("id")));
		query.executeUpdate();
		session.getTransaction().commit();
		session.close();
		ModelAndView mvn = new ModelAndView("redirect:catagories");
		return mvn;
	}
}
