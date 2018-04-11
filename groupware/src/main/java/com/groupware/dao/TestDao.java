package com.groupware.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TestDao {
	public int selectTest();
}
