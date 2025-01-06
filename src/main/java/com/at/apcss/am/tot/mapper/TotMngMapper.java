package  com.at.apcss.am.tot.mapper;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.tot.vo.TotCrtrVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.tot.vo.TotMngVO;


/**
 * 집계관리 Mapper 인터페이스
 * @author 신정철
 * @since 2024.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface TotMngMapper {



	public TotCrtrVO selectCrtr(TotCrtrVO totCrtrVO) throws Exception;

	/**
	 * 기준정보 목록 조회
	 * @param totCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<TotCrtrVO> selectCrtrList(TotCrtrVO totCrtrVO) throws Exception;

	public TotCrtrVO selectCrtrDtl(TotCrtrVO totCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 * @param totCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<TotCrtrVO> selectCrtrDtlList(TotCrtrVO totCrtrVO) throws Exception;

	public int insertCrtr(TotCrtrVO totCrtrVO) throws Exception;
	public int updateCrtr(TotCrtrVO totCrtrVO) throws Exception;
	public int deleteCrtr(TotCrtrVO totCrtrVO) throws Exception;

	public int insertCrtrDtl(TotCrtrVO totCrtrVO) throws Exception;
	public int updateCrtrDtl(TotCrtrVO totCrtrVO) throws Exception;
	public int deleteCrtrDtl(TotCrtrVO totCrtrVO) throws Exception;

	/**
	 * 부자재 기준정보를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<TotMngVO> selectTotMngInfoList(TotMngVO totMngVO);

	/**
	 * 부자재 기준정보상세를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<TotMngVO> selectTotMngInfoDtlList(TotMngVO totMngVO);

	/**
	 * 부자재 기준정보 등록.
	 * @param totMngVO
	 * @return
	 */
	public int insertTotMngInfo(TotMngVO totMngVO);

	/**
	 * 부자재 기준정보 수정.
	 * @param totMngVO
	 * @return
	 */
	public int updateTotMngInfo(TotMngVO totMngVO);

	/**
	 * 부자재 기준상세정보 등록.
	 * @param TotMngVO
	 * @return
	 */
	public int insertTotMngDtlInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준상세정보 수정.
	 * @param TotMngVO
	 * @return
	 */
	public int updateTotMngDtlInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준정보 삭제.
	 * @param TotMngVO
	 * @return
	 */
	public int deleteTotMngInfo(TotMngVO TotMngVO);

	/**
	 * 부자재 기준상세정보 삭제.
	 * @param TotMngVO
	 * @return
	 */
	public int deleteTotMngDtlInfo(TotMngVO TotMngVO);


	/**
	 * 집계조회 - 출하
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectSpmtPrfmncTotInfo(HashMap<String,Object> TotMngVO);

	/**
	 * 집계조회 - 상품
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectGdsInvntrTotInfo(HashMap<String,Object> TotMngVO);

	/**
	 * 집계조회 - 포장실적
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectPckgPrfmncTotInfo(HashMap<String,Object> TotMngVO);

	/**
	 * 집계조회 - 원물재고
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectRawMtrInvntrTotInfo(HashMap<String,Object> TotMngVO);

	/**
	 * 집계조회 - 원물입고실적
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectRawMtrWrhsTotInfo(HashMap<String,Object> TotMngVO);

	/**
	 * 집계조회 - 선별재고
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectSortInvntrTotInfo(HashMap<String,Object> TotMngVO);

	/**
	 * 집계조회 - 선별실적
	 * @param HashMap<String,Object>
	 * @return
	 */
	public List<HashMap<String,Object>> selectSortPrfmncTotInfo(HashMap<String,Object> TotMngVO);




}
