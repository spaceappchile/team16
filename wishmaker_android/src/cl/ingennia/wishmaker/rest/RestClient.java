package cl.ingennia.wishmaker.rest;

import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;

import cl.ingennia.wishmaker.domain.Meteor;
import cl.ingennia.wishmaker.domain.Wish;

import com.googlecode.androidannotations.annotations.rest.Get;
import com.googlecode.androidannotations.annotations.rest.Rest;


@Rest(rootUrl = Host.URL, converters = { MappingJacksonHttpMessageConverter.class })
public interface RestClient {
	
	@Get("/meteors.json")
	Meteor[] getAllMeteors();
	
	@Get("/wishes.json")
	Wish[] getAllWishes();

}
