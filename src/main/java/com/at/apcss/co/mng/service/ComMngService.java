package com.at.apcss.co.mng.service;

import com.at.apcss.co.mng.vo.ComMenuLogHstryVO;
import com.at.apcss.co.mng.vo.ComUserVO;

import java.util.List;

public interface ComMngService {

    /**
     * 접속자수, 활성회원(로그인 기준) 조회
     * @param comMenuLogHstryVO
     * @return
     */
    public List<ComMenuLogHstryVO> selectVstrCnt(ComMenuLogHstryVO comMenuLogHstryVO) throws Exception;

    /**
     * 페이지 뷰
     * @param comMenuLogHstryVO
     * @return
     */
    public List<ComMenuLogHstryVO> selectPageViewCnt(ComMenuLogHstryVO comMenuLogHstryVO)  throws Exception;

    /**
     * 회원 수
     * @param comUserVO
     * @return
     */
    public List<ComUserVO> selectUserCnt(ComUserVO comUserVO)  throws Exception;

    /**
     * 조직 현황
     * @param comUserVO
     * @return
     */
    public List<ComUserVO> selectOgnzPrstCnt(ComUserVO comUserVO)  throws Exception;

    /**
     * 조직별 회원 현황 및 업무별 사용 현황
     * @param comUserVO
     * @return
     */
    public List<ComUserVO> selectOgnzTaskMbrCnt(ComUserVO comUserVO)  throws Exception;

}
