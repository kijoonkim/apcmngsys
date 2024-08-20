package com.at.apcss.co.sys.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComCryptoVO {

	private String plainText;
	
	private String publicKey;
	
	private String publicKeyModulus;
	
	private String publicKeyExponent;
}
