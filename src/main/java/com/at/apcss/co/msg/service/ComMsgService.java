package com.at.apcss.co.msg.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.msg.vo.ComMsgVO;


/**
 * 공통메시지 Service 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
public interface ComMsgService {

	/**
	 * 메시지정보를 조회한다.
	 * @param comMsgVO
	 * @return
	 * @throws Exception
	 */
	public ComMsgVO selectComMsg(ComMsgVO comMsgVO) throws Exception;

	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 * @throws Exception
	 */
	public ComMsgVO selectComMsg(String msgKey) throws Exception;
	
	/**
	 * 메시지 목록을 조회한다.
	 * @param comMsgVO
	 * @return
	 * @throws Exception
	 */
	public List<ComMsgVO> selectComMsgList(ComMsgVO comMsgVO) throws Exception;

	
	/**
	 * 메시지정보를 등록한다.
	 * @param comMsgVO
	 * @return
	 * @throws Exception
	 */
	public int insertComMsg(ComMsgVO comMsgVO) throws Exception;
	
	/**
	 * 메시지정보를 변경한다.
	 * @param comMsgVO
	 * @return
	 * @throws Exception
	 */
	public int updateComMsg(ComMsgVO comMsgVO) throws Exception;
	
	/**
	 * 메시지정보를 삭제한다.
	 * @param comMsgVO
	 * @return
	 * @throws Exception
	 */
	public int deleteComMsg(ComMsgVO comMsgVO) throws Exception;
	
	/**
	 * 메시지 목록을 삭제한다.
	 * @param comMsgList
	 * @return
	 * @throws Exception
	 */
	public int deleteComMsgList(List<ComMsgVO> comMsgList) throws Exception;
	
}
