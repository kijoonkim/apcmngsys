package egovframework.com.filter;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.env.Environment;

import com.easycerti.psm.log.generator.filter.EzFilter;

@Configuration
public class EzFilterRegistration {
	
	@Autowired
	Environment env;
	
	@Bean
    public FilterRegistrationBean<EzFilter> ezFilter() {
		
		Map<String, String> params = new HashMap<>();

		String fileName = env.getProperty("ez.filter.config");
		//String fileName = System.getProperty("ez.filter.config", "/app/easycerti/filter/ezfilter.config");
		
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(fileName);
			
			BufferedReader in = new BufferedReader( new InputStreamReader( fis, "UTF8" ));

			Properties result = new Properties();
			result.load(in);
			
			Iterator<Object> iter = result.keySet().iterator();
			while(iter.hasNext()) {
				String key = (String) iter.next();
				String value = (String) result.get(key);
				params.put(key, value);
			}
		} catch(Exception e) {
			params.put("mon.agent", "use");
			params.put("log.server.ip", "192.168.100.178");
			params.put("log.server.port", "46014");
			params.put("log.server.sub.ip", "192.168.100.178");
			params.put("log.server.sub.port", "46015");
			params.put("command.server.port", "56091");
			params.put("log.file.name", "Ezmon_SmartAPC_39");
			params.put("system.code", "39");
			params.put("print.session.info", "false");
			params.put("print.object.info", "false");
			params.put("req.id", "loginId");
			params.put("req.id.cut", "");
			params.put("socket.timeout", "1500");
			params.put("log.limit.size", "10");
			params.put("log.level", "1");
			params.put("log.file.write", "false");
			params.put("file.log.path", "/tmp/");
			params.put("exclude.url", "");
			params.put("max.queue.cnt", "1000");
			params.put("max.thread.cnt", "10");
			params.put("monitor.term", "30000");
			params.put("request.content.type", "all");
			params.put("socket.send.buff", "1048576");
			params.put("socket.recv.buff", "146988");

		} finally {
			if (fis != null) { try { fis.close(); } catch (IOException e) { /*e.printStackTrace();*/ } }
		}
		
		FilterRegistrationBean<EzFilter> filterRegBean = new FilterRegistrationBean<>();
		filterRegBean.setFilter(new EzFilter());
		filterRegBean.addUrlPatterns("/*");
		filterRegBean.setOrder(Ordered.HIGHEST_PRECEDENCE);
		
		
		filterRegBean.setInitParameters(params);
		return filterRegBean;
	}
}
