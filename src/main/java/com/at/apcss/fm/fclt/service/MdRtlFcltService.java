package com.at.apcss.fm.fclt.service;

import java.util.HashMap;

import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;

/**
 * APC전수조사관리 대시보드 Service 인터페이스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */
public interface MdRtlFcltService {
	/**
	 * 대시보드 목록을 조회한다.
	 * @param mdRtlFcltVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String,Object> selectFirstGridList(MdRtlFcltVO mdRtlFcltVO) throws Exception;
}
