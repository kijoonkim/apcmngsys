package egovframework.com.config;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

/**
 * @ClassName : EgovConfigAppReport.java
 * @Description : Report 설정
 *
 * @author : 신정철
 * @since  : 2023. 8. 20
 * @version : 1.0
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일              수정자               수정내용
 *  -------------  ------------   ---------------------
 *   2023. 8. 20    신정철               최초 생성
 * </pre>
 *
 */
@Configuration
public class EgovConfigAppReport {

	/**
	 *  @Value 을 어노테이션을 이용하는 방법
	 */
	//	@Value("${Globals.DbType}")
	//	private String dbType;
	//
	//	@Value("${Globals.DriverClassName}")
	//	private String className;
	//
	//	@Value("${Globals.Url}")
	//	private String url;
	//
	//	@Value("${Globals.UserName}")
	//	private String userName;
	//
	//	@Value("${Globals.Password}")
	//	private String password;

	/**
	 *  Environment 의존성 주입하여 사용하는 방법
	 */

	@Autowired
	Environment env;

	private String reportDbName;

	private String reportUrl;

	private String reportType;

	private String reportPath;

	//spring.report.url=http://133.186.212.16/ClipReport
	//spring.report.path=%root%/crf
	//spring.report.type=crf.root
	@PostConstruct
	void init() {
		reportDbName = env.getProperty("spring.report.dbName");
		reportUrl = env.getProperty("spring.report.url");
		reportType = env.getProperty("spring.report.type");
		reportPath = env.getProperty("spring.report.path");

		System.out.println(String.format("reportUrl: %s", reportUrl));
		System.out.println(String.format("reportPath: %s", reportPath));
	}



	/**
	 * @return [Report DbName 설정]
	 */
	@Bean(name = {"reportDbName"})
	public String reportDbName() {
		return reportDbName;
	}
	/**
	 * @return [Report Url 설정]
	 */
	@Bean(name = {"reportUrl"})
	public String reportUrl() {
		return reportUrl;
	}

	/**
	 * @return [Report Type 설정]
	 */
	@Bean(name = {"reportType"})
	public String reportType() {
		return reportType;
	}

	/**
	 * @return [Report Path 설정]
	 */
	@Bean(name = {"reportPath"})
	public String reportPath() {
		return reportPath;
	}
}
