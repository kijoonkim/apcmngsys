package com.at.apcss.fm.wrhs.service.impl;

import com.at.apcss.am.wrhs.mapper.RawMtrWrhsMapper;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.wrhs.mapper.RawMtrWrhsPrnmntMapper;
import com.at.apcss.fm.wrhs.service.RawMtrWrhsPrnmntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.at.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;

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

    @Override
    public List<RawMtrWrhsPrnmntVO> selectRawMtrWrhsPrnmntList(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception {

        List<RawMtrWrhsPrnmntVO> resultVo = rawMtrWrhsPrnmntMapper.selectRawMtrWrhsPrnmntList(rawMtrWrhsPrnmntVO);
        return resultVo;
    }
}
