package com.example.jooq.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServicesApp {
	
	
	@GetMapping("/testHero")
	public String testRest() {
		return "jawadiTest";
	}
	

}
