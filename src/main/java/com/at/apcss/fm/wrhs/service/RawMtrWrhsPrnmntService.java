package com.at.apcss.fm.wrhs.service;

import com.at.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;

import java.util.List;

/**
 * @Class Name : RawMtrWrhsPrnmntService.java
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

public interface RawMtrWrhsPrnmntService {
    /**
     * 등록된 입고예정을 조회한다.
     * @param rawMtrWrhsPrnmntVO
     * @return
     * @throws Exception
     */
    public List<RawMtrWrhsPrnmntVO> selectRawMtrWrhsPrnmntList(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception;
}
