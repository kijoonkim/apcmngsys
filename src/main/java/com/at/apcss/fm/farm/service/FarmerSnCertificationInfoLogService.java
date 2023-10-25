package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoLogVO;


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
public interface FarmerSnCertificationInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param farmerSnCertificationInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public FarmerSnCertificationInfoLogVO selectFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVO) throws Exception;

	public List<FarmerSnCertificationInfoLogVO> selectFarmerSnCertificationInfoLogList(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVO) throws Exception;

	public int insertFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVO) throws Exception;

	public int updateFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVO) throws Exception;

	public int multiSaveFarmerSnCertificationInfoLogList(List<FarmerSnCertificationInfoLogVO> farmerSnCertificationInfoLogVOList) throws Exception;
	public int insertMegerFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVOList) throws Exception;
	public int insertMegerLogFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVOList) throws Exception;
	public int updateMegerFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVOList) throws Exception;

	public int deleteFarmerSnCertificationInfoLog(FarmerSnCertificationInfoLogVO farmerSnCertificationInfoLogVO) throws Exception;

}
