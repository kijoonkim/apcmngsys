package com.at.apcss.am.wrhs.mapper;

import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncComVO;
import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncDtlVO;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;


/**
 * 원물입고시간실적 Mapper 인터페이스
 * @author
 * @since 2023.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.21     김호         최초 생성
 * </pre>
 */
@Mapper
public interface RawMtrHrPrfmncMapper {
	/**
	 * 원물입고시간실적 목록 조회
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrHrPrfmncDtlVO> selectRawMtrHrPrfmncList(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception;
	/**
	 * 원물입고시간실적 토탈 조회
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrHrPrfmncDtlVO> selectRawMtrHrPrfmncTot(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception;
	/**
	 * 원물입고시간실적 등록
	 * @param rawMtrHrPrfmncComVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrHrPrfmncCom(RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO) throws Exception;

	/**
	 * 원물입고시간실적 변경
	 * @param rawMtrHrPrfmncComVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrHrPrfmncCom(RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO) throws Exception;

	/**
	 * 원물입고시간실적 삭제
	 * @param rawMtrHrPrfmncComVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrHrPrfmncCom(RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO) throws Exception;

	/**
	 * 원물입고시간실적 등록
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrHrPrfmncDtl(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception;

	/**
	 * 원물입고시간실적 변경
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrHrPrfmncDtl(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception;

	/**
	 * 원물입고시간실적 삭제
	 * @param rawMtrHrPrfmncDtlVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrHrPrfmncDtl(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception;
}
