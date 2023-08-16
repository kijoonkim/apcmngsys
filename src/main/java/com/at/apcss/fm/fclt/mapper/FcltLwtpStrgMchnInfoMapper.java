package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnInfoVO;

/**
 * 저온저장고 Mapper 인터페이스
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
public interface FcltLwtpStrgMchnInfoMapper {


	/**
	 * 저온저장고정보를 조회한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 */
	public FcltLwtpStrgMchnInfoVO selectFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO);

	/**
	 * 저온저장고 목록을 조회한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 */
	public List<FcltLwtpStrgMchnInfoVO> selectFcltLwtpStrgMchnInfoList(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO);

	/**
	 * 저온저장고정보를 등록한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 */
	public int insertFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO);

	/**
	 * 저온저장고정보를 변경한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 */
	public int updateFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO);

	/**
	 * 저온저장고정보를 삭제한다.
	 * @param fcltLwtpStrgMchnInfoVO
	 * @return
	 */
	public int deleteFcltLwtpStrgMchnInfo(FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO);
}
