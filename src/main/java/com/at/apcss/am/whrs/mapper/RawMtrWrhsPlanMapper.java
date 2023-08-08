package com.at.apcss.am.whrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.am.whrs.vo.RawMtrWrhsPlanVO;


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
public interface RawMtrWrhsPlanMapper {
	/**
	 * 원물입고계획 단건 조회
	 * @param rawMtrWrhsPlanVO
	 * @return
	 * @throws Exception
	 */
	public RawMtrWrhsPlanVO selectRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception;

	/**
	 * 원물입고계획 목록 조회
	 * @param rawMtrWrhsPlanVO
	 * @return
	 * @throws Exception
	 */
	public List<RawMtrWrhsPlanVO> selectRawMtrWrhsPlanList(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception;

	/**
	 * 원물입고계획 등록
	 * @param rawMtrWrhsPlanVO
	 * @return
	 * @throws Exception
	 */
	public int insertRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception;

	/**
	 * 원물입고계획 변경
	 * @param rawMtrWrhsPlanVO
	 * @return
	 * @throws Exception
	 */
	public int updateRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception;

	/**
	 * 원물입고계획 삭제
	 * @param rawMtrWrhsPlanVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception;
}
