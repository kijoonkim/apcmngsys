package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface FarmLandInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmLandInfoVO selectFarmLandInfo(FarmLandInfoVO farmLandInfoVO);

	public List<FarmLandInfoVO> selectFarmLandInfoList(FarmLandInfoVO farmLandInfoVO);

	public int insertFarmLandInfo(FarmLandInfoVO farmLandInfoVO);

	public int updateFarmLandInfo(FarmLandInfoVO farmLandInfoVO);

	public int insertMegerFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;
	public int insertMegerLogFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;

	public int insertMegerFarmLandInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmLandInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;

	public int deleteFarmLandInfo(FarmLandInfoVO farmLandInfoVO) throws Exception;
}
