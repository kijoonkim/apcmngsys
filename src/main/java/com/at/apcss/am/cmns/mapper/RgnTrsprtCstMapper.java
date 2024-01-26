package com.at.apcss.am.cmns.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;

/**
 * 지역별운임비정보 Mapper 인터페이스
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
public interface RgnTrsprtCstMapper {

	/**
	 * 지역별 운임비 단건 조회
	 * @param rgnTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public RgnTrsprtCstVO selectRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception;

	/**
	 * 지역별 운임비 목록 조회
	 * @param rgnTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public List<RgnTrsprtCstVO> selectRgnTrsprtCstList(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception;

	/**
	 * 지역별 운임비 등록
	 * @param rgnTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public int insertRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception;

	/**
	 * 지역별 운임비 변경
	 * @param rgnTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public int updateRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception;

	/**
	 * 지역별 운임비 삭제
	 * @param rgnTrsprtCstVO
	 * @return
	 * @throws Exception
	 */
	public int deleteRgnTrsprtCst(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception;

	/**
	 * 원물운임비용 삭제 가능 여부
	 * @param RgnTrsprtCstVO
	 * @return List<RgnTrsprtCstVO>
	 * @throws Exception
	 */
	public List<RgnTrsprtCstVO> rgnTrsprtCstDelible(RgnTrsprtCstVO rgnTrsprtCstVO) throws Exception;
}
