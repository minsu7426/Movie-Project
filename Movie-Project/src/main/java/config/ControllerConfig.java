package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import controller.MovieController;
import controller.NoticeController;

@Configuration
@ComponentScan(basePackages = {"controller", "dao", "service"})
public class ControllerConfig {

	@Bean
	public NoticeController noticeController() {
		return new NoticeController();
	}
	
	@Bean
	public MovieController movieController() {
		return new MovieController();
	}
}
