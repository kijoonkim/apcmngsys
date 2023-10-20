package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandInfoRegVO;


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
public interface FarmLandInfoRegService {

	/**
	 * 정보를 조회한다.
	 * @param farmLandInfoRegVO
	 * @return
	 * @throws Exception
	 */
	public FarmLandInfoRegVO selectfarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception;

	public List<FarmLandInfoRegVO> selectfarmLandInfoRegList(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception;

	public int insertfarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception;

	public int updatefarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception;

	public int multiSavefarmLandInfoRegList(List<FarmLandInfoRegVO> farmLandInfoRegVOList) throws Exception;

	public int deletefarmLandInfoReg(FarmLandInfoRegVO farmLandInfoRegVO) throws Exception;

}
