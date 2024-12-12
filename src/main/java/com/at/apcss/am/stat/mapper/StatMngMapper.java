package  com.at.apcss.am.stat.mapper;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.stat.vo.StatMngVO;


/**
 * 통계 Mapper 인터페이스
 * @author 박승진
 * @since 2024.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.11  박승진        최초 생성
 * </pre>
 */
@Mapper
public interface StatMngMapper {


	/**
	 * 통계 기준정보를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<StatMngVO> selectStatMngInfoList(StatMngVO StatMngVO);

	/**
	 * 통계 기준정보상세를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<StatMngVO> selectStatMngInfoDtlList(StatMngVO StatMngVO);

	/**
	 * 통계 기준정보 등록.
	 * @param StatMngVO
	 * @return
	 */
	public int insertStatMngInfo(StatMngVO StatMngVO);

	/**
	 * 통계 기준정보 수정.
	 * @param StatMngVO
	 * @return
	 */
	public int updateStatMngInfo(StatMngVO StatMngVO);

	/**
	 * 통계 기준상세정보 등록.
	 * @param StatMngVO
	 * @return
	 */
	public int insertStatMngDtlInfo(StatMngVO StatMngVO);

	/**
	 * 통계 기준상세정보 수정.
	 * @param StatMngVO
	 * @return
	 */
	public int updateStatMngDtlInfo(StatMngVO StatMngVO);

	/**
	 * 통계 기준정보 삭제.
	 * @param StatMngVO
	 * @return
	 */
	public int deleteStatMngInfo(StatMngVO StatMngVO);

	/**
	 * 통계 기준상세정보 삭제.
	 * @param StatMngVO
	 * @return
	 */
	public int deleteStatMngDtlInfo(StatMngVO StatMngVO);

	/**
	 * 기간별 입고통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdWrhsStatInfo(HashMap<String,Object> StatMngVO);

	/**
	 * 기간별 투입통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdInptPrfmncStatInfo(HashMap<String,Object> StatMngVO);

	/**
	 * 기간별 생산통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdPrdctnPrfmncStatInfo(HashMap<String,Object> StatMngVO);

	/**
	 * 기간별 출하통계 조회
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPrdSpmtPrfmncStatInfo(HashMap<String,Object> StatMngVO);

}
