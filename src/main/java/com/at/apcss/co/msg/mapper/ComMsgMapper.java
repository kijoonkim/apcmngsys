package com.at.apcss.co.msg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.msg.vo.ComMsgVO;

/**
 * 공통메시지 Mapper 인터페이스
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
@Mapper
public interface ComMsgMapper {

	
	/**
	 * 메시지정보를 조회한다.
	 * @param comMsgVO
	 * @return
	 */
	public ComMsgVO selectComMsg(ComMsgVO comMsgVO);
	
	/**
	 * 메시지 목록을 조회한다.
	 * @param comMsgVO
	 * @return
	 */
	public List<ComMsgVO> selectComMsgList(ComMsgVO comMsgVO);
	
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
