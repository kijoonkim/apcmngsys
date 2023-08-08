package com.at.apcss.am.apc.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

@Controller
public class ApcEvrmntStngController extends BaseController{


	// APC 환경설정
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	// 사용자
	@Resource(name = "comUserService")
	private ComUserService comUserService;

	// 공통코드
	@Resource(name = "comCdService")
	private ComCdService comCdSerivce;

	// APC 환경설정 - APC 정보 조회
	@PostMapping(value = "/am/apc/selectApcInfo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcInfo(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		logger.debug("selectApcInfo 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ApcEvrmntStngVO resultVO = new ApcEvrmntStngVO();
		try {
			resultVO = apcEvrmntStngService.selectApcInfo(apcEvrmntStngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 정보관리 - APC 내역 조회
	@PostMapping(value = "/am/apc/selectApcDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcDsctnList(@RequestBody ApcEvrmntStngVO ApcEvrmntStngVO, HttpServletRequest request) throws Exception {
		logger.debug("selectApcDsctnList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcEvrmntStngVO> resultList = new ArrayList<>();
		try {
			resultList = apcEvrmntStngService.selectApcDsctnList(ApcEvrmntStngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 정보관리 - APC 내역 등록
	@PostMapping(value = "/am/apc/updateApcDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcDsctnList(@RequestBody Map<String, List<ApcEvrmntStngVO>> ApcEvrmntStngVO, HttpServletRequest request) throws Exception {
		logger.debug("updateApcDsctnList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			List<ApcEvrmntStngVO> origin = ApcEvrmntStngVO.get("origin").stream().collect(Collectors.toList());
			List<ApcEvrmntStngVO> modified = ApcEvrmntStngVO.get("modified").stream().collect(Collectors.toList());

			List<ApcEvrmntStngVO> insertList = new ArrayList<ApcEvrmntStngVO>(modified).stream().filter(e -> e.getApcCd() == null || e.getApcCd().equals("")).collect(Collectors.toList());
			for (ApcEvrmntStngVO element : insertList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				insertedCnt += apcEvrmntStngService.insertApcDsctn(element);
			}

			List<ApcEvrmntStngVO> updateList = new ArrayList<ApcEvrmntStngVO>();
			for (ApcEvrmntStngVO ei : origin) {
				for (ApcEvrmntStngVO ej : modified) {
					if (ei.getApcCd().equals(ej.getApcCd())) {
						if (ei.hashCode() != ej.hashCode()) {
							updateList.add(ej);
						} break;
					}
				}
			}
			for (ApcEvrmntStngVO element : updateList) {
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				insertedCnt += apcEvrmntStngService.updateApcDsctn(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	// APC 환경설정 - 사용자 목록 조회
	@PostMapping(value = "/am/apc/selectApcUserList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcUserList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {
		logger.debug("selectApcUserList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		try {
			resultList = apcEvrmntStngService.selectApcUserList(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 사용자 정보 등록
	@PostMapping(value = "/am/apc/updateComUserList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateComUserList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {
		logger.debug("updateComUserList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {

			for (ComUserVO comUserVO : comUserList) {
				comUserVO.setSysLastChgPrgrmId(getUserId());
				comUserVO.setSysLastChgUserId(getPrgrmId());
				result += comUserService.updateComUser(comUserVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
	
	// 품종선택 팝업
		@PostMapping(value = "/am/apc/selectVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> selectVrtyList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {

			logger.debug("selectVrtyList 호출 <><><><> ");

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<ComCdVO> resultList = new ArrayList<>();
			try {
				resultList = apcEvrmntStngService.selectVrtyList(comCdVO);
			} catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

			return getSuccessResponseEntity(resultMap);
		}

}
