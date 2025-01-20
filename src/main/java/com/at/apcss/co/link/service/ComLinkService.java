package com.at.apcss.co.link.service;


import com.at.apcss.co.link.vo.ComLnkgRptVO;
import com.at.apcss.co.link.vo.ComPageLinkVO;
import reactor.core.Exceptions;

import java.util.HashMap;

/**
 * 페이지 Link 정보 Service 인터페이스
 * @author 신정철
 * @since 2024.09.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.20  신정철       최초 생성
 * </pre>
 */
public interface ComLinkService {

    public ComPageLinkVO selectComPageLink(ComPageLinkVO comPageLinkVO) throws Exception;

    public ComPageLinkVO selectComPageLink(String linkUnqId) throws Exception;

    public ComLnkgRptVO selectComLnkgRpt(ComLnkgRptVO comLnkgRptVO) throws Exception;

    public ComLnkgRptVO selectComLnkgRpt(String uuid) throws Exception;

    public HashMap<String, Object> insertComLnkgRpt(ComLnkgRptVO comLnkgRptVO) throws Exception;

    public HashMap<String, Object> updateComLnkgRptExpry(ComLnkgRptVO comLnkgRptVO) throws Exception;
}
