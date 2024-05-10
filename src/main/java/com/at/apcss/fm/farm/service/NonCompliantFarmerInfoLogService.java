package com.at.apcss.fm.farm.service;

import java.util.List;

import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoLogVO;


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
public interface NonCompliantFarmerInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param NonCompliantFarmerInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public NonCompliantFarmerInfoLogVO selectNonCompliantFarmerInfoLog(NonCompliantFarmerInfoLogVO NonCompliantFarmerInfoLogVO) throws Exception;

	public List<NonCompliantFarmerInfoLogVO> selectNonCompliantFarmerInfoLogList(NonCompliantFarmerInfoLogVO NonCompliantFarmerInfoLogVO) throws Exception;

}
