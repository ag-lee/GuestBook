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
}
