package com.at.apcss.am.wrhs.service.impl;

import com.at.apcss.am.cmns.service.ComAtchflService;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.ComAtchflVO;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.wrhs.mapper.FrmerInfoMapper;
import com.at.apcss.am.wrhs.mapper.PrchsMapper;
import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.service.PrchsService;
import com.at.apcss.am.wrhs.service.PrdcrLandInfoService;
import com.at.apcss.am.wrhs.vo.*;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : PrchsServiceImpl.java
 * @Description : 수매집계 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("prchsService")
public class PrchsServiceImpl extends BaseServiceImpl implements PrchsService {

	@Resource(name="prchsMapper")
	private PrchsMapper prchsMapper;

	/**
	 * 수매집계 : 담당자별 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@Override
	public List<FrmhsExpctWrhsVO> selectPrchsPicTotList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		List<FrmhsExpctWrhsVO> resultList = prchsMapper.selectPrchsPicTotList(frmhsExpctWrhsVO);
		return resultList;
	}

	/**
	 * 수매집계 : 담당자 지역별 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@Override
	public List<FrmhsExpctWrhsVO> selectPrchsPicCtpvTotList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		List<FrmhsExpctWrhsVO> resultList = prchsMapper.selectPrchsPicCtpvTotList(frmhsExpctWrhsVO);
		return resultList;
	}

	/**
	 * 수매집계 : 지역별 조회
	 * @param frmhsExpctWrhsVO
	 * @return List<FrmhsExpctWrhsVO>
	 * @throws Exception
	 */
	@Override
	public List<FrmhsExpctWrhsVO> selectPrchsCtpvTotList(FrmhsExpctWrhsVO frmhsExpctWrhsVO) throws Exception {
		List<FrmhsExpctWrhsVO> resultList = prchsMapper.selectPrchsCtpvTotList(frmhsExpctWrhsVO);
		return resultList;
	}

}
