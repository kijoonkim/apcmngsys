package com.at.apcss.am.wrhs.service.impl;


import com.at.apcss.am.wrhs.mapper.RawMtrWrhsIgiMapper;
import com.at.apcss.am.wrhs.service.RawMtrWrhsIgiService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.springframework.beans.BeanUtils;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrWrhsIgiServiceImpl.java
 * @Description : 검수등록 관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
@Service("rawMtrWrhsIgiService")
public class RawMtrWrhsIgiServiceImpl extends BaseServiceImpl implements RawMtrWrhsIgiService {

	@Autowired
	private RawMtrWrhsIgiMapper rawMtrWrhsIgiMapper;

	@Override
	public List<RawMtrWrhsIgiVO> selectRawMtrWrhsIgiList(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.selectRawMtrWrhsIgiList(rawMtrWrhsIgiVO);
	}

	@Override
	public String selectGetIgiSeq(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.selectGetIgiSeq(rawMtrWrhsIgiVO);
	}

	@Override
	public int insertRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.insertRawMtrWrhsIgi(rawMtrWrhsIgiVO);
	}

	@Override
	public int updateRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.updateRawMtrWrhsIgi(rawMtrWrhsIgiVO);
	}

	@Override
	public HashMap<String, Object> deleteRawMtrWrhsIgi(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {

		if (0 == rawMtrWrhsIgiMapper.deleteRawMtrWrhsIgi(rawMtrWrhsIgiVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO = new RawMtrWrhsIgiDtlVO();
		BeanUtils.copyProperties(rawMtrWrhsIgiVO, rawMtrWrhsIgiDtlVO);

		if (0 == rawMtrWrhsIgiMapper.deleteRawMtrWrhsIgiDtl(rawMtrWrhsIgiDtlVO)) {
			throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
		}

		return null;
	}

	@Override
	public int insertRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception {
		return rawMtrWrhsIgiMapper.insertRawMtrWrhsIgiDtl(rawMtrWrhsIgiDtlVO);
	}

	@Override
	public int updateRawMtrWrhsIgiDtl(RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO) throws Exception {
		return rawMtrWrhsIgiMapper.updateRawMtrWrhsIgiDtl(rawMtrWrhsIgiDtlVO);
	}

	@Override
	public HashMap<String, Object> multiRawMtrWrhsIgiList(List<RawMtrWrhsIgiVO> RawMtrWrhsIgiList) throws Exception {

		List<RawMtrWrhsIgiVO> insertRawMtrWrhsIgiList = new ArrayList<>();
		List<RawMtrWrhsIgiVO> updateRawMtrWrhsIgiList = new ArrayList<>();

		for (RawMtrWrhsIgiVO rawMtrWrhsIgiVO : RawMtrWrhsIgiList) {

			String rowSts = rawMtrWrhsIgiVO.getRowSts();

			if (ComConstants.ROW_STS_INSERT.equals(rowSts)) {
				insertRawMtrWrhsIgiList.add(rawMtrWrhsIgiVO);
			}

			if (ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
				updateRawMtrWrhsIgiList.add(rawMtrWrhsIgiVO);
			}
		}

		if (insertRawMtrWrhsIgiList.size() > 0) {
			for (RawMtrWrhsIgiVO rawMtrWrhsIgiVO : insertRawMtrWrhsIgiList) {

				String igiSeq = selectGetIgiSeq(rawMtrWrhsIgiVO);

				rawMtrWrhsIgiVO.setIgiSeq(igiSeq);

				if (0 == insertRawMtrWrhsIgi(rawMtrWrhsIgiVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}

				List<RawMtrWrhsIgiDtlVO> rawMtrWrhsIgiDtlList = rawMtrWrhsIgiVO.getRawMtrWrhsIgiDtlList();
				String userId = rawMtrWrhsIgiVO.getSysFrstInptUserId();
				String prgrmId = rawMtrWrhsIgiVO.getSysFrstInptPrgrmId();
				for (RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO : rawMtrWrhsIgiDtlList) {
					rawMtrWrhsIgiDtlVO.setIgiSeq(igiSeq);
					rawMtrWrhsIgiDtlVO.setSysFrstInptUserId(userId);
					rawMtrWrhsIgiDtlVO.setSysLastChgUserId(userId);
					rawMtrWrhsIgiDtlVO.setSysFrstInptPrgrmId(prgrmId);
					rawMtrWrhsIgiDtlVO.setSysLastChgPrgrmId(prgrmId);

					if (0 == insertRawMtrWrhsIgiDtl(rawMtrWrhsIgiDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}

		if (updateRawMtrWrhsIgiList.size() > 0) {

			for (RawMtrWrhsIgiVO rawMtrWrhsIgiVO : updateRawMtrWrhsIgiList) {
				if (0 == updateRawMtrWrhsIgi(rawMtrWrhsIgiVO)) {
					throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
				}
				List<RawMtrWrhsIgiDtlVO> rawMtrWrhsIgiDtlList = rawMtrWrhsIgiVO.getRawMtrWrhsIgiDtlList();
				String userId = rawMtrWrhsIgiVO.getSysLastChgUserId();
				String prgrmId = rawMtrWrhsIgiVO.getSysLastChgPrgrmId();
				for (RawMtrWrhsIgiDtlVO rawMtrWrhsIgiDtlVO : rawMtrWrhsIgiDtlList) {

					rawMtrWrhsIgiDtlVO.setSysFrstInptUserId(userId);
					rawMtrWrhsIgiDtlVO.setSysLastChgUserId(userId);
					rawMtrWrhsIgiDtlVO.setSysFrstInptPrgrmId(prgrmId);
					rawMtrWrhsIgiDtlVO.setSysLastChgPrgrmId(prgrmId);
					if (0 == updateRawMtrWrhsIgiDtl(rawMtrWrhsIgiDtlVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}
		return null;
	}

	@Override
	public List<RawMtrWrhsIgiVO> selectRawMtrWrhsIgiTot(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.selectRawMtrWrhsIgiTot(rawMtrWrhsIgiVO);
	}

	@Override
	public RawMtrWrhsIgiVO selectPrschsPrdcrInfo(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.selectPrschsPrdcrInfo(rawMtrWrhsIgiVO);
	}

	@Override
	public List<RawMtrWrhsIgiVO> selectRawMtrWghPrmncTotList(RawMtrWrhsIgiVO rawMtrWrhsIgiVO) throws Exception {
		return rawMtrWrhsIgiMapper.selectRawMtrWghPrmncTotList(rawMtrWrhsIgiVO);
	}
}
