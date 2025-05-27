package model.Bean;

import java.io.Serializable;

public class GenreBean implements Serializable {
	/**
	 * ジャンルID
	 */
	private int genreId;
	
	/**
	 * ジャンル名
	 */
	private String genreName;
	
	public GenreBean() {
		
	}

	public int getGenreId() {
		return genreId;
	}

	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	

}
