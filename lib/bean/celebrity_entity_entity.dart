class CelebrityEntityEntity {
	String summary;
	String birthday;
	String website;
	List<CelebrityEntityWork> works;
	String gender;
	List<String> akaEn;
	String bornPlace;
	String mobileUrl;
	List<String> professions;
	String alt;
	List<CelebrityEntityPhoto> photos;
	String constellation;
	List<String> aka;
	String name;
	String id;
	String nameEn;
	CelebrityEntityAvatars avatars;

	CelebrityEntityEntity({this.summary, this.birthday, this.website, this.works, this.gender, this.akaEn, this.bornPlace, this.mobileUrl, this.professions, this.alt, this.photos, this.constellation, this.aka, this.name, this.id, this.nameEn, this.avatars});

	CelebrityEntityEntity.fromJson(Map<String, dynamic> json) {
		summary = json['summary'];
		birthday = json['birthday'];
		website = json['website'];
		if (json['works'] != null) {
			works = new List<CelebrityEntityWork>();(json['works'] as List).forEach((v) { works.add(new CelebrityEntityWork.fromJson(v)); });
		}
		gender = json['gender'];
		akaEn = json['aka_en']?.cast<String>();
		bornPlace = json['born_place'];
		mobileUrl = json['mobile_url'];
		professions = json['professions']?.cast<String>();
		alt = json['alt'];
		if (json['photos'] != null) {
			photos = new List<CelebrityEntityPhoto>();(json['photos'] as List).forEach((v) { photos.add(new CelebrityEntityPhoto.fromJson(v)); });
		}
		constellation = json['constellation'];
		aka = json['aka']?.cast<String>();
		name = json['name'];
		id = json['id'];
		nameEn = json['name_en'];
		avatars = json['avatars'] != null ? new CelebrityEntityAvatars.fromJson(json['avatars']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['summary'] = this.summary;
		data['birthday'] = this.birthday;
		data['website'] = this.website;
		if (this.works != null) {
      data['works'] =  this.works.map((v) => v.toJson()).toList();
    }
		data['gender'] = this.gender;
		data['aka_en'] = this.akaEn;
		data['born_place'] = this.bornPlace;
		data['mobile_url'] = this.mobileUrl;
		data['professions'] = this.professions;
		data['alt'] = this.alt;
		if (this.photos != null) {
      data['photos'] =  this.photos.map((v) => v.toJson()).toList();
    }
		data['constellation'] = this.constellation;
		data['aka'] = this.aka;
		data['name'] = this.name;
		data['id'] = this.id;
		data['name_en'] = this.nameEn;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		return data;
	}
}

class CelebrityEntityWork {
	CelebrityEntityWorksSubject subject;
	List<String> roles;

	CelebrityEntityWork({this.subject, this.roles});

	CelebrityEntityWork.fromJson(Map<String, dynamic> json) {
		subject = json['subject'] != null ? new CelebrityEntityWorksSubject.fromJson(json['subject']) : null;
		roles = json['roles']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
		data['roles'] = this.roles;
		return data;
	}
}

class CelebrityEntityWorksSubject {
	CelebrityEntityWorksSubjectImages images;
	String originalTitle;
	String year;
	List<CelebrityEntityWorksSubjectDirector> directors;
	CelebrityEntityWorksSubjectRating rating;
	String alt;
	String title;
	int collectCount;
	bool hasVideo;
	List<String> pubdates;
	List<CelebrityEntityWorksSubjectCast> casts;
	String subtype;
	List<String> genres;
	List<String> durations;
	String mainlandPubdate;
	String id;

	CelebrityEntityWorksSubject({this.images, this.originalTitle, this.year, this.directors, this.rating, this.alt, this.title, this.collectCount, this.hasVideo, this.pubdates, this.casts, this.subtype, this.genres, this.durations, this.mainlandPubdate, this.id});

	CelebrityEntityWorksSubject.fromJson(Map<String, dynamic> json) {
		images = json['images'] != null ? new CelebrityEntityWorksSubjectImages.fromJson(json['images']) : null;
		originalTitle = json['original_title'];
		year = json['year'];
		if (json['directors'] != null) {
			directors = new List<CelebrityEntityWorksSubjectDirector>();(json['directors'] as List).forEach((v) { directors.add(new CelebrityEntityWorksSubjectDirector.fromJson(v)); });
		}
		rating = json['rating'] != null ? new CelebrityEntityWorksSubjectRating.fromJson(json['rating']) : null;
		alt = json['alt'];
		title = json['title'];
		collectCount = json['collect_count'];
		hasVideo = json['has_video'];
		pubdates = json['pubdates']?.cast<String>();
		if (json['casts'] != null) {
			casts = new List<CelebrityEntityWorksSubjectCast>();(json['casts'] as List).forEach((v) { casts.add(new CelebrityEntityWorksSubjectCast.fromJson(v)); });
		}
		subtype = json['subtype'];
		genres = json['genres']?.cast<String>();
		durations = json['durations']?.cast<String>();
		mainlandPubdate = json['mainland_pubdate'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.images != null) {
      data['images'] = this.images.toJson();
    }
		data['original_title'] = this.originalTitle;
		data['year'] = this.year;
		if (this.directors != null) {
      data['directors'] =  this.directors.map((v) => v.toJson()).toList();
    }
		if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
		data['alt'] = this.alt;
		data['title'] = this.title;
		data['collect_count'] = this.collectCount;
		data['has_video'] = this.hasVideo;
		data['pubdates'] = this.pubdates;
		if (this.casts != null) {
      data['casts'] =  this.casts.map((v) => v.toJson()).toList();
    }
		data['subtype'] = this.subtype;
		data['genres'] = this.genres;
		data['durations'] = this.durations;
		data['mainland_pubdate'] = this.mainlandPubdate;
		data['id'] = this.id;
		return data;
	}
}

class CelebrityEntityWorksSubjectImages {
	String small;
	String large;
	String medium;

	CelebrityEntityWorksSubjectImages({this.small, this.large, this.medium});

	CelebrityEntityWorksSubjectImages.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class CelebrityEntityWorksSubjectDirector {
	String name;
	String alt;
	String id;
	CelebrityEntityWorksSubjectDirectorsAvatars avatars;
	String nameEn;

	CelebrityEntityWorksSubjectDirector({this.name, this.alt, this.id, this.avatars, this.nameEn});

	CelebrityEntityWorksSubjectDirector.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new CelebrityEntityWorksSubjectDirectorsAvatars.fromJson(json['avatars']) : null;
		nameEn = json['name_en'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['alt'] = this.alt;
		data['id'] = this.id;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		data['name_en'] = this.nameEn;
		return data;
	}
}

class CelebrityEntityWorksSubjectDirectorsAvatars {
	String small;
	String large;
	String medium;

	CelebrityEntityWorksSubjectDirectorsAvatars({this.small, this.large, this.medium});

	CelebrityEntityWorksSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class CelebrityEntityWorksSubjectRating {
	double average;
	int min;
	int max;
	CelebrityEntityWorksSubjectRatingDetails details;
	String stars;

	CelebrityEntityWorksSubjectRating({this.average, this.min, this.max, this.details, this.stars});

	CelebrityEntityWorksSubjectRating.fromJson(Map<String, dynamic> json) {
		average = json['average'];
		min = json['min'];
		max = json['max'];
		details = json['details'] != null ? new CelebrityEntityWorksSubjectRatingDetails.fromJson(json['details']) : null;
		stars = json['stars'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['average'] = this.average;
		data['min'] = this.min;
		data['max'] = this.max;
		if (this.details != null) {
      data['details'] = this.details.toJson();
    }
		data['stars'] = this.stars;
		return data;
	}
}

class CelebrityEntityWorksSubjectRatingDetails {
	var d1;
	var d2;
	var d3;
	var d4;
	var d5;

	CelebrityEntityWorksSubjectRatingDetails({this.d1, this.d2, this.d3, this.d4, this.d5});

	CelebrityEntityWorksSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
		d1 = json['1'];
		d2 = json['2'];
		d3 = json['3'];
		d4 = json['4'];
		d5 = json['5'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['1'] = this.d1;
		data['2'] = this.d2;
		data['3'] = this.d3;
		data['4'] = this.d4;
		data['5'] = this.d5;
		return data;
	}
}

class CelebrityEntityWorksSubjectCast {
	String name;
	String alt;
	String id;
	CelebrityEntityWorksSubjectCastsAvatars avatars;
	String nameEn;

	CelebrityEntityWorksSubjectCast({this.name, this.alt, this.id, this.avatars, this.nameEn});

	CelebrityEntityWorksSubjectCast.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new CelebrityEntityWorksSubjectCastsAvatars.fromJson(json['avatars']) : null;
		nameEn = json['name_en'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['alt'] = this.alt;
		data['id'] = this.id;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		data['name_en'] = this.nameEn;
		return data;
	}
}

class CelebrityEntityWorksSubjectCastsAvatars {
	String small;
	String large;
	String medium;

	CelebrityEntityWorksSubjectCastsAvatars({this.small, this.large, this.medium});

	CelebrityEntityWorksSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class CelebrityEntityPhoto {
	String cover;
	String image;
	String thumb;
	String alt;
	String icon;
	String id;

	CelebrityEntityPhoto({this.cover, this.image, this.thumb, this.alt, this.icon, this.id});

	CelebrityEntityPhoto.fromJson(Map<String, dynamic> json) {
		cover = json['cover'];
		image = json['image'];
		thumb = json['thumb'];
		alt = json['alt'];
		icon = json['icon'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cover'] = this.cover;
		data['image'] = this.image;
		data['thumb'] = this.thumb;
		data['alt'] = this.alt;
		data['icon'] = this.icon;
		data['id'] = this.id;
		return data;
	}
}

class CelebrityEntityAvatars {
	String small;
	String large;
	String medium;

	CelebrityEntityAvatars({this.small, this.large, this.medium});

	CelebrityEntityAvatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}
