package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.am.cmns.vo.LgszMrktVO;

/**
 * 거래처정보 Mapper 인터페이스
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
public interface CnptMapper {

	/**
	 * 거래처정보 단건 조회
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public CnptVO selectCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 목록 조회
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public List<CnptVO> selectCnptList(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 등록
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int insertCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 변경
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int updateCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 거래처정보 삭제
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCnpt(CnptVO cnptVO) throws Exception;

	/**
	 * 대형마켓 접속정보 조회
	 * @param lgszMrktVO
	 * @return
	 * @throws Exception
	 */
	public LgszMrktVO selectLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception;

	/**
	 * 대형마켓 목록 조회
	 *
	 * @param LgszMrktVO
	 * @return
	 * @throws Exception
	 */
	public List<LgszMrktVO> selectLgszMrktList(LgszMrktVO lgszMrktVO) throws Exception;

	/**
	 * 대형마트 변경
	 *
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int updateLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception;

	/**
	 * 대형마트 등록
	 *
	 * @param CnptVO
	 * @return
	 * @throws Exception
	 */
	public int insertLgszMrkt(LgszMrktVO lgszMrktVO) throws Exception;

	/**
	 * 거래처정보 삭제 가능 여부
	 * @param CnptVO
	 * @return List<CnptVO>
	 * @throws Exception
	 */
	public List<CnptVO> cnptDelible(CnptVO cnptVO) throws Exception;
	/**
	 * APC 기준정보 거래처 정보 업데이트
	 * @param CnptVO
	 * @return integer
	 * @throws Exception
	 */	
	public int updateApcCnpt(CnptVO cnptVO) throws Exception;
}
