package com.at.apcss.pd.bsm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.pd.bsm.vo.ApcOgnzInfoVO;

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
public interface ApcOgnzInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public ApcOgnzInfoVO selectApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO);

	public List<ApcOgnzInfoVO> selectApcOgnzInfoList(ApcOgnzInfoVO apcOgnzInfoVO);

	public int insertApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO);

	public int updateApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO);

	public int insertMegerApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;
	public int insertMegerLogApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

	public int insertMegerApcOgnzInfoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogApcOgnzInfoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;

	public int deleteApcOgnzInfo(ApcOgnzInfoVO apcOgnzInfoVO) throws Exception;
}
