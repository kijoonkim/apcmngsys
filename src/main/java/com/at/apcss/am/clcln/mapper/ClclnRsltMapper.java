package com.at.apcss.am.clcln.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.clcln.vo.ClclnRsltDtlVO;
import com.at.apcss.am.clcln.vo.ClclnRsltVO;

/**
 * 정산실적 Mapper 인터페이스
 * @author 신정철
 * @since 2024.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface ClclnRsltMapper {
	
	/**
	 * 정산실적 목록 조회
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnRsltVO> selectClclnRsltList(ClclnRsltVO clclnRsltVO) throws Exception;
	
	/**
	 * 정산실적 일련번호 조회
	 * @param clclnRsltVO
	 * @return
	 * @throws Exception
	 */
	public ClclnRsltDtlVO selectClclnRsltSn(ClclnRsltDtlVO clclnRsltDtlVO) throws Exception;
	
	
	/**
	 * 정산실적 등록
	 * @param clclnRsltDtlVO
	 * @return
	 * @throws Exception
	 */
	public int insertClclnRslt(ClclnRsltDtlVO clclnRsltDtlVO) throws Exception;
	
	/**
	 * 정산실적변경
	 * @param clclnRsltDtlVO
	 * @return
	 * @throws Exception
	 */
	public int updateClclnRsltElmt(ClclnRsltDtlVO clclnRsltDtlVO) throws Exception;
	
	/**
	 * 정산실적 생성
	 * @param clclnRsltVO
	 * @return
	 * @throws Exception
	 */
	public int insertSpClclnRsltReg(ClclnRsltDtlVO clclnRsltDtlVO) throws Exception;
	
}
