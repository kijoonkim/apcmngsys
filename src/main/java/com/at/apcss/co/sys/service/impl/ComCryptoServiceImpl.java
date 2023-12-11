package com.at.apcss.co.sys.service.impl;

import java.util.Base64;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cryptography.EgovCryptoService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.co.sys.service.ComCryptoService;

import egovframework.com.cmm.service.EgovProperties;

@Service("comCryptoService")
public class ComCryptoServiceImpl extends BaseServiceImpl implements ComCryptoService {

	public static final String ALGORITM_KEY = EgovProperties.getProperty("Globals.crypto.algoritm");
	
	/** 암호화서비스 */
    @Resource(name="egovARIACryptoService")
    EgovCryptoService cryptoService;
	
	@Override
	public String encrypt(String plainText) {
		
    	if (!StringUtils.hasText(plainText)) {
    		return null;
    	}
    	
		String encryptedText = Base64.getEncoder().encodeToString(cryptoService.encrypt(plainText.getBytes(), ALGORITM_KEY));
		
		return encryptedText;
	}

	@Override
	public String decrypt(String hashedText) {
		
    	if (!StringUtils.hasText(hashedText)) {
    		return null;
    	}
    	
		byte[] decodedBytes = Base64.getDecoder().decode(hashedText);
		String decryptedText = new String(cryptoService.decrypt(decodedBytes, ALGORITM_KEY));

		return decryptedText;
	}
	
}
