package com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;

/**
 * APC전수조사 대시보드 Mapper 인터페이스
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

@Mapper
public interface MdRtlFcltMapper {

	/**
	 * APC현황
	 * @param MdRtlFcltVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<MdRtlFcltVO> selectMapSttn(MdRtlFcltVO mdRtlFcltVO) throws Exception;
	/**
	 * APC지역목록조회
	 * @param MdRtlFcltVO
	 * @return List<MdRtlFcltVO>
	 * @throws Exception
	 */
	public List<MdRtlFcltVO> selectCtpvAreaList(MdRtlFcltVO mdRtlFcltVO) throws Exception;
	/**
	 * 개소수:소유자 및 운영자 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectOwnrAndOperGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 총 건축면적 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectAllBdarGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 물류: 상품화시설(건축면적) 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectLgstcsGdsGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 저온냉장고 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectLwtpStrgGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 예냉시설 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectPrprtnClngFcltGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * CA저장시설 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectStrgFcltGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 측정장비설치 개소수 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectFcltMsrmtEqpmntGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:전체 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmAllGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:자금 유형을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmFundTypeGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:소유자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmOwnrGridList(MdRtlFcltVO mdRtlFcltVO);

	/**
	 * 투자금액:운영자를 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 */
	public List<MdRtlFcltVO> selectInvstAtmOperPrsnGridList(MdRtlFcltVO mdRtlFcltVO);
}
