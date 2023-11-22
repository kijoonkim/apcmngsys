package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltGdsMchnInfoVO;

/**
 * 상품화설비현황 Mapper 인터페이스
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
public interface FcltGdsMchnInfoMapper {


	/**
	 * 상품화설비현황을 조회한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 */
	public FcltGdsMchnInfoVO selectFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO);

	/**
	 * 상품화설비현황 목록을 조회한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 */
	public List<FcltGdsMchnInfoVO> selectFcltGdsMchnInfoList(FcltGdsMchnInfoVO fcltGdsMchnInfoVO);

	/**
	 * 상품화설비현황을 등록한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 */
	public int insertFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO);

	/**
	 * 상품화설비현황을 변경한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 */
	public int updateFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO);

	/**
	 * 상품화설비현황을 삭제한다.
	 * @param fcltGdsMchnInfoVO
	 * @return
	 */
	public int deleteFcltGdsMchnInfo(FcltGdsMchnInfoVO fcltGdsMchnInfoVO);
}
