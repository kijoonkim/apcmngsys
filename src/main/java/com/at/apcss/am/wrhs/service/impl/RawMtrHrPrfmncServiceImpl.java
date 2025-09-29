package com.at.apcss.am.wrhs.service.impl;


import com.at.apcss.am.wrhs.mapper.RawMtrHrPrfmncMapper;
import com.at.apcss.am.wrhs.mapper.RawMtrWrhsIgiMapper;
import com.at.apcss.am.wrhs.service.RawMtrHrPrfmncService;
import com.at.apcss.am.wrhs.service.RawMtrWrhsIgiService;
import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncComVO;
import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrHrPrfmncServiceImpl.java
 * @Description : 원물입고시간실적 관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2025.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.21  김호        최초 생성
 * </pre>
 */
@Service("rawMtrHrPrfmncService")
public class RawMtrHrPrfmncServiceImpl extends BaseServiceImpl implements RawMtrHrPrfmncService {

	@Autowired
	private RawMtrHrPrfmncMapper rawMtrHrPrfmncMapper;


	@Override
	public List<RawMtrHrPrfmncDtlVO> selectRawMtrHrPrfmncList(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception {
		return rawMtrHrPrfmncMapper.selectRawMtrHrPrfmncList(rawMtrHrPrfmncDtlVO);
	}

	@Override
	public List<RawMtrHrPrfmncDtlVO> selectRawMtrHrPrfmncTot(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception {
		return rawMtrHrPrfmncMapper.selectRawMtrHrPrfmncTot(rawMtrHrPrfmncDtlVO);
	}

	@Override
	public HashMap<String, Object> multiSaveRawMtrHrPrfmncList(List<RawMtrHrPrfmncComVO> rawMtrHrPrfmncComList) throws Exception {
		List<RawMtrHrPrfmncComVO> insertList = new ArrayList<>();
		List<RawMtrHrPrfmncComVO> updateList = new ArrayList<>();

		/**
		 * 원물입고시간실적공통에 상세리스트를 담아서 처리를 한다.
		 * 조회에서부터 해당 Row 가 등록 인지 변경인지 표시가 되고 있다.
		 * 상세 같은 경우 DTL_CD 가 없기 때문에 MERGE 문으로 처리를 한다. UPDATE 인 경우 한해서
		 * 등록 시에는 MERGE 없이 INSERT 처리로 한다.
		 * 삭제는 없고 0으로 변경처리 로 대체 한다.
		 * */
		for (RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO : rawMtrHrPrfmncComList) {

			if (ComConstants.ROW_STS_INSERT.equals(rawMtrHrPrfmncComVO.getRowSts())) {
				insertList.add(rawMtrHrPrfmncComVO);
			}

			if (ComConstants.ROW_STS_UPDATE.equals(rawMtrHrPrfmncComVO.getRowSts())) {
				updateList.add(rawMtrHrPrfmncComVO);
			}

		}

		/**
		 * 불필요한 로직을 안태우기 위한 SIZE 체크부터 시행한다.
		 * */
		if (insertList.size() > 0) {

			for (RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO : insertList) {

				if (0 == insertRawMtrHrPrfmncCom(rawMtrHrPrfmncComVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

				List<RawMtrHrPrfmncDtlVO> rawMtrHrPrfmncDtlList = rawMtrHrPrfmncComVO.getRawMtrHrPrfmncDtlList();

				for (RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO : rawMtrHrPrfmncDtlList) {
					if (0 == insertRawMtrHrPrfmncDtl(rawMtrHrPrfmncDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

			}

		}

		/**
		 * 불필요한 로직을 안태우기 위한 SIZE 체크부터 시행한다.
		 * */
		if (updateList.size() > 0) {
			for (RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO : updateList) {

				if (0 == updateRawMtrHrPrfmncCom(rawMtrHrPrfmncComVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

				List<RawMtrHrPrfmncDtlVO> rawMtrHrPrfmncDtlList = rawMtrHrPrfmncComVO.getRawMtrHrPrfmncDtlList();

				for (RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO : rawMtrHrPrfmncDtlList) {
					if (0 == updateRawMtrHrPrfmncDtl(rawMtrHrPrfmncDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}

			}
		}

		return null;
	}

	@Override
	public int insertRawMtrHrPrfmncCom(RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO) throws Exception {
		return rawMtrHrPrfmncMapper.insertRawMtrHrPrfmncCom(rawMtrHrPrfmncComVO);
	}

	@Override
	public int updateRawMtrHrPrfmncCom(RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO) throws Exception {
		return rawMtrHrPrfmncMapper.updateRawMtrHrPrfmncCom(rawMtrHrPrfmncComVO);
	}

	@Override
	public int deleteRawMtrHrPrfmncCom(RawMtrHrPrfmncComVO rawMtrHrPrfmncComVO) throws Exception {
		return rawMtrHrPrfmncMapper.deleteRawMtrHrPrfmncCom(rawMtrHrPrfmncComVO);
	}

	@Override
	public int insertRawMtrHrPrfmncDtl(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception {

		return rawMtrHrPrfmncMapper.insertRawMtrHrPrfmncDtl(rawMtrHrPrfmncDtlVO);
	}

	@Override
	public int updateRawMtrHrPrfmncDtl(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception {
		return rawMtrHrPrfmncMapper.updateRawMtrHrPrfmncDtl(rawMtrHrPrfmncDtlVO);
	}

	@Override
	public HashMap<String, Object> deleteRawMtrHrPrfmncDtl(RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO) throws Exception {
		rawMtrHrPrfmncMapper.deleteRawMtrHrPrfmncDtl(rawMtrHrPrfmncDtlVO);
		return null;
	}


}
