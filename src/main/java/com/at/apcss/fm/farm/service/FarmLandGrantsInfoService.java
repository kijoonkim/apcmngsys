package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoVO;


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
public interface FarmLandGrantsInfoService {

	/**
	 * 정보를 조회한다.
	 * @param farmLandGrantsInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandGrantsInfoVO selectFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

	public List<FarmLandGrantsInfoVO> selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

	public int insertFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

	public int updateFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

	public int multiSaveFarmLandGrantsInfoList(List<FarmLandGrantsInfoVO> farmLandGrantsInfoVOList) throws Exception;

	public int insertMegerFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVOList) throws Exception;
	public int insertMegerLogFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVOList) throws Exception;

	public int insertMegerFarmLandGrantsInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmLandGrantsInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVOList) throws Exception;

	public int deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

}
