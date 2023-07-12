package egovframework;

import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Import;

@ServletComponentScan
@SpringBootApplication
//@Import({EgovWebApplicationInitializer.class})
public class EgovBootApplication extends SpringBootServletInitializer {
	
	
	public static void main(String[] args) {
		System.out.println("##### EgovBootApplication Start #####");

		/*
        SpringApplication application = new SpringApplication(Application.class);
        application.run(args);
        */
		SpringApplication springApplication = new SpringApplication(EgovBootApplication.class);
		springApplication.setBannerMode(Banner.Mode.OFF);
		//springApplication.setLogStartupInfo(false);
		springApplication.setWebApplicationType(WebApplicationType.SERVLET);
		springApplication.run(args);
		
		System.out.println("##### EgovBootApplication End #####");
	}
	

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(EgovBootApplication.class);
	}
	
	/*
	public EgovBootApplication() {
		super();
		setRegisterErrorPageFilter(false);
		// ErrorPageFilter disable
	}
	*/
	
}
