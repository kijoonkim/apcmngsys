package com.at.apcss.am.cmns.mapper;

import java.util.List;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.CmnsOprtrApcFcltVO;


/**
 * 품목정보 Mapper 인터페이스
 * @author 박승진
 * @since 2024.07.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.16  박승진			최초 생성
 * </pre>
 */
@Mapper
public interface CmnsOprtrApcFcltMapper {



	/**
	 * 시설운영정보 목록 조회
	 * @param CmnsOprtrApcFcltVO
	 * @return List<CmnsOprtrApcFcltVO>
	 * @throws Exception
	 */
	public List<CmnsOprtrApcFcltVO> selectCmnsOprtrApcSortFcltList(CmnsOprtrApcFcltVO cmnsOprtrApcFcltVO) throws Exception;



}
