package com.at.apcss.am.clcln.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.clcln.vo.ClclnNowInvntrVO;
import com.at.apcss.am.clcln.vo.ClclnWkrptVO;

/**
 * 주간입고출고 Mapper 인터페이스
 * @author 김호
 * @since 2024.11.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.12  김호        최초 생성
 * </pre>
 */
@Mapper
public interface ClclnWkrptMapper {

	/**
	 * 주간 입고출고 목록 조회
	 * @param ClclnWkrptVO
	 * @return List<ClclnWkrptVO>
	 * @throws Exception
	 */
	public List<ClclnWkrptVO> selectWkrptList(ClclnWkrptVO clclnWkrptVO) throws Exception;

	/**
	 * 전재고조회
	 * @param ClclnWkrptVO
	 * @return List<ClclnWkrptVO>
	 * @throws Exception
	 */
	public List<ClclnWkrptVO> selectWkrptLastQnttList(ClclnWkrptVO clclnWkrptVO) throws Exception;

	public int insertClclnNowInvntr(ClclnNowInvntrVO clclnNowInvntrVO) throws Exception;
	public int updateClclnNowInvntr(ClclnNowInvntrVO clclnNowInvntrVO) throws Exception;

	public List<ClclnNowInvntrVO> selectClclnNowInvntrList(ClclnNowInvntrVO clclnNowInvntrVO) throws Exception;



}
