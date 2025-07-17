package com.example.spring_ci_cd_demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class SpringCiCdDemoApplicationTests {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void contextLoads() {
		// This test ensures that the Spring application context loads successfully
	}

	@Test
	void helloEndpointReturnsDefaultMessage() throws Exception {
		mockMvc.perform(get("/hello"))
				.andExpect(status().isOk())
				.andExpect(content().string("Hello World from Spring Boot CI/CD Demo!"));
	}

	@Test
	void helloEndpointReturnsCustomMessage() throws Exception {
		mockMvc.perform(get("/hello?name=John"))
				.andExpect(status().isOk())
				.andExpect(content().string("Hello John from Spring Boot CI/CD Demo!"));
	}

}