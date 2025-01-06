package com.at.apcss.am.asst.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.asst.mapper.AsstMtrMapper;
import com.at.apcss.am.asst.service.AsstMtrService;
import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortFcltServiceImpl.java
 * @Description : 선별설비정보 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @param <SortFcltVO>
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.03  박승진        최초 생성
 * </pre>
 */
@Service("asstMtrService")
public class AsstMtrServiceImpl extends BaseServiceImpl implements AsstMtrService {

	@Autowired
	private AsstMtrMapper asstMtrMapper;

	@Override
	public List<AsstMtrVO> selectAsstMtrCrtrInfoList(AsstMtrVO asstMtrVO) throws Exception {
		// TODO Auto-generated method stub
		List<AsstMtrVO> result = asstMtrMapper.selectAsstMtrCrtrInfoList(asstMtrVO);

		return result;
	}

	@Override
	public int insertAsstMtrCrtrInfo(List<AsstMtrVO> asstMtrVOList) throws Exception {
		int result = 0;
		asstMtrVOList.forEach(item->{
			String status = item.getGubun();
			if(status.equals("insert")) {
				asstMtrMapper.insertAsstMtrCrtrInfo(item);
			}else if(status.equals("update")) {
				asstMtrMapper.updateAsstMtrCrtrInfo(item);
			}
		});

		return result;
	}

