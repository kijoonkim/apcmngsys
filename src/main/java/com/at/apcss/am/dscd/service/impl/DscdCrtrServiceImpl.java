package com.at.apcss.am.dscd.service.impl;

import com.at.apcss.am.dscd.mapper.DscdCrtrMapper;
import com.at.apcss.am.dscd.service.DscdCrtrService;
import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdMngVO;
import com.at.apcss.am.dscd.vo.DscdPrfmncVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : DscdCrtrServiceImpl.java
 * @Description : 폐기기준 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2024.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.21  신정철        최초 생성
 * </pre>
 */
@Service("dscdCrtrService")
public class DscdCrtrServiceImpl extends BaseServiceImpl implements DscdCrtrService {

	@Autowired
	private DscdCrtrMapper dscdCrtrMapper;

	@Override
	public DscdCrtrVO selectDscdCrtr(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtr(dscdCrtrVO);
	}

	@Override
	public DscdCrtrVO selectDscdCrtr(String apcCd, String dscdCrtrType, String crtrCd) throws Exception {
		DscdCrtrVO param = new DscdCrtrVO();
		param.setApcCd(apcCd);
		param.setDscdCrtrType(dscdCrtrType);
		param.setCrtrCd(crtrCd);
		return dscdCrtrMapper.selectDscdCrtr(param);
	}

	@Override
	public DscdCrtrVO selectDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtrDtl(dscdCrtrVO);
	}

	@Override
	public List<DscdCrtrVO> selectCrtrDtlListInUse(DscdCrtrVO dscdCrtrVO) throws Exception {
		return dscdCrtrMapper.selectDscdCrtrDtlList(dscdCrtrVO);
	}


    @Override
    public List<DscdCrtrVO> selectDscdCrtrList(DscdCrtrVO dscdCrtrVO) throws Exception {
        return dscdCrtrMapper.selectDscdCrtrList(dscdCrtrVO);
    }

    @Override
    public HashMap<String, Object> insertDscdCrtr(DscdMngVO dscdMngVO) throws Exception {
        String apcCd = dscdMngVO.getApcCd();

        List<DscdCrtrVO> dscdCrtrList = dscdMngVO.getDscdCrtrList();

        String sysUserId = dscdMngVO.getSysLastChgUserId();
        String sysPrgrmId = dscdMngVO.getSysLastChgPrgrmId();

        for ( DscdCrtrVO crtr : dscdCrtrList ) {

            crtr.setApcCd(apcCd);

            // 데이터 확인
            DscdCrtrVO crtrInfo = selectDscdCrtr(crtr);

            if (crtrInfo == null || !StringUtils.hasText(crtrInfo.getCrtrCd())) {
                crtr.setNeedsInsert(true);
            } else {
                crtr.setNeedsInsert(false);
            }
        }

        for ( DscdCrtrVO crtr : dscdCrtrList ) {
            crtr.setSysFrstInptUserId(sysUserId);
            crtr.setSysFrstInptPrgrmId(sysPrgrmId);
            crtr.setSysLastChgUserId(sysUserId);
            crtr.setSysLastChgPrgrmId(sysPrgrmId);

            if (crtr.isNeedsInsert()) {
                dscdCrtrMapper.insertDscdCrtr(crtr);
            } else {
                dscdCrtrMapper.updateDscdCrtr(crtr);
            }
        }

        return null;
    }

    @Override
    public HashMap<String, Object> deleteDscdCrtr(DscdMngVO dscdMngVO) throws Exception {
        String apcCd = dscdMngVO.getApcCd();

        List<DscdCrtrVO> dscdCrtrList = dscdMngVO.getDscdCrtrList();

        String sysUserId = dscdMngVO.getSysLastChgUserId();
        String sysPrgrmId = dscdMngVO.getSysLastChgPrgrmId();

        for ( DscdCrtrVO crtr : dscdCrtrList ) {
            crtr.setApcCd(apcCd);
        }

        for ( DscdCrtrVO crtr : dscdCrtrList ) {
            crtr.setSysFrstInptUserId(sysUserId);
            crtr.setSysFrstInptPrgrmId(sysPrgrmId);
            crtr.setSysLastChgUserId(sysUserId);
            crtr.setSysLastChgPrgrmId(sysPrgrmId);

            List<DscdCrtrVO> dtlList = dscdCrtrMapper.selectDscdCrtrDtlList(crtr);

            for ( DscdCrtrVO dtl : dtlList ) {
                dtl.setSysFrstInptUserId(sysUserId);
                dtl.setSysFrstInptPrgrmId(sysPrgrmId);
                dtl.setSysLastChgUserId(sysUserId);
                dtl.setSysLastChgPrgrmId(sysPrgrmId);

                dscdCrtrMapper.deleteDscdCrtrDtl(dtl);
            }

            dscdCrtrMapper.deleteDscdCrtr(crtr);
        }

        return null;
    }

    @Override
    public List<DscdCrtrVO> selectDscdCrtrDtlList(DscdCrtrVO dscdCrtrVO) throws Exception {
        return dscdCrtrMapper.selectDscdCrtrDtlList(dscdCrtrVO);
    }

    @Override
    public int insertDscdCrtrDtl(List<DscdCrtrVO> dscdCrtrVO) throws Exception {
        int insertCnt = 0;
        insertCnt = dscdCrtrMapper.insertDscdCrtrDtl(dscdCrtrVO);
        if(insertCnt <= 0){
            throw new EgovBizException();
        }

        return insertCnt;
    }

    @Override
    public int deleteDscdCrtrDtl(DscdCrtrVO dscdCrtrVO) throws Exception {
        int deleteCnt = 0;
        deleteCnt = dscdCrtrMapper.deleteDscdCrtrDtl(dscdCrtrVO);
        if(deleteCnt <= 0) {
            throw new EgovBizException();
        }

        return deleteCnt;
    }


    @Override
    public List<DscdCrtrVO> selectDscdRegList(DscdCrtrVO dscdCrtrVO) throws Exception {
        return dscdCrtrMapper.selectDscdRegList(dscdCrtrVO);
    }


    @Override
    public int deleteDscdPrfmncList(DscdCrtrVO dscdCrtrVO) throws Exception {
        dscdCrtrMapper.deleteDscdPrfmncList(dscdCrtrVO);

        return 0;
    }
}
