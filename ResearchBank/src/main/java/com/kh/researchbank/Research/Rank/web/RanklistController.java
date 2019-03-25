package com.kh.researchbank.Research.Rank.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.researchbank.Crm.Inquiry.Paging;
import com.kh.researchbank.Research.Rank.service.RanklistService;
import com.kh.researchbank.common.CommandMap;

@Controller
public class RanklistController {
	@Resource(name = "ranklistService")
	protected RanklistService ranklistService;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;

	private int searchNum;
	private String isSearch;

	@RequestMapping(value = "/research/rank", method = RequestMethod.GET)
	public ModelAndView index(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("research/index");
		Map map = commandMap.getMap();
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		isSearch = request.getParameter("isSearch");
		if (isSearch != null)
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

		map.put("isSearch", isSearch);
		map.put("searchNum", searchNum);

		List<Map<String, Object>> list = ranklistService.Rank(map);

		if (isSearch != null) {

			totalCount = list.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "index", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("list", list);

			return mv;
		}

		totalCount = list.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "index");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);

		mv.addObject("list", list);

		return mv;

	}
	@RequestMapping(value = "/research/rankpoint", method = RequestMethod.GET)
	public ModelAndView index2(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("research/index");
		Map map = commandMap.getMap();
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		isSearch = request.getParameter("isSearch");
		if (isSearch != null)
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

		map.put("isSearch", isSearch);
		map.put("searchNum", searchNum);

		List<Map<String, Object>> list = ranklistService.RankPoint(map);

		if (isSearch != null) {

			totalCount = list.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "index", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("list", list);

			return mv;
		}

		totalCount = list.size();

		page = new Paging(currentPage, totalCount, blockCount, blockPage, "index");
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);

		mv.addObject("list", list);

		return mv;

	}
}
