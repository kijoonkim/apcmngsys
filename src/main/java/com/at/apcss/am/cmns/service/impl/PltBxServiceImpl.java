package com.at.apcss.am.cmns.service.impl;

import java.util.HashMap;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.PltBxMapper;
import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : PltBxServiceImpl.java
 * @Description : 팔레트/박스 정보관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("pltBxService")
public class PltBxServiceImpl extends BaseServiceImpl implements PltBxService {

	@Autowired
	private PltBxMapper pltBxMapper;

	@Override
	public PltBxVO selectPltBx(PltBxVO pltBxVO) throws Exception {

		PltBxVO resultVO = pltBxMapper.selectPltBx(pltBxVO);

		return resultVO;
	}

	@Override
	public List<PltBxVO> selectPltBxList(PltBxVO pltBxVO) throws Exception {

		List<PltBxVO> resultList = pltBxMapper.selectPltBxList(pltBxVO);

		return resultList;
	}

	@Override
	public int insertPltBx(PltBxVO pltBxVO) throws Exception {

		int insertedCnt = pltBxMapper.insertPltBx(pltBxVO);

		return insertedCnt;
	}

	@Override
	public int updatePltBx(PltBxVO pltBxVO) throws Exception {

		int updatedCnt = pltBxMapper.updatePltBx(pltBxVO);

		return updatedCnt;
	}

	@Override
	public int deletePltBx(PltBxVO pltBxVO) throws Exception {

		int deletedCnt = pltBxMapper.deletePltBx(pltBxVO);

		return deletedCnt;
	}

	@Override
	public HashMap<String, Object> insertPltBxSample(PltBxVO pltBxVO) throws Exception {

		PltBxVO paramVO = new PltBxVO();
		paramVO.setApcCd(ApcConstants.APC_CD_SYSTEM);
		paramVO.setDelYn(ComConstants.CON_NONE);

		List<PltBxVO> sampleList = selectPltBxList(paramVO);
		for ( PltBxVO sample : sampleList ) {
			PltBxVO vo = new PltBxVO();
			BeanUtils.copyProperties(pltBxVO, vo);
			BeanUtils.copyProperties(sample, vo,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);

			int insertedCnt = insertPltBx(vo);
			if (insertedCnt != 1) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap("E0003", "팔레트/박스 등록")));	// E0003	{0} 시 오류가 발생하였습니다.
			}
		}

		return null;
	}

}
