package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.DdlnVO;

/**
 * 마감정보 Service 인터페이스
 * @author 하민우
 * @since 2023.08.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.10  하민우        최초 생성
 * </pre>
 */
public interface DdlnService {

	/**
	 * 마감정보 조회
	 * @param DdlnVO
	 * @return List<DdlnVO>
	 * @throws Exception
	 */
	public List<DdlnVO> selectDdlnList(DdlnVO DdlnVO) throws Exception;
	
	/**
	 * 마감정보 등록
	 * @param DdlnVO
	 * @return
	 * @throws Exception
	 */
	public int insertDdln(DdlnVO DdlnVO) throws Exception;
	
	/**
	 * 마감정보 수정
	 * @param DdlnVO
	 * @return
	 * @throws Exception
	 */
	public int updateDdln(DdlnVO DdlnVO) throws Exception;
	
	/**
	 * 마감정보 등록
	 * @param ddlnList
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> multiDdlnList(List<DdlnVO> ddlnList) throws Exception;
	
	/**
	 * 마감정보 삭제
	 * @param DdlnVO
	 * @return
	 * @throws Exception
	 */
	public int deleteDdln(DdlnVO DdlnVO) throws Exception;
}
