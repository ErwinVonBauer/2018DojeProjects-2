package com.groupware.vo;

public class DraftVo {
	int draft_ai;       
	int user_ai;        
	int dep_ai;         
	int rank_ai;        
	String draft_name; 
	String draft_content;  
	String draft_type;     
	int draft_temp;
	int draft_important;
	
	public int getDraft_ai() {
		return draft_ai;
	}
	public void setDraft_ai(int draft_ai) {
		this.draft_ai = draft_ai;
	}
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
	public String getDraft_name() {
		return draft_name;
	}
	public void setDraft_name(String draft_name) {
		this.draft_name = draft_name;
	}
	public String getDraft_content() {
		return draft_content;
	}
	public void setDraft_content(String draft_content) {
		this.draft_content = draft_content;
	}
	public String getDraft_type() {
		return draft_type;
	}
	public void setDraft_type(String draft_type) {
		this.draft_type = draft_type;
	}
	public int getDraft_temp() {
		return draft_temp;
	}
	public void setDraft_temp(int draft_temp) {
		this.draft_temp = draft_temp;
	}
	public int getDraft_important() {
		return draft_important;
	}
	public void setDraft_important(int draft_important) {
		this.draft_important = draft_important;
	}
	
	@Override
	public String toString() {
		return "DraftVo [draft_ai=" + draft_ai + ", user_ai=" + user_ai + ", dep_ai=" + dep_ai + ", rank_ai=" + rank_ai
				+ ", draft_name=" + draft_name + ", draft_content=" + draft_content + ", draft_type=" + draft_type
				+ ", draft_temp=" + draft_temp + ", draft_important=" + draft_important + "]";
	}
}
