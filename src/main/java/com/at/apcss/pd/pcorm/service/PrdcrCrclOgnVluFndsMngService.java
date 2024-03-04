package com.at.apcss.pd.pcorm.service;

import java.util.List;

import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;


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
public interface PrdcrCrclOgnVluFndsMngService {

	/**
	 * 평가지표 리스트 조회한다.
	 * @param prdcrCrclOgnVluFndsMngVO
	 * @return
	 * @throws Exception
	 */
	public List<PrdcrCrclOgnVluFndsMngVO> selectScoreList(PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO) throws Exception;

}
