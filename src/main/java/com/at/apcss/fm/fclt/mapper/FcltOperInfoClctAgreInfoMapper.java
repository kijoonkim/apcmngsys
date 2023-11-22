package  com.at.apcss.fm.fclt.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;

/**
 * 개인정보 이용동의 Mapper 인터페이스
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
public interface FcltOperInfoClctAgreInfoMapper {


	/**
	 * 개인정보이용동의정보를 조회한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 */
	public FcltOperInfoClctAgreInfoVO selectFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO);

	/**
	 * 개인정보이용동의 목록을 조회한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 */
	public List<FcltOperInfoClctAgreInfoVO> selectFcltOperInfoClctAgreInfoList(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO);

	/**
	 * 개인정보이용동의정보를 등록한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 */
	public int insertFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO);

	/**
	 * 개인정보이용동의정보를 변경한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 */
	public int updateFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO);

	/**
	 * 개인정보이용동의정보를 삭제한다.
	 * @param fcltOperInfoClctAgreInfoVO
	 * @return
	 */
	public int deleteFcltOperInfoClctAgreInfo(FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO);
}
