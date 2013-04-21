package cl.ingennia.wishmaker.domain;

import java.util.Date;

import cl.ingennia.rest.domain.GeoEntity;

public class Meteor extends GeoEntity<Meteor> {
	private static final long serialVersionUID = 1L;

	protected String title;
	protected String address;
	protected String description;
	protected Date ending;
	protected Date starting;
	protected String photo;
	protected String subtitle;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getEnding() {
		return ending;
	}

	public void setEnding(Date ending) {
		this.ending = ending;
	}

	public Date getStarting() {
		return starting;
	}

	public void setStarting(Date starting) {
		this.starting = starting;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
	

}
