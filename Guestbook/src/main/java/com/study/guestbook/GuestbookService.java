package com.study.guestbook;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("guestbookService")
public class GuestbookService {
	@Resource(name="GuestbookDAO")
	private GuestbookDao guestbookDAO;
	
	public List<Map<String,Object>> selectGuestbookList(Map<String, Object> map) throws Exception {
		return guestbookDAO.selectGuestbookList(map);
	}
	
	public void addGuestbook(Map<String, Object> map) throws Exception {
		this.guestbookDAO.addGuestbook(map);
	}

	public Map<String, Object> selectForUpdate(Map<String, Object> map) throws Exception {
	    Map<String, Object> resultMap = this.guestbookDAO.selectForUpdate(map);
	    return resultMap;

	}
}
