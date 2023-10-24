package com.at.apcss.fm.farm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.FarmerEducationInfoLogVO;

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
public interface FarmerEducationInfoLogMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public FarmerEducationInfoLogVO selectfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO);

	public List<FarmerEducationInfoLogVO> selectfarmerEducationInfoLogList(FarmerEducationInfoLogVO farmerEducationInfoLogVO);

	public int insertfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO);

	public int updatefarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO);

	public int insertMegerfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception;
	public int insertMegerLogfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception;
	public int updateMegerfarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception;

	public int deletefarmerEducationInfoLog(FarmerEducationInfoLogVO farmerEducationInfoLogVO) throws Exception;
}
