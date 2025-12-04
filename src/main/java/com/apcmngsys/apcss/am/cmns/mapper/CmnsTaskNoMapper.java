package com.apcmngsys.apcss.am.cmns.mapper;

import com.apcmngsys.apcss.am.cmns.vo.CmnsTaskNoVO;
import com.apcmngsys.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.apcmngsys.apcss.am.wrhs.vo.SdlngVO;
import com.apcmngsys.apcss.fm.wrhs.vo.RawMtrWrhsPrnmntVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * 업무별 번호 Mapper 인터페이스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Mapper
public interface CmnsTaskNoMapper {
	
	/**
	 * APC 업무별 번호 자동 발번 단건 조회
	 * @param cmnsTaskNoVO
	 * @return
	 * @throws Exception
	 */
	public CmnsTaskNoVO selectFnGetIdTaskNo(CmnsTaskNoVO cmnsTaskNoVO) throws Exception;

	/**
	 * APC 업무별 파레트 번호 발번
	 * @param rawMtrWrhsVO
	 * @return
	 * @throws Exception
	 */
	public String selectFnGetPltNo(RawMtrWrhsVO rawMtrWrhsVO) throws Exception;

	/**
	 * 원물입고예정번호 발번
	 * @param rawMtrWrhsPrnmntVO
	 * @return
	 * @throws Exception
	 */
	public String selectFnGetPrnmntNo(RawMtrWrhsPrnmntVO rawMtrWrhsPrnmntVO) throws Exception;

    /**
     * 육묘코드 발번
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public String selectFnGetIdSdlngCd(SdlngVO sdlngVO) throws Exception;

    /**
     * 육묘번호 발번
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public String selectFnGetIdSdnlgNo(SdlngVO sdlngVO) throws Exception;

    /**
     * 정식번호 발번
     * @param sdlngVO
     * @return
     * @throws Exception
     */
    public String selectFnGetIdPlntngNo(SdlngVO sdlngVO) throws Exception;
}
