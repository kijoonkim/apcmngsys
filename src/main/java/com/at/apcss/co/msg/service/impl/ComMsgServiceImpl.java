package com.at.apcss.co.msg.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.msg.mapper.ComMsgMapper;
import com.at.apcss.co.msg.service.ComMsgService;
import com.at.apcss.co.msg.vo.ComMsgVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : ComMsgServiceImpl.java
 * @Description : 공통메시지 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("comMsgService")
public class ComMsgServiceImpl extends BaseServiceImpl implements ComMsgService{

	@Autowired
	private ComMsgMapper comMsgMapper;
	
	@Override
	public ComMsgVO selectComMsg(ComMsgVO comMsgVO) throws Exception {

		ComMsgVO resultVO = comMsgMapper.selectComMsg(comMsgVO);
		
		return resultVO;
	}

	@Override
	public ComMsgVO selectComMsg(String msgKey) throws Exception {
		
		ComMsgVO comMsgVO = new ComMsgVO();
		comMsgVO.setMsgKey(msgKey);
		
		ComMsgVO resultVO = comMsgMapper.selectComMsg(comMsgVO);
		
		return resultVO;
	}

	@Override
	public List<ComMsgVO> selectComMsgList(ComMsgVO comMsgVO) throws Exception {
		
		List<ComMsgVO> resultList = comMsgMapper.selectComMsgList(comMsgVO);
		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
		for (ComMsgVO msg : resultList ) {
			System.out.printf("msgCn : %s", msg.getMsgCn());
			System.out.println();
		}
		return resultList;
	}

	
	@Override
	public int insertComMsg(ComMsgVO comMsgVO) throws Exception {
		
		int insertedCnt = comMsgMapper.insertComMsg(comMsgVO);
		
		return insertedCnt;
	}

	@Override
	public int updateComMsg(ComMsgVO comMsgVO) throws Exception {
		
		int updatedCnt = comMsgMapper.updateComMsg(comMsgVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteComMsg(ComMsgVO comMsgVO) throws Exception {
		
		int deletedCnt = comMsgMapper.deleteComMsg(comMsgVO);
		
		return deletedCnt;
	}

	@Override
	public int deleteComMsgList(List<ComMsgVO> comMsgList) throws Exception {
		
		int deletedCnt = 0;
		
		for ( ComMsgVO comMsgVO : comMsgList ) {
			deletedCnt += comMsgMapper.deleteComMsg(comMsgVO);
		}
		
		return deletedCnt;
	}

}
