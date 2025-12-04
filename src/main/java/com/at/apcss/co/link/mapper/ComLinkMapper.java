package com.apcmngsys.apcss.co.link.mapper;

import com.apcmngsys.apcss.co.link.vo.ComLnkgRptVO;
import com.apcmngsys.apcss.co.link.vo.ComPageLinkDtlVO;
import com.apcmngsys.apcss.co.link.vo.ComPageLinkVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface ComLinkMapper {

    public ComPageLinkVO selectComPageLink(ComPageLinkVO comPageLinkVO) throws Exception;


    public List<ComPageLinkDtlVO> selectComPageLinkDtlList(ComPageLinkDtlVO comPageLinkDtlVO) throws Exception;

    public ComLnkgRptVO selectComLnkgRpt(ComLnkgRptVO comLnkgRptVO) throws Exception;

    public int insertComLnkgRpt(ComLnkgRptVO comLnkgRptVO) throws Exception;

    public int updateComLnkgRptExpry(ComLnkgRptVO comLnkgRptVO) throws Exception;



}
