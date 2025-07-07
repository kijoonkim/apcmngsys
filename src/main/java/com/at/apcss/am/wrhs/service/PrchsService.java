package com.at.apcss.am.wrhs.service;

import com.at.apcss.am.wrhs.vo.*;

import java.util.HashMap;
import java.util.List;

/**
 * 수매집계 Service 인터페이스
 * @author 김  호
 * @since 2024.06.25
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
public interface PrchsService {
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
