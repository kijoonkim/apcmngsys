package com.at.apcss.pd.bsm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnUsrMngVO;

/**
 * 게시판 Mapper 인터페이스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Mapper
public interface PrdcrCrclOgnUsrMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public PrdcrCrclOgnUsrMngVO selectPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);

	public List<PrdcrCrclOgnUsrMngVO> selectPrdcrCrclOgnUsrMngList(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);

	public int insertPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);

	public int updatePrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);

	public int deleteUser(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception;

	public int deleteAuthUser(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO) throws Exception;

	/**
	 * 유저 메뉴 권한을 부여 한다
	 * @param PrdcrCrclOgnUsrMngVO
	 * @return
	 */
	public int insertComAuthrtUser(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);
	/**
	 * 회원정보 유저타입 업데이트
	 * @param PrdcrCrclOgnUsrMngVO
	 * @return
	 */
	public int updateMemberUserType(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);
	/**
	 * 산지유통정보 유저 타입 업데이트
	 * @param PrdcrCrclOgnUsrMngVO
	 * @return
	 */
	public int updateTbEvApoUserType(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);
	/**
	 * APC조직 정보 유저 타입 업데이트
	 * @param PrdcrCrclOgnUsrMngVO
	 * @return
	 */
	public int updateTbApcOgnzInfoUserType(PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO);
}
