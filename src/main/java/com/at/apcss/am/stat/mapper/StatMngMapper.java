package  com.at.apcss.am.stat.mapper;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.am.stat.vo.StatCrtrVO;
import com.at.apcss.am.tot.vo.TotCrtrVO;
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
	 * 통계기준상세 (사용) 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<StatCrtrVO> selectStatCrtrDtlInUseList(StatCrtrVO statCrtrVO) throws Exception;

	public StatCrtrVO selectCrtr(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준정보 목록 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<StatCrtrVO> selectCrtrList(StatCrtrVO statCrtrVO) throws Exception;

	public StatCrtrVO selectCrtrDtl(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준상세 목록 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<StatCrtrVO> selectCrtrDtlList(StatCrtrVO statCrtrVO) throws Exception;

	public int insertCrtr(StatCrtrVO statCrtrVO) throws Exception;

	public int updateCrtr(StatCrtrVO statCrtrVO) throws Exception;

	public int deleteCrtr(StatCrtrVO statCrtrVO) throws Exception;

	public int insertCrtrDtl(StatCrtrVO statCrtrVO) throws Exception;

	public int updateCrtrDtl(StatCrtrVO statCrtrVO) throws Exception;

	public int deleteCrtrDtl(StatCrtrVO statCrtrVO) throws Exception;

    List<HashMap<String, Object>> selectItemWrhs(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectCnptWrhs(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectWrhs(HashMap<String, Object> param) throws Exception;
	/**
	 * 기준정보 목록 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdSpmtInfo(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준정보 목록 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdSpmtInfoDtl(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준정보 목록 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdPrdctnPrfmncInfo(StatCrtrVO statCrtrVO) throws Exception;

	/**
	 * 기준정보 목록 조회
	 *
	 * @param statCrtrVO
	 * @return
	 * @throws Exception
	 */
	public List<HashMap<String,Object>> selectPrdPrdctnPrfmncInfoDtl(StatCrtrVO statCrtrVO) throws Exception;

}