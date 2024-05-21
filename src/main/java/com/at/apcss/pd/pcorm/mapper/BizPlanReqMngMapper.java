package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.BizPlanReqMngVO;

/**
 * 세류제츨 등록 관리 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface BizPlanReqMngMapper {

	/**
	 * 서류제츨 리스트 조회
	 * @param BizPlanRegVO
	 * @return List<BizPlanRegVO>
	 * @throws Exception
	 */
	public List<BizPlanReqMngVO> selectBizPlanReqMngList(BizPlanReqMngVO bizPlanReqMngVO);

	/**
	 * 파일경로 리스트 조회
	 * @param BizPlanRegVO
	 * @return List<BizPlanRegVO>
	 * @throws Exception
	 */
	public List<BizPlanReqMngVO> bppvSelectFilePathList(BizPlanReqMngVO bizPlanReqMngVO);

	/**
	 * 제출 서류 상태 업데이트
	 * @param BizPlanRegVO
	 * @return List<BizPlanRegVO>
	 * @throws Exception
	 */
	public int bppvUpdateSbmsnDcnmt(BizPlanReqMngVO bizPlanReqMngVO);

	/**
	 * 파일 정보 조회
	 * @param BizPlanRegVO
	 * @return BizPlanRegVO
	 * @throws Exception
	 */
	public BizPlanReqMngVO selectFileInfo(BizPlanReqMngVO bizPlanReqMngVO);
}
