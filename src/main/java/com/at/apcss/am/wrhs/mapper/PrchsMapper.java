package com.at.apcss.am.wrhs.mapper;

import com.at.apcss.am.wrhs.vo.*;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 영농관리 Mapper 인터페이스
 * @author 김  호
 * @since 2025.06.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.06.23  김  호        최초 생성
 * </pre>
 */
@Mapper
public interface PrchsMapper {

	/**
	 * 수매집계 : 담당자별 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	public List<FrmhsExpctWrhsVO> selectPrchsPicTotList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 수매집계 : 담당자 지역별 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	public List<FrmhsExpctWrhsVO> selectPrchsPicCtpvTotList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

	/**
	 * 수매집계 : 지역별 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	public List<FrmhsExpctWrhsVO> selectPrchsCtpvTotList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception;

}
