package admin.yourmart.services;

import java.util.Comparator;

import admin.yourmart.model.Seller;

public class SortingService implements Comparator<Seller>{
	private String sortingBase;
	private boolean desc;

	public SortingService(String sortingBase, boolean sortingType) {
		// TODO Auto-generated constructor stub
		this.sortingBase = sortingBase;
		this.desc = sortingType;
	}

	public int compare(Seller o1, Seller o2) {
		// TODO Auto-generated method stub
		int result = 0;
		if(sortingBase.equals("time")) {
			
			if(o1.getRegistrationTime().isAfter(o2.getRegistrationTime()))		
				result = 1;
			else
				result = -1;
		}
		else if(sortingBase.equals("id")) {
			if(Integer.parseInt(o1.getSellerId().substring(3)) > Integer.parseInt(o2.getSellerId().substring(3)))		
				result = 1;
			else
				result = -1;
		}
		else {
			if((o1.getStatus().equals("APPROVED") && o2.getStatus().equals("NEED_APPROVAL") )
					|| (o1.getStatus().equals("REJECTED") && o2.getStatus().equals("NEED_APPROVAL")) 
					|| (o1.getStatus().equals("REJECTED") && o2.getStatus().equals("APPROVED")))		
				result = 1;
			else
				result = -1;
		}
		if(this.desc)
			result *= -1;
		return result;
	}

}
