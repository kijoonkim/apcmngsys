package com.at.apcss.am.wrhs.service.impl;


import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.wrhs.mapper.RawMtrWrhsIgiMapper;
import com.at.apcss.am.wrhs.service.RawMtrWrhsIgiService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.am.wrhs.vo.SdlngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource(name= "cmnsTaskNoService")
    private CmnsTaskNoService cmnsTaskNoService;

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

    @Override
    public List<SdlngVO> sdlngCrtrInfos(SdlngVO sdlngVO) throws Exception {
        List<SdlngVO> resultList = rawMtrWrhsIgiMapper.sdlngCrtrInfos(sdlngVO);

        return resultList;
    }

    @Override
    public List<SdlngVO> sdlngFcltZoneInfos(SdlngVO sdlngVO) throws Exception {
        List<SdlngVO> resultList = rawMtrWrhsIgiMapper.sdlngFcltZoneInfos(sdlngVO);

        return resultList;
    }

    @Override
    public List<SdlngVO> sdlngFcltRowInfos(SdlngVO sdlngVO) throws Exception {
        List<SdlngVO> resultList = rawMtrWrhsIgiMapper.sdlngFcltRowInfos(sdlngVO);

        return resultList;
    }

    @Override
    public List<SdlngVO> selectSdlngCrtrList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectSdlngCrtrList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> multiSdlngCrtrList(List<SdlngVO> SdlngCrtrList) throws Exception {
        List<SdlngVO> insertSdlngCrtrList = new ArrayList<>();
        List<SdlngVO> updateSdlngCrtrList = new ArrayList<>();

        for(SdlngVO sdlngVO : SdlngCrtrList) {
            String rowSts = sdlngVO.getRowSts();

            if(ComConstants.ROW_STS_INSERT.equals(rowSts)) {
                insertSdlngCrtrList.add(sdlngVO);
            }

            if(ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
                updateSdlngCrtrList.add(sdlngVO);
            }
        }

        if(insertSdlngCrtrList.size() > 0) {
            for(SdlngVO sdlngVO : insertSdlngCrtrList) {
                String sdlngCd = cmnsTaskNoService.selectFnGetIdSdlngCd(sdlngVO);
                sdlngVO.setSdlngCd(sdlngCd);

                if(0 == insertSdlngCrtrList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        if(updateSdlngCrtrList.size() > 0) {
            for(SdlngVO sdlngVO : updateSdlngCrtrList) {
                if(0 == updateSdlngCrtrList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }

    @Override
    public int insertSdlngCrtrList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.insertSdlngCrtrList(sdlngVO);
    }

    @Override
    public int updateSdlngCrtrList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateSdlngCrtrList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> deleteSdlngCrtrList(SdlngVO sdlngVO) throws Exception {
        if(0 == rawMtrWrhsIgiMapper.deleteSdlngCrtrList(sdlngVO)) {
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));    // E0000    {0}
        }

        return null;
    }

    @Override
    public List<SdlngVO> selectSdlngList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectSdlngList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> multiSdlngList(List<SdlngVO> SdlngList) throws Exception {
        List<SdlngVO> insertSdlngList = new ArrayList<>();
        List<SdlngVO> updateSdlngList = new ArrayList<>();

        for(SdlngVO sdlngVO : SdlngList) {
            String rowSts = sdlngVO.getRowSts();

            if(ComConstants.ROW_STS_INSERT.equals(rowSts)) {
                insertSdlngList.add(sdlngVO);
            }

            if(ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
                updateSdlngList.add(sdlngVO);
            }
        }

        if(insertSdlngList.size() > 0) {
            for(SdlngVO sdlngVO : insertSdlngList) {
                String sdlngNo = cmnsTaskNoService.selectFnGetIdSdnlgNo(sdlngVO);
                sdlngVO.setSdlngNo(sdlngNo);

                if(0 == insertSdlngList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        if(updateSdlngList.size() > 0) {
            for(SdlngVO sdlngVO : updateSdlngList) {
                if(0 == updateSdlngList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }

    @Override
    public int insertSdlngList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.insertSdlngList(sdlngVO);
    }

    @Override
    public int updateSdlngList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateSdlngList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> deleteSdlngList(List<SdlngVO> SdlngList) throws Exception {
        List<SdlngVO> deleteSdlngList = new ArrayList<>();

        for(SdlngVO sdlngVO : SdlngList) {
            deleteSdlngList.add(sdlngVO);
        }

        if(deleteSdlngList.size() > 0) {
            for(SdlngVO sdlngVO : deleteSdlngList) {
                if(0 == rawMtrWrhsIgiMapper.deleteSdlngList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }

    @Override
    public List<SdlngVO> selectCltvtn(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectCltvtn(sdlngVO);
    }

    @Override
    public List<SdlngVO> selectCltvtnList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectCltvtnList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> multiCltvtnList(List<SdlngVO> CltvtnList) throws Exception {
        List<SdlngVO> insertCltvtnList = new ArrayList<>();
        List<SdlngVO> updateCltvtnList = new ArrayList<>();

        for(SdlngVO sdlngVO : CltvtnList) {
            String rowSts = sdlngVO.getRowSts();

            if(ComConstants.ROW_STS_INSERT.equals(rowSts)) {
                insertCltvtnList.add(sdlngVO);
            }

            if(ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
                updateCltvtnList.add(sdlngVO);
            }
        }

        if(insertCltvtnList.size() > 0) {
            for(SdlngVO sdlngVO : insertCltvtnList) {
                String plntngNo = cmnsTaskNoService.selectFnGetIdPlntngNo(sdlngVO);
                sdlngVO.setPlntngNo(plntngNo);

                if(0 == insertCltvtnList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == updateSdlngFcltCrtrList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        if(updateCltvtnList.size() > 0) {
            for(SdlngVO sdlngVO : updateCltvtnList) {
                if(0 == updateCltvtnList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == updateSdlngFcltCrtrList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }

    @Override
    public int insertCltvtnList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.insertCltvtnList(sdlngVO);
    }

    @Override
    public int updateCltvtnList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateCltvtnList(sdlngVO);
    }

    @Override
    public int updateSdlngFcltCrtrList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateSdlngFcltCrtrList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> deleteCltvtnList(SdlngVO sdlngVO) throws Exception {
        if(0 == rawMtrWrhsIgiMapper.deleteCltvtnList(sdlngVO)) {
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));    // E0000    {0}
        }

        return null;
    }

    @Override
    public List<SdlngVO> selectWgh(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectWgh(sdlngVO);
    }

    @Override
    public List<SdlngVO> selectWghList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectWghList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> multiWghList(List<SdlngVO> WghList) throws Exception {
        List<SdlngVO> insertWghList = new ArrayList<>();
        List<SdlngVO> updateWghList = new ArrayList<>();

        for(SdlngVO sdlngVO : WghList) {
            String rowSts = sdlngVO.getRowSts();

            if(ComConstants.ROW_STS_INSERT.equals(rowSts)) {
                insertWghList.add(sdlngVO);
            }

            if(ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
                updateWghList.add(sdlngVO);
            }
        }

        if(insertWghList.size() > 0) {
            Map<String, Integer> insertObj = new HashMap<>();

            for(SdlngVO sdlngVO : insertWghList) {
                String plntngNo = sdlngVO.getPlntngNo();
                int wghSeq = 1;

                if(insertObj.containsKey(plntngNo)) {
                    wghSeq = insertObj.get(plntngNo) + 1;
                } else {
                    int count = rawMtrWrhsIgiMapper.countWghList(sdlngVO);
                    wghSeq = count + 1;
                }

                sdlngVO.setWghSeq(wghSeq);

                insertObj.put(plntngNo, wghSeq);

                if(0 == insertWghList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == saveHrvstYmd(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        if(updateWghList.size() > 0) {
            for(SdlngVO sdlngVO : updateWghList) {
                if(0 == updateWghList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == saveHrvstYmd(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }

    @Override
    public int insertWghList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.insertWghList(sdlngVO);
    }

    @Override
    public int updateWghList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateWghList(sdlngVO);
    }

    @Override
    public int saveHrvstYmd(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.saveHrvstYmd(sdlngVO);
    }

    @Override
    public HashMap<String, Object> deleteWghList(SdlngVO sdlngVO) throws Exception {
        if(0 == rawMtrWrhsIgiMapper.deleteWghList(sdlngVO)) {
            throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));    // E0000    {0}
        }

        return null;
    }

    @Override
    public List<SdlngVO> selectSpmtList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.selectSpmtList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> multiSpmtList(List<SdlngVO> SpmtList) throws Exception {
        List<SdlngVO> insertSpmtList = new ArrayList<>();
        List<SdlngVO> updateSpmtList = new ArrayList<>();

        for(SdlngVO sdlngVO : SpmtList) {
            String rowSts = sdlngVO.getRowSts();

            if(ComConstants.ROW_STS_INSERT.equals(rowSts)) {
                insertSpmtList.add(sdlngVO);
            }

            if(ComConstants.ROW_STS_UPDATE.equals(rowSts)) {
                updateSpmtList.add(sdlngVO);
            }
        }

        if(insertSpmtList.size() > 0) {
            for(SdlngVO sdlngVO : insertSpmtList) {
                String pckgno = cmnsTaskNoService.selectPckgno(sdlngVO.getApcCd(), sdlngVO.getSpmtYmd());
                String spmtno = cmnsTaskNoService.selectSpmtno(sdlngVO.getApcCd(), sdlngVO.getSpmtYmd());

                sdlngVO.setPckgno(pckgno);
                sdlngVO.setSpmtno(spmtno);

                if(0 == insertSpmtPrfmncComList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == insertSpmtPrfmncDtlList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        if(updateSpmtList.size() > 0) {
            for(SdlngVO sdlngVO : updateSpmtList) {
                if(0 == updateSpmtPrfmncComList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == updateSpmtPrfmncDtlList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }

    @Override
    public int insertSpmtPrfmncComList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.insertSpmtPrfmncComList(sdlngVO);
    }

    @Override
    public int insertSpmtPrfmncDtlList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.insertSpmtPrfmncDtlList(sdlngVO);
    }

    @Override
    public int updateSpmtPrfmncComList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateSpmtPrfmncComList(sdlngVO);
    }

    @Override
    public int updateSpmtPrfmncDtlList(SdlngVO sdlngVO) throws Exception {
        return rawMtrWrhsIgiMapper.updateSpmtPrfmncDtlList(sdlngVO);
    }

    @Override
    public HashMap<String, Object> deleteSpmtList(List<SdlngVO> SpmtList) throws Exception {
        List<SdlngVO> deleteSpmtList = new ArrayList<>();

        for(SdlngVO sdlngVO : SpmtList) {
            deleteSpmtList.add(sdlngVO);
        }

        if(deleteSpmtList.size() > 0) {
            for(SdlngVO sdlngVO : deleteSpmtList) {
                if(0 == rawMtrWrhsIgiMapper.deleteSpmtPrfmncComList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
                if(0 == rawMtrWrhsIgiMapper.deleteSpmtPrfmncDtlList(sdlngVO)) {
                    throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "삭제 중 오류가 발생 했습니다.")));    // E0000    {0}
                }
            }
        }

        return null;
    }
}
