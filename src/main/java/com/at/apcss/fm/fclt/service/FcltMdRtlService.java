package com.at.apcss.fm.fclt.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.fm.fclt.vo.FcltMdRtlVO;

/**
 * APC전수조사관리 대시보드 Service 인터페이스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */
public interface FcltMdRtlService {
	/**
	 * 기준년도 목록 조회
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCrtrYnList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * APC현황
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectMapSttn(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * APC지역목록조회
	 * @param FcltMdRtlVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<FcltMdRtlVO> selectCtpvAreaList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	/**
	 * 산지유통시설현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectMdRtlOgnzNowGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * 산지유통시설지역별현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectMdRtlFcltRgnNowGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * 정부지원산지유통시설현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectGvrngmtSprtMdRtlFcltGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * 정부지원산지유통시설지역별현황 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectGvrngmtSprtMdRtlOgnzTypeGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * 산지유통시설 운영실적 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectMdRtlFcltOperPrfmncGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
	
	/**
	 * 정부지원 지역별 운영실적 목록을 조회한다.
	 * @param fcltMdRtlVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectGvrngmtSprtRgnOperPrfmncGridList(FcltMdRtlVO fcltMdRtlVO) throws Exception;
}
