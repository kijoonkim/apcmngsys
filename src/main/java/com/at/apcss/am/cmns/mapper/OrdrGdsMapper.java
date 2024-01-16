package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.OrdrGdsVO;

/**
 * 상품정보 Mapper 인터페이스
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
public interface OrdrGdsMapper {

	/**
	 * 발주상품정보 조회
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public OrdrGdsVO selectOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 목록 조회
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public List<OrdrGdsVO> selectOrdrGdsList(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 등록
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public int insertOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 변경
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public int updateOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 변경 : set delYn 'Y'
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public int updateOrdrGdsForDelY(OrdrGdsVO ordrGdsVO) throws Exception;
	
	/**
	 * 발주상품정보 삭제
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteOrdrGds(OrdrGdsVO ordrGdsVO) throws Exception;
	
	
	/**
	 * 발주상품정보 변경 적용
	 * @param ordrGdsVO
	 * @return
	 * @throws Exception
	 */
	public int updateSpMrktOrdrGdsUpdt(OrdrGdsVO ordrGdsVO) throws Exception;
	
}
