package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.PrdcrVO;

/**
 * 생산자정보 Mapper 인터페이스
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
public interface PrdcrMapper {

	/**
	 * 생산자정보 단건 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrVO selectPrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 목록 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrVO> selectPrdcrList(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 코드 목록 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrVO> selectPrdcrCdList(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 아그리스 생산자 마스터 목록 조회
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrVO> selectAgrixPrdcrList(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자코드 발번
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public PrdcrVO selectNewPrdcrCd(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 등록
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public int insertPrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 변경
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrdcr(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자정보 변경
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrdcrNm(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자 대표정보 변경
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrdcrRprs(PrdcrVO prdcrVO) throws Exception;


	/**
	 * 생산자정보 삭제
	 * @param prdcrVO
	 * @return
	 * @throws Exception
	 */
	public int deletePrdcr(PrdcrVO prdcrVO) throws Exception;
	/**
	 * APC 생산자 정보 업데이트
	 * @param prdcrVO
	 * @return integer
	 * @throws Exception
	 */
	public int updateApcPrdcr(PrdcrVO prdcrVO) throws Exception;
}
