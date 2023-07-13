package egovframework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Import;
import org.springframework.core.env.Environment;

@ServletComponentScan
@SpringBootApplication
//@Import({EgovWebApplicationInitializer.class})
public class EgovBootApplication extends SpringBootServletInitializer {
	
	
	@Autowired
    private static Environment environment;

    @Autowired
    public EgovBootApplication(Environment environment) {
        this.environment = environment;
    }
	
	public static void main(String[] args) throws Exception {
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
		
		EgovBootApplication app = new EgovBootApplication(environment);
		app.contextLoads();
		
		System.out.println("##### EgovBootApplication End #####");
	}
	
	public void contextLoads() throws Exception {
        System.out.println("DemoApplication 실행");
        System.out.println("profile 값 :: " + environment.getProperty("spring.profiles.active"));

        String username = environment.getProperty("spring.test.username");
        System.out.println("USERNAME :: " + username);
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
