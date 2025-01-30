package egovframework;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.io.FileInputStream;

@ServletComponentScan
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
@EnableScheduling
//@Import({EgovWebApplicationInitializer.class})
public class EgovBootApplication extends SpringBootServletInitializer {

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

		//Google Firebase SDK 초기화
		String firebaseConfigPath = "firebase/apcss-e27c1-firebase-adminsdk-lozm8-64d60dbb91.json";
		FirebaseOptions options = FirebaseOptions.builder()
				.setCredentials(GoogleCredentials.fromStream(new ClassPathResource(firebaseConfigPath).getInputStream()))
				.build();
		FirebaseApp.initializeApp(options);

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
