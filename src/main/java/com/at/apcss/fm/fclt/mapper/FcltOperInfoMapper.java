package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltApcVO;
import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;

/**
 * 운영자개요 Mapper 인터페이스
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
public interface FcltOperInfoMapper {


	/**
	 * 운영자개요정보를 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public FcltOperInfoVO selectFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요 목록을 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public List<FcltOperInfoVO> selectFcltOperInfoList(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요정보를 등록한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int insertFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요정보를 변경한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int updateFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요정보를 삭제한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int deleteFcltOperInfo(FcltOperInfoVO fcltOperInfoVO);

	/**
	 * 운영자개요 품목목록을 조회한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public List<FcltItemVO> selectFcltOperInfoItemList(FcltItemVO fcltItemVO);

	/**
	 * 운영자개요 품목정보를 등록한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int insertFcltOperInfoItem(FcltItemVO fcltItemVO);

	/**
	 * 운영자개요 품목정보를 삭제한다.
	 * @param fcltOperInfoVO
	 * @return
	 */
	public int deleteItem (FcltItemVO fcltItemVO);

	/**
	 * APC 목록을 조회한다.
	 * @param fcltApcVO
	 * @return
	 */
	public List<FcltApcVO> selectApcList(FcltApcVO fcltApcVO);

	/**
	 * 로우데이터를 조회한다.
	 * @param fcltApcVO
	 * @return
	 */
	public List<FcltApcVO> selectFcltOperInfoRawDataList(FcltApcVO fcltApcVO);

	/**
	 * 선택가능한 APC 목록을 조회한다.
	 * @param fcltApcVO
	 * @return
	 */
	public List<FcltApcVO> selectUserApcList(FcltApcVO fcltApcVO);

	/**
	 * 유저정보를 조회한다.
	 * @param FcltOperInfoVO
	 * @return
	 */
	public FcltOperInfoVO selectUserInfo(FcltOperInfoVO fcltApcVO);

}































