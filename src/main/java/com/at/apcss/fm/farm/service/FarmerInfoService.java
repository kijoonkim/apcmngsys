package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.farm.vo.FarmerInfoVO;


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
public interface FarmerInfoService {

	/**
	 * 정보를 조회한다.
	 * @param farmerInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerInfoVO selectFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public List<FarmerInfoVO> selectFarmerInfoList(FarmerInfoVO farmerInfoVO) throws Exception;
	public List<FarmerInfoVO> selectFarmerInfoEvApoList(FarmerInfoVO farmerInfoVO) throws Exception;

	public int insertFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public int updateFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

	public int multiSaveFarmerInfoList(List<FarmerInfoVO> farmerInfoVOList) throws Exception;

	public int insertMergeFarmerInfo(FarmerInfoVO farmerInfoVOList) throws Exception;
	public int insertMergeLogFarmerInfo(FarmerInfoVO farmerInfoVOList) throws Exception;

	public int insertMergeFarmerInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMergeLogFarmerInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMergeFarmerInfo(FarmerInfoVO farmerInfoVOList) throws Exception;

	public int deleteFarmerInfo(FarmerInfoVO farmerInfoVO) throws Exception;

}
