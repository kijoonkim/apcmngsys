package com.at.apcss.pd.pcorm.service;

import java.util.List;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;


/**
 * 평가등록결과 Service 인터페이스
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
public interface PrdcrCrclOgnVluIdctrMngService {

	/**
	 * 통합조직 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectUoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception;

	/**
	 * 출자출하조직 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectIsoList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception;

	/**
	 * 생산자조직 등록결과 리스트 조회
	 * @param PrdcrCrclOgnVluIdctrMngVO
	 * @return List<PrdcrCrclOgnVluIdctrMngVO>
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluIdctrMngVO> selectFrmhsList(PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO) throws Exception;

}
