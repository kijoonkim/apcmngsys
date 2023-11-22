package com.at.apcss.am.clcln.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.clcln.vo.ClclnUntprcVO;

/**
 * 정산단가 Mapper 인터페이스
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
public interface ClclnUntprcMapper {
	
	/**
	 * 정산단가 단건 조회
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public ClclnUntprcVO selectClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception;
	
	/**
	 * 정산단가 목록 조회
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public List<ClclnUntprcVO> selectClclnUntprcList(ClclnUntprcVO clclnUntprcVO) throws Exception;
	
	/**
	 * 정산단가 등록
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public int insertClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception;
	
	/**
	 * 정산단가 수정
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public int updateClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception;
	
	/**
	 * 정산단가 삭제
	 * @param clclnUntprcVO
	 * @return
	 * @throws Exception
	 */
	public int deleteClclnUntprc(ClclnUntprcVO clclnUntprcVO) throws Exception;
}
