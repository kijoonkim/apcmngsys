package com.at.apcss.fm.farm.service;

import java.util.List;

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
	 * @param FarmLandGrantsInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandGrantsInfoVO selectFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

	public List<FarmLandGrantsInfoVO> selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

	public int updateFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

	public int multiSaveFarmLandGrantsInfoList(List<FarmLandGrantsInfoVO> FarmLandGrantsInfoVOList) throws Exception;

	public int insertFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVOList) throws Exception;

	public int insertLogFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVOList) throws Exception;

	public int deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmLandGrantsInfoVO> selectFrmerSnList(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

}
