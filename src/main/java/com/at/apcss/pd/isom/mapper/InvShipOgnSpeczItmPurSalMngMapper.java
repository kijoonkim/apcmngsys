package com.at.apcss.pd.isom.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.pd.isom.vo.InvShipOgnSpeczItmPurSalMngVO;
import com.at.apcss.pd.isom.vo.ItemStbltYnVO;

/**
 * 게시판 Mapper 인터페이스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21          최초 생성
 * </pre>
 */
@Mapper
public interface InvShipOgnSpeczItmPurSalMngMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public InvShipOgnSpeczItmPurSalMngVO selectInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	public int insertInvShipOgnSpeczItmPurSalMng(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	public List<ItemStbltYnVO> selectItemStbltYnList(ItemStbltYnVO ItemStbltYnVo);

	public int updateItemStbltYn(ItemStbltYnVO ItemStbltYnVo);

	public void updateItemStbltYnInit(ItemStbltYnVO ItemStbltYnVo);

	public List<InvShipOgnSpeczItmPurSalMngVO> selectRawDataList(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);

	//20241212 개발서버 테스트 화면용
	public List<InvShipOgnSpeczItmPurSalMngVO> selectInvShipOgnSpeczItmPurSalMngListNew(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);
	//20241212 개발서버 테스트 화면용
	public int insertInvShipOgnSpeczItmPurSalMngNew(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);
	//20241230 저장전 기존 자료 삭제 처리
	public int updateDelYn(InvShipOgnSpeczItmPurSalMngVO InvShipOgnSpeczItmPurSalMngVO);
}
