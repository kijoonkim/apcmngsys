package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.PrdcrDtlVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;

/**
 * 생산자 상세 정보 Mapper 인터페이스
 * @author 하민우
 * @since 2023.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.12.11  하민우        최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrDtlMapper {

	/**
	 * 생산자 상세 정보 목록 조회
	 * @param prdcrDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrDtlVO> selectPrdcrDtlList(PrdcrDtlVO prdcrDtlVO) throws Exception;

	/**
	 * 생산자 상세 정보 등록
	 * @param prdcrDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertPrdcrDtl(PrdcrDtlVO prdcrDtlVO) throws Exception;

	/**
	 * 생산자 상세 정보 변경
	 * @param prdcrDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrdcrDtl(PrdcrDtlVO prdcrDtlVO) throws Exception;
	
	/**
	 * 생산자 농가 정보 변경
	 * @param prdcrDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrdcrInfoFrmhs(PrdcrVO prdcrVO) throws Exception;

	/**
	 * 생산자 상세 정보 삭제
	 * @param prdcrDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updatePrdcrDtlDelYn(PrdcrDtlVO prdcrDtlVO) throws Exception;
	
	/**
	 * 생산자 상세 정보 삭제
	 * @param prdcrDtlVO
	 * @return
	 * @throws Exception
	 */
	public int deletePrdcrDtl(PrdcrDtlVO prdcrDtlVO) throws Exception;
}
