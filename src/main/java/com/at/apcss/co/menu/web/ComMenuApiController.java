package com.at.apcss.co.menu.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuJsonVO;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * 메뉴정보 처리하는 컨트롤러 클래스
 * @author SI개발부 신정철
 * @since 2023.05.24
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.05.24  박지욱     	최초 생성
 *
 *  </pre>
 */
@RestController
public class ComMenuApiController extends BaseController {

	@Resource(name = "comMenuService")
	private ComMenuService comMenuService;

	@GetMapping(value = "/co/menu/menus/{id}")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> selectMenuById(@PathVariable String id, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ComMenuVO resultVO;

		try {
			resultVO = comMenuService.selectComMenu(id);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/menu/menus", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComMenuVO> resultList = new ArrayList<>();

		try {
			resultList = comMenuService.selectComMenuList(comMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/menu/menuTree", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuTreeList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		List<ComMenuVO> resultList = new ArrayList<>();

		try {
			resultList = comMenuService.selectMenuTreeList(comMenuVO);
		} catch (Exception e) {

		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/menu/topMenu", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTopMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		List<ComMenuVO> resultList = new ArrayList<>();
		List<ComMenuJsonVO> menuList = new ArrayList<>();

		try {
			resultList = comMenuService.selectTopMenuList(comMenuVO);

			if (resultList != null && !resultList.isEmpty()) {
				for ( ComMenuVO rslt : resultList ) {

					ComMenuJsonVO menu = new ComMenuJsonVO();
					menu.setId(rslt.getMenuId());
					menu.setPid(rslt.getUpMenuId());
					menu.setOrder(rslt.getIndctSeq());
					menu.setText(rslt.getMenuNm());
					menu.setUrl(rslt.getPageUrl());

					menuList.add(menu);
				}
			}
		} catch (Exception e) {

		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put("menuList", menuList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/menu/leftMenu", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectLeftMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		List<ComMenuVO> resultList = new ArrayList<>();

		try {
			resultList = comMenuService.selectLeftMenuList(comMenuVO);
		} catch (Exception e) {

		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 목록 조회
	@PostMapping(value = "/co/menu/selectMenuList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComMenuVO> resultList = new ArrayList<ComMenuVO>();
		try {
			 resultList = comMenuService.selectMenuList(comMenuVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 등록
	@PostMapping(value = "/co/menu/insertMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("insertNenu 호출 :: ");

		int result =0;
		try {
			// 임시
			comMenuVO.setSysFrstInptUserId("SYS");
			comMenuVO.setSysFrstInptPrgrmId("CO_001");
			comMenuVO.setSysLastChgUserId("SYS");
			comMenuVO.setSysLastChgPrgrmId("CO_001");
			result = comMenuService.insertMenu(comMenuVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 수정
	@PostMapping(value = "/co/menu/updateMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("updateMenu 호출 :: ");


		int result =0;
		try {
			// 임시
			comMenuVO.setSysLastChgUserId("SYS");
			comMenuVO.setSysLastChgPrgrmId("CO_001");
			result = comMenuService.updateMenu(comMenuVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 메뉴 삭제
	@PostMapping(value = "/co/menu/deleteMenu.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteMenu(@RequestBody ComMenuVO comMenuVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("deleteMenu 호출 :: ");
		int result =0;
		try {
			result = comMenuService.deleteMenu(comMenuVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 화면관리 메뉴 목록 조회
	@PostMapping(value = "/co/menu/selectMenuUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuUiList(@RequestBody ComMenuVO comMenuVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("selectMenuUiList 호출 :: ");
		List<ComMenuVO> menuList = new ArrayList<>();
		try {
			menuList = comMenuService.selectMenuUiList(comMenuVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, menuList);

		return getSuccessResponseEntity(resultMap);
	}

	// 화면관리 UI 목록 조회
	@PostMapping(value = "/co/menu/selectUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUiList(@RequestBody ComUiVO comUiVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("selectMenuUiList 호출 :: ");
		List<ComUiVO> menuList = new ArrayList<>();
		try {
			menuList = comMenuService.selectUiList(comUiVO);
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, menuList);

		return getSuccessResponseEntity(resultMap);
	}


	// 화면관리 메뉴 목록 조회
	@PostMapping(value = "/co/menu/insertComUiList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComUiList(@RequestBody List<ComUiVO> comUiList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.debug("insertComUiList 호출 :: ");
		int result = 0;
		try {
			for(ComUiVO comUiVO : comUiList) {
				comUiVO.setSysFrstInptPrgrmId("CO_002");
				comUiVO.setSysFrstInptUserId("admin");
				comUiVO.setSysLastChgPrgrmId("CO_002");
				comUiVO.setSysLastChgUserId("admin");
				result =+  comMenuService.insertComUi(comUiVO);
			}
		}catch (Exception e) {
			logger.debug("호출 중 실패");
		}
		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
