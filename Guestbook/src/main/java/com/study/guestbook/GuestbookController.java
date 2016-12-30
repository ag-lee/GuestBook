package com.study.guestbook;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class GuestbookController {
	@Resource(name="guestbookService")
	private GuestbookService _guestbookService;

	@RequestMapping(value = "/guestbookList", method = RequestMethod.GET)
	public ModelAndView openGuestbookList(Map<String, Object> guestbook) throws Exception {
		List<Map<String, Object>> list = this._guestbookService.selectGuestbookList(guestbook);
		ModelAndView mv = new ModelAndView("GuestbookList");
		mv.addObject("list", list);
		
		return mv;
	}
}
