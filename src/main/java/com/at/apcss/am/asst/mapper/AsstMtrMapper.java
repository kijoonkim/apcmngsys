package  com.at.apcss.am.asst.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.am.bbs.vo.apcBbsCmntVO;
import com.at.apcss.am.bbs.vo.apcBbsFileVO;
import com.at.apcss.am.bbs.vo.apcBbsVO;

/**
 * 게시판 Mapper 인터페이스
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
public interface AsstMtrMapper {


	/**
	 * 부자재 기준정보를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<AsstMtrVO> selectAsstMtrCrtrInfoList(AsstMtrVO asstMtrvo);

	/**
	 * 부자재 기준정보상세를 조회한다.
	 * @param totMngVO
	 * @return
	 */
	public List<AsstMtrVO> selectAsstMtrCrtrInfoDtlList(AsstMtrVO asstMtrvo);

	/**
	 * 부자재 기준정보 등록.
	 * @param asstMtrvo
	 * @return
	 */
	public int insertAsstMtrCrtrInfo(AsstMtrVO asstMtrvo);

	/**
	 * 부자재 기준정보 수정.
	 * @param asstMtrvo
	 * @return
	 */
	public int updateAsstMtrCrtrInfo(AsstMtrVO asstMtrvo);

	/**
	 * 부자재 기준상세정보 등록.
	 * @param asstMtrvo
	 * @return
	 */
	public int insertAsstMtrCrtrDtlInfo(AsstMtrVO asstMtrvo);

	/**
	 * 부자재 기준상세정보 수정.
	 * @param asstMtrvo
	 * @return
	 */
	public int updateAsstMtrCrtrDtlInfo(AsstMtrVO asstMtrvo);


}
