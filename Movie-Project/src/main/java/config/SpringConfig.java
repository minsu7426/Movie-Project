package config;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import controller.MovieController;
import controller.NoticeController;

@Configuration
@ComponentScan(basePackages = {"controller", "dao", "service", "adminController"})
public class SpringConfig {

	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}
	
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost/movie_project?characterEncoding=UTF-8&amp&useSSL=false");
		ds.setUsername("root");
		ds.setPassword("1234");
		return ds;
	}
	
//	@Bean
//	public MultipartResolver multipartResolver() {
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
//		multipartResolver.setMaxUploadSize(10*1024*1024);
//		multipartResolver.setDefaultEncoding("UTF-8");
//		return multipartResolver;
//	}
}
