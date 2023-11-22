package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltOgnzPrcsPrfmncVO;

/**
 * 유통조직처리실적 Mapper 인터페이스
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
public interface FcltOgnzPrcsPrfmncMapper {


	/**
	 * 유통조직처리실적정보를 조회한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 */
	public FcltOgnzPrcsPrfmncVO selectFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO);

	/**
	 * 유통조직처리실적 목록을 조회한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 */
	public List<FcltOgnzPrcsPrfmncVO> selectFcltOgnzPrcsPrfmncList(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO);

	/**
	 * 유통조직처리실적정보를 등록한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 */
	public int insertFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO);

	/**
	 * 유통조직처리실적정보를 변경한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 */
	public int updateFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO);

	/**
	 * 유통조직처리실적정보를 삭제한다.
	 * @param fcltOgnzPrcsPrfmncVO
	 * @return
	 */
	public int deleteFcltOgnzPrcsPrfmnc(FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO);
}
