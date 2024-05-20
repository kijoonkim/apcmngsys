package com.at.apcss.pd.pcorm.service;

import java.util.List;

import com.at.apcss.pd.pcorm.vo.BizPlanRegFileVO;
import com.at.apcss.pd.pcorm.vo.BizPlanRegVO;


/**
 * 서류 제출 Service 인터페이스
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
public interface BizPlanRegService {

	/**
	 * 서류제출 리스트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public List<BizPlanRegVO> selectBizPlanRegList(BizPlanRegVO bizPlanRegVO) throws Exception;

	/**
	 * 서류제출 파일 리스트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public List<BizPlanRegVO> selectBizPlanRegFileList(BizPlanRegVO bizPlanRegVO) throws Exception;

	/**
	 * 설문조사 리스트 조회한다.
	 * @param BizPlanReqMngVO
	 * @return
	 * @throws Exception
	 */
	public List<BizPlanRegVO> selectSrvy(BizPlanRegVO bizPlanRegVO) throws Exception;

	/**
	 * 서류제출 파일 업로드 정보 저장
	 * @param BizPlanRegFileVO
	 * @return
	 * @throws Exception
	 */
	public int insertBizPlanRegFile(BizPlanRegFileVO bizPlanRegFileVO) throws Exception;


	/**
	 * 설문조사 저장
	 * @param BizPlanRegVO
	 * @return
	 * @throws Exception
	 */
	public int insertSrvy(BizPlanRegVO bizPlanRegVO) throws Exception;

}
