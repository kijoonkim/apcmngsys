package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoVO;

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
public interface FarmLandGrantsInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmLandGrantsInfoVO selectFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO);

	public List<FarmLandGrantsInfoVO> selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO farmLandGrantsInfoVO);

	public int insertFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO);

	public int updateFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO);

	public int insertMegerFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;
	public int insertMegerLogFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

	public int insertMegerFarmLandGrantsInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogFarmLandGrantsInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;

	public int deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO farmLandGrantsInfoVO) throws Exception;
}
