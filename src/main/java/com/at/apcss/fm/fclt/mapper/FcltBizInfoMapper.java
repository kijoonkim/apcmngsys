package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltBizInfoVO;

/**
 * 지원사업 Mapper 인터페이스
 * @author 임준완
 * @since 2024.07.30
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.30  임준완        최초 생성
 * </pre>
 */
@Mapper
public interface FcltBizInfoMapper {


	/**
	 * 지원사업정보를 조회한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public FcltBizInfoVO selectFcltBizInfo(FcltBizInfoVO fcltBizInfoVO);

	/**
	 * 지원사업 목록을 조회한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public List<FcltBizInfoVO> selectFcltBizInfoList(FcltBizInfoVO fcltBizInfoVO);

	/**
	 * 지원사업정보를 등록한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public int insertFcltBizInfo(FcltBizInfoVO fcltBizInfoVO);

	/**
	 * 지원사업정보를 변경한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public int updateFcltBizInfo(FcltBizInfoVO fcltBizInfoVO);

	/**
	 * 지원사업정보를 삭제한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public int deleteFcltBizInfo(FcltBizInfoVO fcltBizInfoVO);

	/**
	 * 지원사업 품목목록을 조회한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public List<FcltItemVO> selectFcltBizInfoItemList(FcltItemVO fcltItemVO);

	/**
	 * 지원사업 품목정보를 등록한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public int insertFcltBizInfoItem(FcltItemVO fcltItemVO);

	/**
	 * 지원사업 품목정보를 삭제한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public int deleteFcltBizInfoItem (FcltItemVO fcltItemVO);

	/**
	 * 지원사업 진척도를 변경 한다.
	 * @param fcltBizInfoVO
	 * @return
	 */
	public void insertFcltBizInfoPrgrs (FcltBizInfoVO fcltBizInfoVO);
}































