package cl.ingennia.wishmaker.domain;

import cl.ingennia.rest.domain.GeoEntity;

import com.googlecode.androidannotations.annotations.EBean;

@EBean
public class MobileUser extends GeoEntity<MobileUser> {
	private static final long serialVersionUID = 1L;

	
	public Integer platform;
	
	public Integer getPlatform() {
		return platform;
	}

	public void setPlatform(Integer platform) {
		this.platform = platform;
	}
	




}
