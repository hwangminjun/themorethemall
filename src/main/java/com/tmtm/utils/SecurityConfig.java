package com.tmtm.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		// 기본 로그인 기능 사용하지 않음
		// 403 : 권한 에러 - csrf 기능을 비활성화하면 생기지 않는다.
		// CSRF(Cross Site Request Forgery) : 사용자가 자신의 의지와 무관하게 공격자가 의도한 행동을 하게 만드는 공격 방법(주로 자바스크립트를 이용한 페이지 변조)
		// 이것을 막기 위해 csrf 토큰을 만들어 서버에서 페이지를 내려주게 된다.
		// 그리고 페이지에서 서버에 요청을 보낼 경우 이 토큰값을 보내게 된다.
		// 그리고 요청 시 보내온 토큰값과 서버가 가지고 있는 토큰값이 일치하는지 검사
		// 일치하지 않거나 토큰이 없으면 403에러 (jsp에 토큰을 발행하는 로직을 넣지 않았기 때문에)
		http.httpBasic().disable().csrf().disable();
		
		return http.build();
	}
}
