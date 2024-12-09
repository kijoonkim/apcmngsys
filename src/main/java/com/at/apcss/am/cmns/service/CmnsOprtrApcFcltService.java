package com.at.apcss.am.cmns.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.cmns.vo.CmnsOprtrApcFcltVO;
import com.at.apcss.am.sort.vo.SortBffaGrdVO;
import com.at.apcss.am.sort.vo.SortBffaWrhsStdGrdVO;
import com.at.apcss.co.cd.vo.ComCdVO;

/**
 * 품목정보 Service 인터페이스
 * @author 박승진
 * @since 2024.07.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.16  박승진        최초 생성
 * </pre>
 */
public interface CmnsOprtrApcFcltService {



	/**
	 * 품목정보 목록 조회
	 * @param cmnsOprtrApcFcltVO
	 * @return List<CmnsOprtrApcFcltVO>
	 * @throws Exception
	 */
	public List<CmnsOprtrApcFcltVO> selectCmnsOprtrApcSortFcltList(CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO) throws Exception;


	/**
	 * 품목정보 변경
	 * @param cmnsOprtrApcFcltVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateCmnsOprtrApcSortFclt(CmnsOprtrApcFcltVO cmnsOprtrApcFcltvo) throws Exception;

	/**
	 * 품목정보 삭제
	 * @param cmnsOprtrApcFcltVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> deleteCmnsOprtrApcSortFclt(CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO) throws Exception;





}
