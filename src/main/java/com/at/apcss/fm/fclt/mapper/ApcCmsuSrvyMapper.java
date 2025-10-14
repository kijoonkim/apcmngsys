package com.at.apcss.fm.fclt.mapper;

import com.at.apcss.fm.fclt.vo.ApcCmsuSrvyRsltVO;
import com.at.apcss.fm.fclt.vo.ApcCmsuSrvyVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface ApcCmsuSrvyMapper {
    public ApcCmsuSrvyVO selectSrvyMst(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    public List<ApcCmsuSrvyVO> selectSrvyDtl(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    public List<ApcCmsuSrvyRsltVO> selectSrvyApcRsltDtlList (ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO) throws Exception;

    public ApcCmsuSrvyRsltVO selectSrvyApcRslt(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    public int insertSrvyApcRslt(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    public int updateSrvyApcRslt(ApcCmsuSrvyVO apcCmsuSrvyVO) throws Exception;

    public ApcCmsuSrvyRsltVO selectSrvyApcRsltDtl(ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO) throws Exception;

    public int insertSrvyApcRsltDtl(ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO) throws Exception;

    public int updateSrvyApcRsltDtl(ApcCmsuSrvyRsltVO apcCmsuSrvyRsltVO) throws Exception;
}
