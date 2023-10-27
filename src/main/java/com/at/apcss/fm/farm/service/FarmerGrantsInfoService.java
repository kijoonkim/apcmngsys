package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoVO;


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
public interface FarmerGrantsInfoService {

	/**
	 * 정보를 조회한다.
	 * @param farmerGrantsInfoVO
	 * @return
	 * @throws Exception
	 */
	public FarmerGrantsInfoVO selectFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public List<FarmerGrantsInfoVO> selectFarmerGrantsInfoList(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int insertFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int updateFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int multiSaveFarmerGrantsInfoList(List<FarmerGrantsInfoVO> farmerGrantsInfoVOList) throws Exception;

	public int insertMegerFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVOList) throws Exception;
	public int insertMegerLogFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVOList) throws Exception;

	public int insertMegerFarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVOList) throws Exception;

	public int deleteFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

}
