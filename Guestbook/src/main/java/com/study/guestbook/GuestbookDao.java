package com.study.guestbook;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("GuestbookDAO")
public class GuestbookDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Object insert(String queryId, Object params) {
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params) {
		return sqlSession.update(queryId, params);
	}

	public List selectList(String queryId) {
		return sqlSession.selectList(queryId);
	}
	
	public List selectList(String queryId, Object params) {
		return sqlSession.selectList(queryId, params);
	}

	public List<Map<String, Object>> selectGuestbookList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("guestbook.selectGuestbookList",map);
	}
}
