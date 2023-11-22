package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltAtmtcMchnInfoVO;

/**
 * 스마트자동화 Mapper 인터페이스
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
public interface FcltAtmtcMchnInfoMapper {


	/**
	 * 스마트자동화정보를 조회한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 */
	public FcltAtmtcMchnInfoVO selectFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO);

	/**
	 * 스마트자동화 목록을 조회한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 */
	public List<FcltAtmtcMchnInfoVO> selectFcltAtmtcMchnInfoList(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO);

	/**
	 * 스마트자동화정보를 등록한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 */
	public int insertFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO);

	/**
	 * 스마트자동화정보를 변경한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 */
	public int updateFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO);

	/**
	 * 스마트자동화정보를 삭제한다.
	 * @param fcltAtmtcMchnInfoVO
	 * @return
	 */
	public int deleteFcltAtmtcMchnInfo(FcltAtmtcMchnInfoVO fcltAtmtcMchnInfoVO);
}
