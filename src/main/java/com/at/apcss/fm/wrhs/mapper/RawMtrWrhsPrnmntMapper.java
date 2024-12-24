package com.at.apcss.fm.wrhs.mapper;

import com.at.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

/**
 * 원물입고예정 Mapper 인터페이스
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
@Mapper
public interface RawMtrWrhsPrnmntMapper {
    /**
     * 입고예정목록 조회
     * @param rawMtrWrhsPrnmntVO
     * @return List<RawMtrWrhsPrnmntVO>
     * @throws Exception
     */
    public List<RawMtrWrhsPrnmntVO> selectRawMtrWrhsPrnmntList(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception;

    /**
     * 입고예정 삭제 : update set delYn Y
     * @param rawMtrWrhsPrnmntVO
     * @return List<RawMtrWrhsPrnmntVO>
     * @throws Exception
     */
    public int deleteRawMtrWrhsPrnmnt(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception;

    /**
     * 입고예정 등록
     * @param rawMtrWrhsPrnmntVO
     * @return
     * @throws Exception
     */
    public int insertRawMtrWrhsPrnmnt(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception;

    /**
     * 입고예정 수정
     * @param rawMtrWrhsPrnmntVO
     * @return
     * @throws Exception
     */
    public int updateRawMtrWrhsPrnmnt(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception;
}