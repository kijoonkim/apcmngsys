package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandInfoLogVO;


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
public interface FarmLandInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param farmLandInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandInfoLogVO selectFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception;

	public List<FarmLandInfoLogVO> selectFarmLandInfoLogList(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception;

	public int insertFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception;

	public int updateFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception;

	public int multiSaveFarmLandInfoLogList(List<FarmLandInfoLogVO> farmLandInfoLogVOList) throws Exception;
	public int insertMegerFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVOList) throws Exception;
	public int insertMegerLogFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVOList) throws Exception;
	public int updateMegerFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVOList) throws Exception;

	public int deleteFarmLandInfoLog(FarmLandInfoLogVO farmLandInfoLogVO) throws Exception;

}
