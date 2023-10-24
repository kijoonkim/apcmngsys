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
	public FarmerGrantsInfoVO selectfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public List<FarmerGrantsInfoVO> selectfarmerGrantsInfoList(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int insertFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int updateFarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int multiSavefarmerGrantsInfoList(List<FarmerGrantsInfoVO> farmerGrantsInfoVOList) throws Exception;

	public int insertMegerfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVOList) throws Exception;
	public int insertMegerLogfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVOList) throws Exception;

	public int insertMegerfarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogfarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVOList) throws Exception;

	public int deletefarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

}
