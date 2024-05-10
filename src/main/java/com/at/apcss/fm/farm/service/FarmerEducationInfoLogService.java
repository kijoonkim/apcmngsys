package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoLogVO;


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
public interface FarmerEducationInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param farmerEducationInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public FarmerEducationInfoLogVO selectFarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception;

	public List<FarmerEducationInfoLogVO> selectFarmerEducationInfoLogList(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception;

}
