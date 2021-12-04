package com.andrei.springsecurity.demo.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {
	
	//Add reference to our security data source
	@Autowired
	private DataSource securityDataSource;

		

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		//add our user for in memory authentication
		
//		UserBuilder users = User.withDefaultPasswordEncoder();
//		
//		auth.inMemoryAuthentication()
//		.withUser(users.username("john").password("123").roles("EMPLOYEE"))
//		.withUser(users.username("mary").password("123").roles("EMPLOYEE", "MANAGER"))
//		.withUser(users.username("susan").password("123").roles("EMPLOYEE", "ADMIN"));
		
		
		
		//add user from database, use jdbc authentication
		auth.jdbcAuthentication().dataSource(securityDataSource);
		
	}
	
	
	//Configure security of web paths in application, login, logout, etc...
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
							//.anyRequest().authenticated()  //regardless of rolls
							.antMatchers("/").hasRole("EMPLOYEE")	// access based on rolls
							.antMatchers("/leaders/**").hasRole("MANAGER")
							.antMatchers("/systems/**").hasRole("ADMIN")
							.and()
							.formLogin()
								.loginPage("/showMyLoginPage")
								.loginProcessingUrl("/authenticateTheUser")  //can give any name
								.permitAll()  //allow everyone to see login page. No need to be logged in.
							.and()
							.logout().permitAll()
							.and()
							.exceptionHandling().accessDeniedPage("/access-denied");  //can give any name
	}
	
	
	
	
	

}


//for Spring security framework