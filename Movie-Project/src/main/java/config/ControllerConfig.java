package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.NoticeController;

@Configuration
public class ControllerConfig {

	@Bean
	public NoticeController noticeController() {
		return new NoticeController();
	}
}
