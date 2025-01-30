package com.at.apcss.co.mail.mapper;


import com.at.apcss.co.mail.vo.EmlLogVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 메일 Mapper
 * @author FINEVT 개발팀 신정철
 * @since 2024.06.20
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일        수정자        수정내용
 *  ----------  ----------   ---------------------------
 *  20234.06.20  신정철         최초 생성
 *
 *  </pre>
 */
@Mapper
public interface ApcMailMapper {


    /**
     * 메일로그 단건 조회
     * @param emlLogVO
     * @return
     * @throws Exception
     */
    public EmlLogVO selectComEmlLog(EmlLogVO emlLogVO) throws Exception;

    /**
     * 메일로그 조회
     * @param emlLogVO
     * @return
     * @throws Exception
     */
    public List<EmlLogVO> selectComEmlLogList(EmlLogVO emlLogVO) throws Exception;

    /**
     * 미처리 메일 로그 조회
     * @param emlLogVO
     * @return
     * @throws Exception
     */
    public List<EmlLogVO> selectComEmlLogListForSndng(EmlLogVO emlLogVO) throws Exception;

    /**
     * 메일로그 송신 처리
     * @param emlLogVO
     * @return
     * @throws Exception
     */
    public int updateComEmlLogSndng(EmlLogVO emlLogVO) throws Exception;


}
