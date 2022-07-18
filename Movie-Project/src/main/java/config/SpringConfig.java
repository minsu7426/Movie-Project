package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import controller.MovieController;
import controller.NoticeController;

@Configuration
@ComponentScan(basePackages = {"controller", "dao", "service"})
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
	
}