package com.at.apcss.co.msg.service;

import java.util.List;

import com.at.apcss.co.msg.vo.ComMsgVO;

public interface ComMsgService {

	/**
	 * 메시지 목록을 조회한다.
	 * @param comMsgVO
	 * @return
	 */
	public List<ComMsgVO> selectComMsgList(ComMsgVO comMsgVO);
	
	/**
	 * 메시지정보를 조회한다.
	 * @param comMsgVO
	 * @return
	 */
	public ComMsgVO selectComMsg(ComMsgVO comMsgVO);
	/**
	 * 메시지정보를 조회한다.
	 * @param msgKey
	 * @return
	 */
	public ComMsgVO selectComMsg(String msgKey);
	
	/**
	 * 메시지정보를 등록한다.
	 * @param comMsgVO
	 * @return
	 */
	public int insertComMsg(ComMsgVO comMsgVO);
	
	/**
	 * 메시지정보를 변경한다.
	 * @param comMsgVO
	 * @return
	 */
	public int updateComMsg(ComMsgVO comMsgVO);
	
	/**
	 * 메시지정보를 삭제한다.
	 * @param comMsgVO
	 * @return
	 */
	public int deleteComMsg(ComMsgVO comMsgVO);
}
