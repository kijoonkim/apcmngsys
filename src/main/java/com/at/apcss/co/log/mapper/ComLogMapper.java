package com.at.apcss.co.log.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.co.log.vo.ComLogVO;

/**
 * 공통 이력 Mapper
 * @author FINEVT 개발팀 신정철
 * @since 2023.06.20
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일        수정자        수정내용
 *  ----------  ----------   ---------------------------
 *  2023.06.20  신정철         최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ComLogMapper {

	/**
	 * 접속 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectCntnHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 화면열람 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectMenuHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 송수신 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectTrsmHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 배치실행 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectBatchHstryList(ComLogVO comLogVO) throws Exception;

	/**
	 * 원물재고 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectRawMtrHstryList(ComLogVO comLogVO) throws Exception;
	/**
	 * 선별재고 변경 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectSortHstryList(ComLogVO comLogVO) throws Exception;
	/**
	 * 상품재고 변경 이력정보를 조회한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public List<ComLogVO> selectGdsHstryList(ComLogVO comLogVO) throws Exception;
	/**
	 * 화면열람 이력정보를 생성한다.
	 * @param comLogVO
	 * @return
	 * @throws Exception
	 */
	public void insertMenuHstry(ComLogVO comLogVO) throws Exception;
}
