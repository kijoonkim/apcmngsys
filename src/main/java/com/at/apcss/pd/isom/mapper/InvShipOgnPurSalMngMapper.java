package com.at.apcss.pd.isom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.isom.vo.InvShipOgnPurSalMngVO;

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
public interface InvShipOgnPurSalMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public InvShipOgnPurSalMngVO selectInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public List<InvShipOgnPurSalMngVO> selectInvShipOgnPurSalMngList(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public int insertInvShipOgnPurSalMng01(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public int insertInvShipOgnPurSalMng02(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public int insertInvShipOgnPurSalMng03(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public int updateInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO);

	public int deleteInvShipOgnPurSalMng(InvShipOgnPurSalMngVO InvShipOgnPurSalMngVO) throws Exception;
}
