package com.study.guestbook;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.logging.Logger;
import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class GuestbookController {
	@Resource(name="guestbookService")
	private GuestbookService _guestbookService;

	@RequestMapping(value = "/guestbookList", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView openGuestbookList(Map<String, Object> guestbook) throws Exception {
		List<Map<String, Object>> list = this._guestbookService.selectGuestbookList(guestbook);
		ModelAndView mv = new ModelAndView("GuestbookList");
		mv.addObject("list", list);
		
		return mv;
	}
	
	@RequestMapping(value="/guestbookAdd")
	public ModelAndView addGuestbook(CommandMap map) throws Exception {
		// 생성이 이때
		ModelAndView mv = new ModelAndView("redirect:/guestbookList");
		
		// 디비에 넣는 건이거....
		this._guestbookService.addGuestbook(map.getMap());
		return mv;
	}
	
	@RequestMapping(value="/guestbookUpdate")
	public ModelAndView updateGuestbook(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/GuestbookUpdate");
		
		Map<String, Object> map = this._guestbookService.selectForUpdate(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	

}
