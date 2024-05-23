package com.at.apcss.pd.pcorm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.pcorm.vo.BizPlanRegFileVO;
import com.at.apcss.pd.pcorm.vo.BizPlanRegVO;

/**
 * 서류제출 등록 Mapper 인터페이스
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
public interface BizPlanRegMapper {

	/**
	 * 사용자 정보 조회
	 * @param BizPlanRegVO
	 * @return List<BizPlanRegVO>
	 * @throws Exception
	 */
	public List<BizPlanRegVO> selectBizPlanRegList(BizPlanRegVO bizPlanRegVO);

	/**
	 * 제출 서류 리스트 조회
	 * @param BizPlanRegVO
	 * @return List<BizPlanRegVO>
	 * @throws Exception
	 */
	public List<BizPlanRegVO> selectBizPlanRegFileList(BizPlanRegVO bizPlanRegVO);

	/**
	 * 설문조사 리스트 조회
	 * @param BizPlanRegVO
	 * @return List<BizPlanRegVO>
	 * @throws Exception
	 */
	public List<BizPlanRegVO> selectSrvy(BizPlanRegVO bizPlanRegVO);

	/**
	 * 제출 서류 정보 저장
	 * @param BizPlanRegFileVO
	 * @return int
	 * @throws Exception
	 */
	public int insertSbmsnDcmnt(BizPlanRegFileVO bizPlanRegFileVO);
	/**
	 * 제출 서류 파일 정보 저장
	 * @param BizPlanRegFileVO
	 * @return
	 * @throws Exception
	 */
	public int insertSbmsnDcmntFile(BizPlanRegFileVO bizPlanRegFileVO);

	/**
	 * 설문조사 저장
	 * @param BizPlanRegVO
	 * @return
	 * @throws Exception
	 */
	public int insertSrvy(BizPlanRegVO bizPlanRegVO);
}
