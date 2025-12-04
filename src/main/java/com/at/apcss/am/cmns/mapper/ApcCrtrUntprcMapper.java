package com.apcmngsys.apcss.am.cmns.mapper;

import com.apcmngsys.apcss.am.cmns.vo.ApcCrtrUntprcVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * APC기준단가 Mapper 인터페이스
 * @author 김호
 * @since 2025.11.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.11.07  김호        최초 생성
 * </pre>
 */
@Mapper
public interface ApcCrtrUntprcMapper {

	/**
	 * APC기준단가 목록 조회
	 * @param apcCrtrUntprcVO
	 * @return List<ApcCrtrUntprcVO>
	 * @throws Exception
	 */
	public List<ApcCrtrUntprcVO> selectApcCrtrUntprcList (ApcCrtrUntprcVO apcCrtrUntprcVO) throws  Exception;

	/**
	 * APC기준단가 저장
	 * @param apcCrtrUntprcVO
	 * @return Integer
	 * @throws Exception
	 */
	public int insertApcCrtrUntprc (ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception;

	/**
	 * APC기준단가 변경
	 * @param apcCrtrUntprcVO
	 * @return Integer
	 * @throws Exception
	 */
	public int updateApcCrtrUntprc (ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception;

	/**
	 * APC기준단가 삭제
	 * @param apcCrtrUntprcVO
	 * @return Integer
	 * @throws Exception
	 */
	public int deleteApcCrtrUntprc (ApcCrtrUntprcVO apcCrtrUntprcVO) throws Exception;
}
