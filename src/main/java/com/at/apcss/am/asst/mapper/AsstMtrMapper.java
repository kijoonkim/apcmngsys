package  com.at.apcss.am.asst.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.am.asst.vo.AsstMtrVO;
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


	/**
	 * 부자재 기준상세정보 삭제.
	 * @param asstMtrvo
	 * @return
	 */
	public int deleteAsstMtrCrtrInfo(AsstMtrVO asstMtrvo);


	/**
	 * BOM 마스터정보를 조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public List<AsstMtrVO> selectBomMstrList(AsstMtrVO bomVO);

	/**
	 * BOM 상세정보를 조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public List<AsstMtrVO> selectBomDtlList(AsstMtrVO bomVO);


	/**
	 * BOM 상세정보 등록
	 * @param AsstMtrVO
	 * @return
	 */
	public int insertBomDtlInfo(AsstMtrVO asstMtrvo);

	/**
	 * BOM 상세정보 수정
	 * @param AsstMtrVO
	 * @return
	 */
	public int updateBomDtlInfo(AsstMtrVO asstMtrvo);

	/**
	 * BOM 마스터정보 등록
	 * @param AsstMtrVO
	 * @return
	 */
	public int insertBomMstrInfo(AsstMtrVO asstMtrvo);

	/**
	 * BOM 마스터정보 수정
	 * @param AsstMtrVO
	 * @return
	 */
	public int updateBomMstrInfo(AsstMtrVO asstMtrvo);

	/**
	 * BOM기준정보삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomCrtrInfo(AsstMtrVO bomVO);

	/**
	 * BOM기준정보상세삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomDtlList(AsstMtrVO bomVO);

	/**
	 * BOM재고정보 단건조회
	 * @param AsstMtrVO
	 * @return
	 */
	public AsstMtrVO selectBomInvntrInfo(AsstMtrVO bomVO);

	/**
	 * BOM입고정보 조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public List<AsstMtrVO> selectBomWrhsInfoList(AsstMtrVO bomVO);

	/**
	 * BOM입고정보 단건조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public AsstMtrVO selectBomWrhsInfo(AsstMtrVO bomVO);

	/**
	 * BOM입고등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomWrhsInfoList(AsstMtrVO bomVO);

	/**
	 * BOM입고수정
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateBomWrhsInfoList(AsstMtrVO bomVO);

	/**
	 * BOM입고삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomWrhsInfoList(AsstMtrVO bomVO);

	/**
	 * BOM출고삭제
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int deleteBomSpmtInfoList(AsstMtrVO bomVO);

	/**
	 * BOM재고정보 조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public List<AsstMtrVO> selectBomInvntrInfoList(AsstMtrVO bomVO);

	/**
	 * BOM출고정보 조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public List<AsstMtrVO> selectBomSpmtInfoList(AsstMtrVO bomVO);

	/**
	 * BOM출고등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomSpmtInfoList(AsstMtrVO bomVO);

	/**
	 * BOM출고수정
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateBomSpmtInfoList(AsstMtrVO bomVO);

	/**
	 * BOM입고정보 단건조회한다.
	 * @param AsstMtrVO
	 * @return
	 */
	public AsstMtrVO selectBomSpmtInfo(AsstMtrVO bomVO);

	/**
	 * BOM재고등록
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int insertBomInvntrInfoList(AsstMtrVO bomVO);

	/**
	 * BOM재고수정
	 * @param AsstMtrVO
	 * @return
	 * @throws Exception
	 */
	public int updateBomInvntrInfoList(AsstMtrVO bomVO);



}
