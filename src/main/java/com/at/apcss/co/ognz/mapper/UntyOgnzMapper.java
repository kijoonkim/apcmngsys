package com.at.apcss.co.ognz.mapper;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.co.ognz.vo.UntyOgnzVO;

/**
 * 공통메시지 Mapper 인터페이스
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
public interface UntyOgnzMapper {

	
	/**
	 * 신규통합조직ID 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public UntyOgnzVO selectNewUntyOgnzId(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public UntyOgnzVO selectUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public UntyOgnzVO selectOgnzApc(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectUntyOgnzList(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 조직 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectOgnzList(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 트리 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectUntyOgnzTreeList(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectUntyOgnzApcList(UntyOgnzVO untyOgnzVO) throws Exception;
	
	
	/**
	 * 통합조직 등록
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int insertUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 변경
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int updateUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	
	/**
	 * 통합조직 변경 (set delYn 'Y')
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int updateUntyOgnzForDelY(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 통합조직 삭제
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int deleteUntyOgnz(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC등록
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int insertOgnzApc(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC변경
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int updateOgnzApc(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC삭제
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int deleteOgnzApc(UntyOgnzVO untyOgnzVO) throws Exception;
	
	

	/**
	 * 관리APC 승인대상 목록 조회
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public List<UntyOgnzVO> selectApcAprvList(UntyOgnzVO untyOgnzVO) throws Exception;	
	
	/**
	 * 관리APC승인
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int insertApcAprv(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC승인
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int insertApcUserAprv(UntyOgnzVO untyOgnzVO) throws Exception;
	
	
	/**
	 * 관리APC등록
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcAprv(UntyOgnzVO untyOgnzVO) throws Exception;
	
	/**
	 * 관리APC등록
	 * @param untyOgnzVO
	 * @return
	 * @throws Exception
	 */
	public int deleteApcUserAprv(UntyOgnzVO untyOgnzVO) throws Exception;
	
	
}
