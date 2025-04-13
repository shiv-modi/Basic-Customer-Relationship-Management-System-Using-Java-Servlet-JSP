package com.crm.interfaces;

import java.util.List;

import com.crm.dao.Users;

public interface inter {
	
	public boolean addUsers(Users add);
	
	public boolean userExist(Users user);
	
	public boolean addCustomer(Users addCustome);
	
	public List<Users> viewCustomers();
	
	public boolean editCustomer(Users editCustomer);
	
	public boolean delCust(Users deleteCustomer);
	
	public String getCustomerName(Users email);
	
	public boolean interac(Users addInter);
	
	public List<Users> getInteractions(String email);
	
	public String DeleteInteraction(Users id);
}
