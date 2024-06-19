package com.at.apcma.com.service;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class ApcMaComUtil {

	private static final Logger logger = LogManager.getLogger(ApcMaComUtil.class);
	
	/**
	 * 파일 업로드 - UUID로 저장
	 * @param filepath
	 * @param files
	 * @return
	 */
	public static HashMap<String, Object> fileUpload(String filepath, List<MultipartFile> files){
		
		HashMap<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("success", 	false);
		
		if(!ApcMaComUtil.isExistFile(files)){
			return rmap;
		}
		
		// param set
		boolean isSuccess 		= false;
		ArrayList<String> flist = new ArrayList<String>();
		
		String dir 				= filepath;
		String orgFileName 		= "";
		String extFileName 		= "";
		String newFileName 		= "";
		String fullFileName 	= "";
		
		try {
			
			logger.debug("--------------------- file upload start ---------------------");
			
			MultipartFile multipartFile = null; 
			
			int count = 0;
			for (int idx = 0; idx < files.size(); idx++) 
			{
				if(files.get(idx).getOriginalFilename().equals("")){
					continue;
				}
				count ++;
				
				// [1] get extfileName and create fileName
				multipartFile 	= files.get(idx);
				orgFileName 	= files.get(idx).getOriginalFilename();
				extFileName 	= orgFileName.substring(orgFileName.lastIndexOf(".") + 1);
				newFileName 	= StringUtils.remove(UUID.randomUUID().toString(),"-") + "." + extFileName;
				fullFileName	= checkLastSlash(dir) + newFileName;
				
				// [2] file upload
				new File(dir).mkdirs();
				multipartFile.transferTo(new File(fullFileName));
				
				flist.add(newFileName);
				
				logger.debug("count : " 		+ String.valueOf(count));
				logger.debug("orgFileName : " 	+ orgFileName);
				logger.debug("saveFileName : " 	+ newFileName);
				logger.debug("savePath : " 		+ checkLastSlash(dir));
				logger.debug("size(byte) : " 	+ multipartFile.getSize());
			}
			logger.debug("--------------------- file upload end // ---------------------");
			isSuccess = true;
			
		} catch (IOException e){
			isSuccess = false;
			logger.debug(e.getMessage());
		} catch (Exception e){
			isSuccess = false;
			logger.debug(e.getMessage());
		} finally {
			if(!isSuccess && flist.size()>0){
				try{
					File cdir 		= new File(dir);
					File[] fileList = cdir.listFiles();
					for (File infile : fileList) 
					{
						if(flist.size()==0) break;
						for (int i = 0; i < flist.size(); i++) {
							if(infile.getName().equals(flist.get(i))){
								infile.delete();
								logger.debug("[Upload Error !!!!!!!] delete file: " + flist.get(i).toString());
								flist.remove(i);
								break;
							}
						}
					}
				}catch(Exception e){
					logger.debug(e.getMessage());
				}
			}
		}
		
		// return map set
		rmap.put("success", 		isSuccess);
		rmap.put("orgFileName", 	orgFileName);
		rmap.put("saveFileName", 	newFileName);
		rmap.put("fullFileName", 	fullFileName);
		rmap.put("list", 			flist);
		return rmap;
	}
	
	/**
	 * 파일 하나 삭제
	 * @param filepath
	 * @return
	 */
	public static boolean fileDeleteOne(String filepath){
		boolean isSuccess = false;
		try {
			File file = new File(filepath);
			if(file.exists()){
				FileUtils.forceDelete(file);
				isSuccess = true;
			}
		} catch (IOException e) {
			logger.debug(e.getMessage());
			isSuccess = false;
		}
		
		return isSuccess;
	}
	
	/**
	 * file list를 확인하여 존재 유.무를 알려준다.
	 * @param files
	 * @return
	 */
	public static Boolean isExistFile(List<MultipartFile> files){
		
		if(files == null || files.size() == 0) return false;
		
		int count = 0;
		for (int idx = 0; idx < files.size(); idx++) {
			if(!files.get(idx).getOriginalFilename().equals("")) count ++;
		}
		return (count > 0)? true : false;
	}	
	
	/**
	 * 마지막 문자가 '/' 슬래시가 아니면 '/'를 붙여준다.
	 * @param val
	 * @return
	 * @throws Exception
	 */
	private static String checkLastSlash(String val) throws Exception {
		
		if(val.contains(":")){
			//window path
			if(!String.valueOf(val.charAt(val.length()-1)).equals("\\")) {
				val = val + "\\"; 
			}
		} else if(!String.valueOf(val.charAt(val.length()-1)).equals("/")) {
			//other path
			val = val+ "/"; 
		}
		return val;
	}	
	
	/**
	 * null 을 string 으로
	 * @param obj
	 * @return
	 * @throws Exception
	 */
	public static String nullToString(Object obj) throws Exception {
		return (obj==null) ? "" : obj.toString();
	}

	public static void buildTree(Map<String, Object> node, Map<String, Map<String, Object>> deptMap,
						  List<Map<String, Object>> sortedDepartments, int level) {
		node.put("LEVEL", level);
		sortedDepartments.add(node);

		List<Map<String, Object>> children = deptMap.values().stream()
				.filter(dept -> node.get("DEPT_CODE").equals(dept.get("PARENTKEYID")))
				.sorted(Comparator.comparing(dept -> (String) dept.get("DEPT_CODE")))
				.collect(Collectors.toList());

		for (Map<String, Object> child : children) {
			buildTree(child, deptMap, sortedDepartments, level + 1);
		}
	}
}
