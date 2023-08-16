package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.FcltSortMchnOperInfoVO;

/**
 * 선별기운영기간 Mapper 인터페이스
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
public interface FcltSortMchnOperInfoMapper {


	/**
	 * 선별기운영기간정보를 조회한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 */
	public FcltSortMchnOperInfoVO selectFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO);

	/**
	 * 선별기운영기간 목록을 조회한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 */
	public List<FcltSortMchnOperInfoVO> selectFcltSortMchnOperInfoList(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO);

	/**
	 * 선별기운영기간정보를 등록한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 */
	public int insertFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO);

	/**
	 * 선별기운영기간정보를 변경한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 */
	public int updateFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO);

	/**
	 * 선별기운영기간정보를 삭제한다.
	 * @param fcltSortMchnOperInfoVO
	 * @return
	 */
	public int deleteFcltSortMchnOperInfo(FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO);
}
