package com.at.apcss.fm.farm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
	public FarmLandGrantsInfoVO selectFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO);

	public List<FarmLandGrantsInfoVO> selectFarmLandGrantsInfoList(FarmLandGrantsInfoVO FarmLandGrantsInfoVO);

	public int insertFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO);

	public int updateFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO);

	public int insertLogFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

	public int deleteFarmLandGrantsInfo(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmLandGrantsInfoVO> selectFrmerSnList(FarmLandGrantsInfoVO FarmLandGrantsInfoVO) throws Exception;
}
