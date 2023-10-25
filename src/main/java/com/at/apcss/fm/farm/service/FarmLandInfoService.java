package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;


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
public interface FarmLandInfoService {

	/**
	 * 정보를 조회한다.
	 * @param farmLandInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandInfoVO selectFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;

	public List<FarmLandInfoVO> selectFarmLandInfoList(FarmLandInfoVO farmLandInfoVO) throws Exception;

	public int insertFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;

	public int updateFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;

	public int multiSaveFarmLandInfoList(List<FarmLandInfoVO> farmLandInfoVOList) throws Exception;

	public int insertMegerFarmLandInfo(FarmLandInfoVO farmLandInfoVOList) throws Exception;
	public int insertMegerLogFarmLandInfo(FarmLandInfoVO farmLandInfoVOList) throws Exception;

	public int insertMegerFarmLandInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmLandInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmLandInfo(FarmLandInfoVO farmLandInfoVOList) throws Exception;

	public int deleteFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;

}
