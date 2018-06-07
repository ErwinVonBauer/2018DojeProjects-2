package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.groupware.vo.ApprovalVo;

/*
 * 각 DAO에는 이름과 역할에 관련된 쿼리문만 넣자
 * 1.AprovDao->결재 관련 쿼리문
 * 단일PK셀렉트->int,다중PK셀렉트->String
*/

@Mapper
@SuppressWarnings("rawtypes")
public interface AprovDao {
	
	public List<HashMap> selectAprovbyUserPK(int user_ai);	
	public List<HashMap> selectAprovByDep(int dep_ai);
	public List<HashMap> selectAprovByDoc(int draft_ai);
	public List<HashMap> selectAprovByRank(int rank_ai);
	public List<HashMap> selectAprovByName(String aprov_title);
	public List<HashMap> selectAllAprov();
	
	public void insertAprov(ApprovalVo aprovvo);
	public void updateAprovStatus(int aprov_ai);
}
