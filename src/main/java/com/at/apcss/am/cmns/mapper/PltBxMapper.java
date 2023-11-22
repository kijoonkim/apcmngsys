package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.PltBxVO;

/**
 * 팔레트/박스정보 Mapper 인터페이스
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
public interface PltBxMapper {

	/**
	 * 팔레트/박스 정보 단건 조회
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public PltBxVO selectPltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 목록 조회
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public List<PltBxVO> selectPltBxList(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 등록
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public int insertPltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 변경
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public int updatePltBx(PltBxVO pltBxVO) throws Exception;

	/**
	 * 팔레트/박스 정보 삭제
	 * @param pltBxVO
	 * @return
	 * @throws Exception
	 */
	public int deletePltBx(PltBxVO pltBxVO) throws Exception;
}
