package com.at.apcss.co.sys.service;

public interface ComCryptoService {

	/**
	 * 평문 암호화
	 * @param plainText
	 * @return
	 */
	public String encrypt(String plainText);

	/**
	 * 복호화
	 * @param plainText
	 * @return
	 */
	public String decrypt(String hashedText);
}
