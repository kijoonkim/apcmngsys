package com.at.apcss.am.wrhs.mapper;

import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsPlanVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;


/**
 * 원물입고계획등록 Mapper 인터페이스
 * @author
 * @since 2023.08.08
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.08     김호         최초 생성
 * </pre>
 */
@Mapper
public interface RawMtrWrhsIgiMapper {
	/**
	 * 검수등록 목록 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsIgiVO> selectRawMtrWrhsIgiList(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수등록 발번 조회
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public String selectGetIgiSeq(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;
	/**
	 * 검수 등록
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 수정
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 상세 등록
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

	/**
	 * 검수 상세 수정
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

	/**
	 * 검수 수정
	 * @param rawMtrWrhsIgiVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception;

	/**
	 * 검수 상세 등록
	 * @param rawMtrWrhsIgiDtlVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception;

}
