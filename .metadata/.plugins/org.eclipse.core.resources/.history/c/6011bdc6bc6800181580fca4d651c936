package com.groupware.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.groupware.vo.ApprovalVo;

@Mapper
public interface AprovDao {
	public void insertaprov(ApprovalVo aprovvo);
	public List<HashMap> selectAprov(int user_ai);
	public void updateAprovStatus(int aprov_ai);
	public List<HashMap> selectAprovByDep(int dep_ai);
	public List<HashMap> selectAprovByDoc(int draft_ai);
	public List<HashMap> selectAprovByRank(int rank_ai);
	public List<HashMap> selectAprovByName(String aprov_title);
	public List<HashMap> selectAllAprov();
}