	@Override
	public int insertAsstMtrCrtrDtlInfo(List<AsstMtrVO> asstMtrVOList) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		asstMtrVOList.forEach(item->{
		String status = item.getStatus();
			if(status.equals("3")) {
				asstMtrMapper.insertAsstMtrCrtrDtlInfo(item);
			}else if(status.equals("2")) {
				asstMtrMapper.updateAsstMtrCrtrDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public List<AsstMtrVO> selectAsstMtrCrtrInfoDtlList(AsstMtrVO asstMtrVO) throws Exception {
		// TODO Auto-generated method stub
		List<AsstMtrVO> result = asstMtrMapper.selectAsstMtrCrtrInfoDtlList(asstMtrVO);
		return result;
	}

	@Override
	public int deleteAsstMtrCrtrInfo(AsstMtrVO bomVO) throws Exception {
		int result = 0;
		asstMtrMapper.deleteAsstMtrCrtrInfo(bomVO);

		String mtrlType = bomVO.getMtrlType();

		//if(mtrlType == "S") {
		//	asstMtrMapper.deleteBomDtlList(bomVO);
		//	asstMtrMapper.deleteBomWrhsInfoList(bomVO);
		//	asstMtrMapper.deleteBomSpmtInfoList(bomVO);
		//}

		return result;
	}

	@Override
	public List<AsstMtrVO> selectBomMstrList(AsstMtrVO bomVO) throws Exception {
		List<AsstMtrVO> result = asstMtrMapper.selectBomMstrList(bomVO);
		return result;
	}

	@Override
	public List<AsstMtrVO> selectBomDtlList(AsstMtrVO bomVO) throws Exception {
		List<AsstMtrVO> result = asstMtrMapper.selectBomDtlList(bomVO);
		return result;
	}

	@Override
	public int insertBomMstrInfo(AsstMtrVO bomVO) throws Exception {
		int result = 0;
		String status = bomVO.getGubun();

		List<AsstMtrVO> bomList = asstMtrMapper.selectBomMstrList(bomVO);
		int bom = bomList.size();
		if(bom > 0) {
			status = "update";
		}else {
			status = "insert";
		}

		if(status.equals("insert")) {
			asstMtrMapper.insertBomMstrInfo(bomVO);
		}else if(status.equals("update")) {
			//asstMtrMapper.updateBomMstrInfo(bomVO);
		}

		return result;
	}

	@Override
	public int insertBomDtlInfo(List<AsstMtrVO> bomVOList) throws Exception {
		int result = 0;
		bomVOList.forEach(item->{
		String status = item.getGubun();
			if(status.equals("insert")) {
				asstMtrMapper.insertBomDtlInfo(item);
				asstMtrMapper.insertAsstMtrCrtrInfo(item);
			}else if(status.equals("update")) {
				asstMtrMapper.updateBomDtlInfo(item);
			}
		});
		return result;
	}

	@Override
	public int deleteBomCrtrInfo(AsstMtrVO bomVO) throws Exception {
		int result = 0;
		asstMtrMapper.deleteBomCrtrInfo(bomVO);
		return result;
	}

	@Override
	public int deleteBomDtlList(AsstMtrVO bomVO) throws Exception {
		int result = 0;
		asstMtrMapper.deleteBomDtlList(bomVO);
		return result;
	}

	@Override
	public List<AsstMtrVO> selectBomWrhsInfoList(AsstMtrVO bomVO) throws Exception {
		List<AsstMtrVO> result = asstMtrMapper.selectBomWrhsInfoList(bomVO);
		return result;
	}

	@Override
	public int insertBomWrhsInfoList(List<AsstMtrVO> bomVOList) throws Exception {

		bomVOList.forEach(item ->{
			AsstMtrVO bomInvntr = asstMtrMapper.selectBomInvntrInfo(item);
			AsstMtrVO bomWrhs = asstMtrMapper.selectBomWrhsInfo(item);

			//재고 테이블에 있는지 확인
			if(bomInvntr == null) {
				//수정입고량
				double wrhsQntt = item.getWrhsQntt();
				double wrhsWght = item.getWrhsWght();
				item.setInvntrQntt(wrhsQntt);
				item.setInvntrQntt(wrhsWght);

				asstMtrMapper.insertBomInvntrInfoList(item);
				asstMtrMapper.insertBomWrhsInfoList(item);
			}else {


				if(bomWrhs == null) {

					//현재고
					double orgInvntrQntt = bomInvntr.getInvntrQntt();
					double orgInvntrWght = bomInvntr.getInvntrWght();


					//수정입고량
					double wrhsQntt = item.getWrhsQntt();
					double wrhsWght = item.getWrhsWght();


					item.setInvntrQntt(orgInvntrQntt + wrhsQntt);
					item.setInvntrWght(orgInvntrWght + wrhsWght);

					asstMtrMapper.insertBomWrhsInfoList(item);
					asstMtrMapper.updateBomInvntrInfoList(item);
				}else{

					//현재고
					double orgInvntrQntt = bomInvntr.getInvntrQntt();
					double orgInvntrWght = bomInvntr.getInvntrWght();

					//현입고량
					double orgWrhsQntt = bomWrhs.getWrhsQntt();
					double orgWrhsWght = bomWrhs.getWrhsWght();

					//수정입고량
					double wrhsQntt = item.getWrhsQntt();
					double wrhsWght = item.getWrhsWght();

					item.setInvntrQntt(orgInvntrQntt + wrhsQntt - orgWrhsQntt);
					item.setInvntrWght(orgInvntrWght + wrhsWght - orgWrhsWght);

					asstMtrMapper.updateBomInvntrInfoList(item);
					asstMtrMapper.updateBomWrhsInfoList(item);
				}

			}
		});

		return 0;
	}

	@Override
	public List<AsstMtrVO> selectBomInvntrInfoList(AsstMtrVO bomVO) throws Exception {
		List<AsstMtrVO> result = asstMtrMapper.selectBomInvntrInfoList(bomVO);
		return result;
	}

	@Override
	public List<AsstMtrVO> selectBomSpmtInfoList(AsstMtrVO bomVO) throws Exception {
		List<AsstMtrVO> result = asstMtrMapper.selectBomSpmtInfoList(bomVO);
		return result;
	}

	@Override
	public int insertBomSpmtInfoList(List<AsstMtrVO> bomVOList) throws Exception {

		bomVOList.forEach(item ->{
			AsstMtrVO bomInvntr = asstMtrMapper.selectBomInvntrInfo(item);
			AsstMtrVO bomSpmt = asstMtrMapper.selectBomSpmtInfo(item);

			if(bomSpmt == null) {

				//현재고
				double orgInvntrQntt = bomInvntr.getInvntrQntt();
				double orgInvntrWght = bomInvntr.getInvntrWght();


				//수정출고량
				double spmtQntt = item.getSpmtQntt();
				double spmtWght = item.getSpmtWght();


				item.setInvntrQntt(orgInvntrQntt - spmtQntt);
				item.setInvntrWght(orgInvntrWght - spmtWght);

				asstMtrMapper.insertBomSpmtInfoList(item);
				asstMtrMapper.updateBomInvntrInfoList(item);
			}else{

				//현재고
				double orgInvntrQntt = bomInvntr.getInvntrQntt();
				double orgInvntrWght = bomInvntr.getInvntrWght();

				//현입고량
				double orgSpmtQntt = bomSpmt.getSpmtQntt();
				double orgSpmtWght = bomSpmt.getSpmtWght();

				//수정입고량
				double spmtQntt = item.getSpmtQntt();
				double spmtWght = item.getSpmtWght();

				item.setInvntrQntt(orgInvntrQntt - (spmtQntt - orgSpmtQntt));
				item.setInvntrWght(orgInvntrWght - (spmtWght - orgSpmtWght));

				asstMtrMapper.updateBomInvntrInfoList(item);
				asstMtrMapper.updateBomSpmtInfoList(item);
			}


		});

		return 0;
	}








}
