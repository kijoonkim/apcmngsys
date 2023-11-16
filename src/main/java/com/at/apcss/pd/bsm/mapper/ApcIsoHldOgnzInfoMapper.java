package com.at.apcss.pd.bsm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcIsoHldOgnzInfoVO;

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
public interface ApcIsoHldOgnzInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public ApcIsoHldOgnzInfoVO selectApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO);

	public List<ApcIsoHldOgnzInfoVO> selectApcIsoHldOgnzInfoList(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO);

	public int insertApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO);

	public int updateApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO);

	public int insertMegerApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;
	public int insertMegerLogApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

	public int insertMegerApcIsoHldOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcIsoHldOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;

	public int deleteApcIsoHldOgnzInfo(ApcIsoHldOgnzInfoVO apcIsoHldOgnzInfoVO) throws Exception;
}
