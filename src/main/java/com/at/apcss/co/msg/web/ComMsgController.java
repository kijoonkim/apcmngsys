package com.at.apcss.co.msg.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.msg.service.ComMsgService;
import com.at.apcss.co.msg.vo.ComMsgVO;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * 메시지관리 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 메시지관리(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.12  김호     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ComMsgController extends BaseController{

	@Resource(name= "comMsgService")
	private ComMsgService comMsgService;

	@RequestMapping("/co/msg/msgMng.do")
	public String doMsg() {
		return "apcss/co/msg/comMsgMng";
	}
	
	// 메시지 조회
	@PostMapping(value = "/co/msg/selectComMsgList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody ComMsgVO comMsgVO, HttpServletRequest request) throws Exception{
		
		logger.debug("$$$ programId : {}", getPrgrmId());
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComMsgVO> resultList = new ArrayList<>();
		
		try {
			 resultList = comMsgService.selectComMsgList(comMsgVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}	
	
	// 메시지 등록
	@PostMapping(value = "/co/msg/insertComMsg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComMsg(@RequestBody ComMsgVO comMsgVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check
		
		// audit 항목
		comMsgVO.setSysFrstInptUserId(getUserId());
		comMsgVO.setSysFrstInptPrgrmId(getPrgrmId());
		comMsgVO.setSysLastChgUserId(getUserId());
		comMsgVO.setSysLastChgPrgrmId(getPrgrmId());
		
		logger.debug("getMsgKey(): {}", comMsgVO.getMsgKey());
		logger.debug("getMsgCn(): {}", comMsgVO.getMsgCn());
		logger.debug("getMsgKnd(): {}", comMsgVO.getMsgKnd());
		logger.debug("getRmrk(): {}", comMsgVO.getRmrk());
		
		
		int insertedCnt = 0;
		
		try {
			insertedCnt = comMsgService.insertComMsg(comMsgVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put("insertedCnt", insertedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}

	// 메시지 변경
	@PostMapping(value = "/co/msg/updateComMsg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComMsg(@RequestBody ComMsgVO comMsgVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check
		
		// audit 항목
		comMsgVO.setSysLastChgUserId(getUserId());
		comMsgVO.setSysLastChgPrgrmId(getPrgrmId());
		
		logger.debug("getMsgKey(): {}", comMsgVO.getMsgKey());
		logger.debug("getMsgCn(): {}", comMsgVO.getMsgCn());
		logger.debug("getMsgKnd(): {}", comMsgVO.getMsgKnd());
		logger.debug("getRmrk(): {}", comMsgVO.getRmrk());
		
		int updatedCnt = 0;
		
		try {
			updatedCnt = comMsgService.updateComMsg(comMsgVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put("updatedCnt", updatedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}

	// 메시지 삭제
	@PostMapping(value = "/co/msg/deleteComMsg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComMsg(@RequestBody ComMsgVO comMsgVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check
				
		// audit 항목
		comMsgVO.setSysLastChgUserId(getUserId());
		comMsgVO.setSysLastChgPrgrmId(getPrgrmId());
		
		logger.debug("getMsgKey(): {}", comMsgVO.getMsgKey());
		logger.debug("getMsgCn(): {}", comMsgVO.getMsgCn());
		logger.debug("getMsgKnd(): {}", comMsgVO.getMsgKnd());
		logger.debug("getRmrk(): {}", comMsgVO.getRmrk());
		
		int deletedCnt = 0;
		
		try {
			deletedCnt = comMsgService.deleteComMsg(comMsgVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put("deletedCnt", deletedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	// 메시지 목록 삭제
	@PostMapping(value = "/co/msg/deleteComMsgList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComMsgList(@RequestBody List<ComMsgVO> comMsgList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check
				
		// audit 항목
		for ( ComMsgVO comMsgVO : comMsgList ) {
			comMsgVO.setSysLastChgUserId(getUserId());
			comMsgVO.setSysLastChgPrgrmId(getPrgrmId());
			
			logger.debug("getMsgKey(): {}", comMsgVO.getMsgKey());
			logger.debug("getMsgCn(): {}", comMsgVO.getMsgCn());
			logger.debug("getMsgKnd(): {}", comMsgVO.getMsgKnd());
			logger.debug("getRmrk(): {}", comMsgVO.getRmrk());
		}
				
		int deletedCnt = 0;
		
		try {
			deletedCnt = comMsgService.deleteComMsgList(comMsgList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put("deletedCnt", deletedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
}
