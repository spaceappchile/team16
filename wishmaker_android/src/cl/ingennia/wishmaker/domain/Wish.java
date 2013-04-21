package cl.ingennia.wishmaker.domain;

import cl.ingennia.rest.domain.GeoEntity;

public class Wish extends GeoEntity<Wish>{
	private static final long serialVersionUID = 1L;
	
	protected int mobile_user_id;
	protected int meteor_id;
	protected String description;
	protected boolean maked;
	
	public int getMobile_user_id() {
		return mobile_user_id;
	}
	public void setMobile_user_id(int mobile_user_id) {
		this.mobile_user_id = mobile_user_id;
	}
	public int getMeteor_id() {
		return meteor_id;
	}
	public void setMeteor_id(int meteor_id) {
		this.meteor_id = meteor_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isMaked() {
		return maked;
	}
	public void setMaked(boolean maked) {
		this.maked = maked;
	}
	
	
	
	

}
