package com.at.apcss.am.shpgot.mapper;

import com.at.apcss.am.shpgot.vo.ShpgotCrtrVO;
import com.at.apcss.am.shpgot.vo.ShpgotRsltVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;


/**
 * 반품관리 Mapper 인터페이스
 * @author 박승진
 * @since 2024.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.11  박승진        최초 생성
 * </pre>
 */
@Mapper
public interface ShpgotMngMapper {

	/**
	 * 기준상세 (사용) 조회
	 *
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotCrtrVO> selectCrtrDtlInUseList(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준정보 단건 조회
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public ShpgotCrtrVO selectCrtr(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준정보 목록 조회
	 *
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotCrtrVO> selectCrtrList(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준목록 단건 조회
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public ShpgotCrtrVO selectCrtrDtl(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 *
	 * @param shpgotCrtrVo
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotCrtrVO> selectCrtrDtlList(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준 등록
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertCrtr(ShpgotCrtrVO shpgotCrtrVO) throws Exception;


	/**
	 * 기준 변경
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateCrtr(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준 삭제
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCrtr(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준상세 등록
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertCrtrDtl(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준상세 변경
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateCrtrDtl(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 기준상세 삭제
	 * @param shpgotCrtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteCrtrDtl(ShpgotCrtrVO shpgotCrtrVO) throws Exception;

	/**
	 * 반품일자 max 순번 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public ShpgotRsltVO selectShpgotRsltRawMtrMaxSn(ShpgotRsltVO shpgotRsltVO) throws Exception;


	/**
	 * 반품일자 max 순번 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public ShpgotRsltVO selectShpgotRsltGdsMaxSn(ShpgotRsltVO shpgotRsltVO) throws Exception;


	/**
	 * 원물 반품 등록
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public int insertShpgotRsltRawMtr(ShpgotRsltVO shpgotRsltVO) throws Exception;

	public int updateShpgotRsltRawMtrForDelY(ShpgotRsltVO shpgotRsltVO) throws Exception;


	/**
	 * 원물 반출 단건 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public ShpgotRsltVO selectShpgotRsltRawMtr(ShpgotRsltVO shpgotRsltVO) throws Exception;

	/**
	 * 원물 반출 실적 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotRsltVO> selectShpgotRsltRawMtrList(ShpgotRsltVO shpgotRsltVO) throws Exception;


	/**
	 * 상품 반품 단건 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public ShpgotRsltVO selectShpgotRsltGds(ShpgotRsltVO shpgotRsltVO) throws Exception;


	/**
	 * 상품 반품 등록
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public int insertShpgotRsltGds(ShpgotRsltVO shpgotRsltVO) throws Exception;

	/**
	 * 상품 반품 공통 등록
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public int insertShpgotRsltGdsCom(ShpgotRsltVO shpgotRsltVO) throws Exception;

	public int updateShpgotRsltGdsForDelY(ShpgotRsltVO shpgotRsltVO) throws Exception;

	public int updateShpgotRsltGdsComForDelY(ShpgotRsltVO shpgotRsltVO) throws Exception;


	/**
	 * 상품 반출 실적 공통 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotRsltVO> selectShpgotRsltGdsComList(ShpgotRsltVO shpgotRsltVO) throws Exception;

	/**
	 * 상품 반출 실적 조회
	 * @param shpgotRsltVO
	 * @return
	 * @throws Exception
	 */
	public List<ShpgotRsltVO> selectShpgotRsltGdsList(ShpgotRsltVO shpgotRsltVO) throws Exception;


}