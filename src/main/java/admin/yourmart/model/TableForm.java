package admin.yourmart.model;

import java.util.List;

public class TableForm {
	private String status ;
	private List<String> id;
	
	public List<String> getId() {
		return id;
	}
	public void setId(List<String> id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
