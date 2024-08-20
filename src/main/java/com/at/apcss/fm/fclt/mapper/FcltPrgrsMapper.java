package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnInfoVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;

/**
 * 진척도 Mapper 인터페이스
 * @author 임준완
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23  임준완        최초 생성
 * </pre>
 */
@Mapper
public interface FcltPrgrsMapper {


	/**
	 * 진척도를 조회한다.
	 * @param fcltInfoVO
	 * @return
	 */
	public FcltPrgrsVO selectPrgrs(FcltPrgrsVO fcltPrgrsVO);

	/**
	 * 진척도 목록을 조회한다.
	 * @param fcltInfoVO
	 * @return
	 */
	public List<FcltPrgrsVO> selectPrgrsList(FcltPrgrsVO fcltPrgrsVO);


	/**
	 * 진척도를 업데이트 한다.
	 * @param fcltPrgrsVO
	 * @return
	 */
	public int insertFcltPrgrs(FcltPrgrsVO fcltPrgrsVO);
}
