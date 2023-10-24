package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoLogVO;


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
public interface FarmerGrantsInfoLogService {

	/**
	 * 정보를 조회한다.
	 * @param farmerGrantsInfoLogVO
	 * @return
	 * @throws Exception
	 */
	public FarmerGrantsInfoLogVO selectfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;

	public List<FarmerGrantsInfoLogVO> selectfarmerGrantsInfoLogList(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;

	public int insertfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;

	public int updatefarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;

	public int multiSavefarmerGrantsInfoLogList(List<FarmerGrantsInfoLogVO> farmerGrantsInfoLogVOList) throws Exception;
	public int insertMegerfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVOList) throws Exception;
	public int insertMegerLogfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVOList) throws Exception;
	public int updateMegerfarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVOList) throws Exception;

	public int deletefarmerGrantsInfoLog(FarmerGrantsInfoLogVO farmerGrantsInfoLogVO) throws Exception;

}
