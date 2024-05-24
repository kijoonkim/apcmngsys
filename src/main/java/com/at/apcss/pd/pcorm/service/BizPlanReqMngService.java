package com.at.apcss.pd.pcorm.service;

import java.util.List;

import com.at.apcss.pd.pcorm.vo.BizPlanReqMngVO;


/**
 * 서류 제출 관리 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface BizPlanReqMngService {

	/**
	 * 서류제출 리스트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public List<BizPlanReqMngVO> selectBizPlanReqMngList(BizPlanReqMngVO bizPlanReqMngVO) throws Exception;

	/**
	 * 파일경로 리스트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public List<BizPlanReqMngVO> bppvSelectFilePathList(BizPlanReqMngVO bizPlanReqMngVO) throws Exception;

	/**
	 * 서류 상태 업데이트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public int bppvUpdateSbmsnDcnmt(BizPlanReqMngVO bizPlanReqMngVO) throws Exception;

	/**
	 * 파일 정보를 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public BizPlanReqMngVO selectFileInfo(BizPlanReqMngVO bizPlanReqMngVO) throws Exception;

	/**
	 * 파일 정보 리스트를 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public List<BizPlanReqMngVO> selectFileInfoList(BizPlanReqMngVO bizPlanReqMngVO) throws Exception;

	/**
	 * 서류 상태 업데이트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public int deleteFileInfo(BizPlanReqMngVO bizPlanReqMngVO) throws Exception;

}
