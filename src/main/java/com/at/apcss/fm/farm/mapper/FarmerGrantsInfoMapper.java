package com.at.apcss.fm.farm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.farm.vo.FarmerGrantsInfoVO;

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
public interface FarmerGrantsInfoMapper {

	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerGrantsInfoVO selectFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO);

	public List<FarmerGrantsInfoVO> selectFarmerGrantsInfoList(FarmerGrantsInfoVO FarmerGrantsInfoVO);

	public int insertFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO);

	public int updateFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO);

	public int insertLogFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

	public int deleteFarmerGrantsInfo(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;

	/**
	 * 전체 농업인 번호 리스트 조회
	 * @param
	 * @return List<FarmerInfoVO>
	 * @throws Exception
	 */
	public List<FarmerGrantsInfoVO> selectFrmerSnList(FarmerGrantsInfoVO FarmerGrantsInfoVO) throws Exception;
}
