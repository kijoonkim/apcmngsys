package com.at.apcss.co.ntc.mapper;

import com.at.apcss.co.ntc.vo.ComMsgPopupVO;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.List;

@Mapper
public interface ComMsgPopupMapper {
    List<ComMsgPopupVO> selectMsgPopup(ComMsgPopupVO comMsgPopupVO) throws Exception;

    int updateMsgPopup(ComMsgPopupVO comMsgPopupVO) throws Exception;
}
