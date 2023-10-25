package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerInfoLogVO;


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
public interface FarmerInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param farmerInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public FarmerInfoLogVO selectFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public List<FarmerInfoLogVO> selectFarmerInfoLogList(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public int insertFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public int updateFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public int multiSaveFarmerInfoLogList(List<FarmerInfoLogVO> farmerInfoLogVOList) throws Exception;
	public int insertMegerFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVOList) throws Exception;
	public int insertMegerLogFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVOList) throws Exception;
	public int updateMegerFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVOList) throws Exception;

	public int deleteFarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

}
