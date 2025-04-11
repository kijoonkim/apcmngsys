package com.at.apcss.co.mng.service.impl;


import com.at.apcss.co.mng.mapper.ComMngMapper;
import com.at.apcss.co.mng.service.ComMngService;
import com.at.apcss.co.mng.vo.ComMenuLogHstryVO;
import com.at.apcss.co.mng.vo.ComUserVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 웹 시스템 사용 현황에 대한 서비스 구현 클래스를 정의한다
 * @author 김은총
 * @since 2024.04.09
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자          수정내용
 *  ----------  ----------    ---------------------------
 *  2024.04.09  김은총          최초 생성
 *
 * </pre>
 */
@Service("comMngService")
public class ComMngServiceImpl extends BaseServiceImpl implements ComMngService {

    @Autowired
    private ComMngMapper comMngMapper;

    @Override
    public List<ComMenuLogHstryVO> selectVstrCnt(ComMenuLogHstryVO comMenuLogHstryVO) throws Exception {
        List<ComMenuLogHstryVO> resultList = comMngMapper.selectVstrCnt(comMenuLogHstryVO);

        return resultList;
    }

    @Override
    public List<ComMenuLogHstryVO> selectPageViewCnt(ComMenuLogHstryVO comMenuLogHstryVO) throws Exception {
        List<ComMenuLogHstryVO> resultList = comMngMapper.selectPageViewCnt(comMenuLogHstryVO);

        return resultList;
    }

    @Override
    public List<ComUserVO> selectUserCnt(ComUserVO comUserVO) throws Exception {
        List<ComUserVO> resultList = comMngMapper.selectUserCnt(comUserVO);

        return resultList;
    }

}
