package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoLogVO;


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
public interface FarmLandGrantsInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param farmLandGrantsInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandGrantsInfoLogVO selectFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception;

	public List<FarmLandGrantsInfoLogVO> selectFarmLandGrantsInfoLogList(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception;

	public int insertFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception;

	public int updateFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception;

	public int multiSaveFarmLandGrantsInfoLogList(List<FarmLandGrantsInfoLogVO> farmLandGrantsInfoLogVOList) throws Exception;
	public int insertMegerFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVOList) throws Exception;
	public int insertMegerLogFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVOList) throws Exception;
	public int updateMegerFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVOList) throws Exception;

	public int deleteFarmLandGrantsInfoLog(FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO) throws Exception;

}
