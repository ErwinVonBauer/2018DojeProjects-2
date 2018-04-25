package com.groupware.dao;

import org.apache.ibatis.annotations.Mapper;
import com.groupware.vo.DraftVo;

@Mapper
public interface DraftDao {
	public int selectDocCount();
	public String[] selectDocs();
	public String[] selectDocsPK();
	public String selectDocContent(DraftVo vo);
	public DraftVo selectDraftInfos(int pk);
	public void insertDoc(DraftVo vo);
	public void updateDoc(DraftVo vo);
}