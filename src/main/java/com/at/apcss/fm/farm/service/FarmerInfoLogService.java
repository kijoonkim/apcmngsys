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
	public FarmerInfoLogVO selectfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public List<FarmerInfoLogVO> selectfarmerInfoLogList(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public int insertfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public int updatefarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

	public int multiSavefarmerInfoLogList(List<FarmerInfoLogVO> farmerInfoLogVOList) throws Exception;
	public int insertMegerfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVOList) throws Exception;
	public int insertMegerLogfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVOList) throws Exception;
	public int updateMegerfarmerInfoLog(FarmerInfoLogVO farmerInfoLogVOList) throws Exception;

	public int deletefarmerInfoLog(FarmerInfoLogVO farmerInfoLogVO) throws Exception;

}
