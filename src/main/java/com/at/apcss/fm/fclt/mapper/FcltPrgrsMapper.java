package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltAllRawDataVO;
import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;

/**
 * 진척도 Mapper 인터페이스
 * @author ljw
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23  ljw        최초 생성
 * </pre>
 */
@Mapper
public interface FcltPrgrsMapper {


	/**
	 * 진척도를 조회한다.
	 * @param fcltInfoVO
	 * @return FcltPrgrsVO
	 */
	public FcltPrgrsVO selectPrgrs(FcltPrgrsVO fcltPrgrsVO);

	/**
	 * 진척도 목록을 조회한다.
	 * @param fcltInfoVO
	 * @return List<FcltPrgrsVO>
	 */
	public List<FcltPrgrsVO> selectPrgrsList(FcltPrgrsVO fcltPrgrsVO);


	/**
	 * 진척도를 업데이트 한다.
	 * @param fcltPrgrsVO
	 * @return int
	 */
	public int insertFcltPrgrs(FcltPrgrsVO fcltPrgrsVO);

	/**
	 * 최종제출 여부를 업데이트 한다.
	 * @param fcltPrgrsVO
	 * @return int
	 */
	public int updatePrgrsLast(FcltPrgrsVO fcltPrgrsVO);

	/**
	 * 승인 여부를 업데이트 한다.
	 * @param fcltPrgrsVO
	 * @return int
	 */
	public int updateAprv(FcltPrgrsVO fcltPrgrsVO);

	/**
	 * 진척도 로우데이터를 조회한다.
	 * @param fcltInfoVO
	 * @return List<FcltPrgrsVO>
	 */
	public List<FcltPrgrsVO> selectPrgrsRawData(FcltPrgrsVO fcltPrgrsVO);

	/**
	 * 전체 로우데이터를 조회한다.
	 * @param FcltAllRawDataVO
	 * @return List<FcltAllRawDataVO>
	 */
	public List<FcltAllRawDataVO> selectAllRawData(FcltAllRawDataVO fcltAllRawDataVO);

}
