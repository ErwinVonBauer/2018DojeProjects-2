package com.groupware.vo;

public class UserVo {
	private int user_ai;
	private int dep_ai;
	private int rank_ai;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String dep_name = null;
	private String rank_name = null;
	
	public int getUser_ai() {
		return user_ai;
	}
	public void setUser_ai(int user_ai) {
		this.user_ai = user_ai;
	}
	public int getDep_ai() {
		return dep_ai;
	}
	public void setDep_ai(int dep_ai) {
		this.dep_ai = dep_ai;
	}
	public int getRank_ai() {
		return rank_ai;
	}
	public void setRank_ai(int rank_ai) {
		this.rank_ai = rank_ai;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDep_name() {
		return dep_name;
	}
	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}
	public String getRank_name() {
		return rank_name;
	}
	public void setRank_name(String rank_name) {
		this.rank_name = rank_name;
	}
	
	@Override
	public String toString() {
		return "UserVo [user_ai=" + user_ai + ", dep_ai=" + dep_ai + ", rank_ai=" + rank_ai + ", user_id=" + user_id
				+ ", user_pw=" + user_pw + ", user_name=" + user_name + ", dep_name=" + dep_name + ", rank_name="
				+ rank_name + "]";
	}
	
}
