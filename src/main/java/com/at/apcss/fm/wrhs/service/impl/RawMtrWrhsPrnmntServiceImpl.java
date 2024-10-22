package com.at.apcss.fm.wrhs.service.impl;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.am.wrhs.service.RawMtrWrhsService;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.wrhs.mapper.RawMtrWrhsPrnmntMapper;
import com.at.apcss.fm.wrhs.service.RawMtrWrhsPrnmntService;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.at.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrWrhsPrnmntServiceImpl.java
 * @Description : 원물입고예정 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 윤필호
 * @since 2024.09.02
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.02  윤필호        최초 생성
 * </pre>
 */

@Service("rawMtrWrhsPrnmntService")
public class RawMtrWrhsPrnmntServiceImpl extends BaseServiceImpl implements RawMtrWrhsPrnmntService {
    @Autowired
    private RawMtrWrhsPrnmntMapper rawMtrWrhsPrnmntMapper;

    @Resource(name="cmnsTaskNoService")
    private CmnsTaskNoService cmnsTaskNoService;

    @Resource(name="rawMtrWrhsService")
    private RawMtrWrhsService rawMtrWrhsService;

    //원물입고예정 목록 조회
    @Override
    public List<RawMtrWrhsPrnmntVO> selectRawMtrWrhsPrnmntList(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception {

        List<RawMtrWrhsPrnmntVO> resultList = rawMtrWrhsPrnmntMapper.selectRawMtrWrhsPrnmntList(rawMtrWrhsPrnmntVO);

        return resultList;
    }

    //원물입고예정 삭제
    @Override
    public HashMap<String, Object> deleteRawMtrWrhsPrnmnt(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception {

        rawMtrWrhsPrnmntMapper.deleteRawMtrWrhsPrnmnt(rawMtrWrhsPrnmntVO);

        return null;
    }

    //원물입고예정 등록
    @Override
    public HashMap<String, Object> insertRawMtrWrhsPrnmnt(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception {
        String prnmntno = rawMtrWrhsPrnmntVO.getPrnmntno();

        boolean needsPrnmntInsert = false;

        //prnmntno(원물입고예정번호)가 없으면 새로 발번
        if(!StringUtils.hasText(prnmntno)) {
            needsPrnmntInsert = true;
            prnmntno = cmnsTaskNoService.selectFnGetPrnmntNo(rawMtrWrhsPrnmntVO);

            rawMtrWrhsPrnmntVO.setPrnmntno(prnmntno);
        }

        if(needsPrnmntInsert) {
            rawMtrWrhsPrnmntMapper.insertRawMtrWrhsPrnmnt(rawMtrWrhsPrnmntVO);
        }

        return null;
    }
}