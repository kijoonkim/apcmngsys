package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
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
	public FarmerGrantsInfoVO selectfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public List<FarmerGrantsInfoVO> selectfarmerGrantsInfoList(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public int insertfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public int updatefarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO);

	public int insertMegerfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;
	public int insertMegerLogfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int insertMegerfarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogfarmerGrantsInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerfarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;

	public int deletefarmerGrantsInfo(FarmerGrantsInfoVO farmerGrantsInfoVO) throws Exception;
}
