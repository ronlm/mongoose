package com.scau.action;

public class UserAction extends BaseAction{
	private String userName;
	private String password;
	public String login(){
		if(userName.equals("admin") && password.equals("admin"))
			return "success";
		else {
			return "fail";
		}
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}