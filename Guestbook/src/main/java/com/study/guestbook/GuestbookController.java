package com.study.guestbook;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.CommandMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class GuestbookController {
	@Resource(name = "guestbookService")
	private GuestbookService _guestbookService;
	private Object no;

	@RequestMapping(value = "/guestbookList", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView openGuestbookList(Map<String, Object> guestbook) throws Exception {
		List<Map<String, Object>> list = this._guestbookService.selectGuestbookList(guestbook);
		ModelAndView mv = new ModelAndView("GuestbookList");
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/guestbookUpdate", method = { RequestMethod.GET })
	public ModelAndView updateGuestbook(HttpServletRequest request) throws Exception {
		Map<String, Object> newMap = new HashMap<String, Object>();
		newMap.put("NO", request.getParameter("NO"));

		no = request.getParameter("NO");
		ModelAndView mv = new ModelAndView("/GuestbookUpdate");

		Map<String, Object> list = this._guestbookService.selectForUpdate(newMap);

		mv.addObject("map", list);

		return mv;
	}

	@RequestMapping(value = "openGuestbookAdd")
	public ModelAndView openBoardWrite(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("GuestbookAdd");

		return mv;
	}

	@RequestMapping(value = "/guestbookAdd")
	public ModelAndView addGuestbook(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/guestbookList");
		Map<String, Object> map = new HashMap<String, Object>();

		if (isValidEmail(request.getParameter("EMAIL"))) {
			map.put("EMAIL", request.getParameter("EMAIL"));
			map.put("PWD", request.getParameter("PWD"));
			map.put("CONTENTS", request.getParameter("CONTENTS"));

			this._guestbookService.addGuestbook(map);

		}

		return mv;

	}

	public boolean isValidEmail(String email) {
		boolean err = false;
		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(email);
		if (m.matches()) {
			err = true;
		}
		return err;
	}

	@RequestMapping(value = "/updatedGuestbook")
	public ModelAndView updateBoard(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/guestbookList");

		Map<String, Object> map = new HashMap<String, Object>();

		if (isValidEmail(request.getParameter("email"))) {
			map.put("EMAIL", request.getParameter("email"));
			map.put("PWD", request.getParameter("pwd"));
			map.put("CONTENTS", request.getParameter("contents"));

			map.put("NO", no);

			System.out.println(map);

			this._guestbookService.updateGuestbook(map);
		}

		return mv;
	}

}
