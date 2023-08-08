package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.fm.fclt.vo.FcltOperHfInfoVO;

/**
 * 시설설치현황 Mapper 인터페이스
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
public interface FcltOperHfInfoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 */
	public FcltOperHfInfoVO selectFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO);

	/**
	 * 메시지 목록을 조회한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 */
	public List<FcltOperHfInfoVO> selectFcltOperHfInfoList(FcltOperHfInfoVO fcltOperHfInfoVO);

	/**
	 * 메시지정보를 등록한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 */
	public int insertFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO);

	/**
	 * 메시지정보를 변경한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 */
	public int updateFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO);

	/**
	 * 메시지정보를 삭제한다.
	 * @param fcltOperHfInfoVO
	 * @return
	 */
	public int deleteFcltOperHfInfo(FcltOperHfInfoVO fcltOperHfInfoVO);
}
