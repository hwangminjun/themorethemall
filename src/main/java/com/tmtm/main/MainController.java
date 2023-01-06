package com.tmtm.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping(value="/")
	public String main() {
		
		return "login";
	}
	
	@GetMapping(value="/index")
	public String index() {
		
		return "index";
	}
}
