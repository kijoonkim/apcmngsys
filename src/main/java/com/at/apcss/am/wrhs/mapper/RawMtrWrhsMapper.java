package com.at.apcss.am.wrhs.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.wrhs.vo.ComRawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsDsctnTotVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;

/**
 * 원물입고 Mapper 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface RawMtrWrhsMapper {

	/**
	 * 원물입고 단건 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsVO selectRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 목록 조회
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrWrhsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 파프리카입고내역집계 목록 조회
	 * @param RawMtrWrhsDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsDsctnTotVO> selectDsctnTotList(RawMtrWrhsDsctnTotVO rawMtrWrhsVO) throws Exception;

	/**
	 * 입고내역집계(공통) 목록 조회
	 * @param RawMtrWrhsDsctnTotVO
	 * @return
	 * @throws Exception
	 */
	public List<ComRawMtrWrhsDsctnTotVO> selectComDsctnTotList(ComRawMtrWrhsDsctnTotVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 변경
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 삭제
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 삭제 UPDATE DEL_YN Y
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsDelY(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물처리 삭제 UPDATE DEL_YN Y
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrPrcs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물처리 등록
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrPrcsDelY(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;


	/**
	 * 입고실적 목록 조회
	 *
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrWrhsPrfmncList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 재처리 목록 조회
	 *
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrPrcsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고 재처리 투입 목록 조회
	 *
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsVO> selectRawMtrPrcsInptList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;



}
