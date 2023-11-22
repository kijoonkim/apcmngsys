package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltDtaMngInfoVO;

/**
 * 스마트데이터화 Mapper 인터페이스
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
public interface FcltDtaMngInfoMapper {


	/**
	 * 스마트데이터화정보를 조회한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 */
	public FcltDtaMngInfoVO selectFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO);

	/**
	 * 스마트데이터화 목록을 조회한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 */
	public List<FcltDtaMngInfoVO> selectFcltDtaMngInfoList(FcltDtaMngInfoVO fcltDtaMngInfoVO);

	/**
	 * 스마트데이터화정보를 등록한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 */
	public int insertFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO);

	/**
	 * 스마트데이터화정보를 변경한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 */
	public int updateFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO);

	/**
	 * 스마트데이터화정보를 삭제한다.
	 * @param fcltDtaMngInfoVO
	 * @return
	 */
	public int deleteFcltDtaMngInfo(FcltDtaMngInfoVO fcltDtaMngInfoVO);
}
