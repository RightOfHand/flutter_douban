class CelebrityWorkEntityEntity {
	CelebrityWorkEntityCelebrity celebrity;
	int total;
	List<CelebrityWorkEntityWork> works;
	int count;
	int start;

	CelebrityWorkEntityEntity({this.celebrity, this.total, this.works, this.count, this.start});

	CelebrityWorkEntityEntity.fromJson(Map<String, dynamic> json) {
		celebrity = json['celebrity'] != null ? new CelebrityWorkEntityCelebrity.fromJson(json['celebrity']) : null;
		total = json['total'];
		if (json['works'] != null) {
			works = new List<CelebrityWorkEntityWork>();(json['works'] as List).forEach((v) { works.add(new CelebrityWorkEntityWork.fromJson(v)); });
		}
		count = json['count'];
		start = json['start'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.celebrity != null) {
      data['celebrity'] = this.celebrity.toJson();
    }
		data['total'] = this.total;
		if (this.works != null) {
      data['works'] =  this.works.map((v) => v.toJson()).toList();
    }
		data['count'] = this.count;
		data['start'] = this.start;
		return data;
	}
}

class CelebrityWorkEntityCelebrity {
	String name;
	String alt;
	String id;
	CelebrityWorkEntityCelebrityAvatars avatars;
	String nameEn;

	CelebrityWorkEntityCelebrity({this.name, this.alt, this.id, this.avatars, this.nameEn});

	CelebrityWorkEntityCelebrity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new CelebrityWorkEntityCelebrityAvatars.fromJson(json['avatars']) : null;
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

class CelebrityWorkEntityCelebrityAvatars {
	String small;
	String large;
	String medium;

	CelebrityWorkEntityCelebrityAvatars({this.small, this.large, this.medium});

	CelebrityWorkEntityCelebrityAvatars.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorkEntityWork {
	CelebrityWorkEntityWorksSubject subject;
	List<String> roles;

	CelebrityWorkEntityWork({this.subject, this.roles});

	CelebrityWorkEntityWork.fromJson(Map<String, dynamic> json) {
		subject = json['subject'] != null ? new CelebrityWorkEntityWorksSubject.fromJson(json['subject']) : null;
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

class CelebrityWorkEntityWorksSubject {
	CelebrityWorkEntityWorksSubjectImages images;
	String originalTitle;
	String year;
	List<CelebrityWorkEntityWorksSubjectDirector> directors;
	CelebrityWorkEntityWorksSubjectRating rating;
	String alt;
	String title;
	int collectCount;
	bool hasVideo;
	List<Null> pubdates;
	List<CelebrityWorkEntityWorksSubjectCast> casts;
	String subtype;
	List<Null> genres;
	List<Null> durations;
	String mainlandPubdate;
	String id;

	CelebrityWorkEntityWorksSubject({this.images, this.originalTitle, this.year, this.directors, this.rating, this.alt, this.title, this.collectCount, this.hasVideo, this.pubdates, this.casts, this.subtype, this.genres, this.durations, this.mainlandPubdate, this.id});

	CelebrityWorkEntityWorksSubject.fromJson(Map<String, dynamic> json) {
		images = json['images'] != null ? new CelebrityWorkEntityWorksSubjectImages.fromJson(json['images']) : null;
		originalTitle = json['original_title'];
		year = json['year'];
		if (json['directors'] != null) {
			directors = new List<CelebrityWorkEntityWorksSubjectDirector>();(json['directors'] as List).forEach((v) { directors.add(new CelebrityWorkEntityWorksSubjectDirector.fromJson(v)); });
		}
		rating = json['rating'] != null ? new CelebrityWorkEntityWorksSubjectRating.fromJson(json['rating']) : null;
		alt = json['alt'];
		title = json['title'];
		collectCount = json['collect_count'];
		hasVideo = json['has_video'];
		if (json['pubdates'] != null) {
			pubdates = new List<Null>();
		}
		if (json['casts'] != null) {
			casts = new List<CelebrityWorkEntityWorksSubjectCast>();(json['casts'] as List).forEach((v) { casts.add(new CelebrityWorkEntityWorksSubjectCast.fromJson(v)); });
		}
		subtype = json['subtype'];
		if (json['genres'] != null) {
			genres = new List<Null>();
		}
		if (json['durations'] != null) {
			durations = new List<Null>();
		}
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
		if (this.pubdates != null) {
      data['pubdates'] =  [];
    }
		if (this.casts != null) {
      data['casts'] =  this.casts.map((v) => v.toJson()).toList();
    }
		data['subtype'] = this.subtype;
		if (this.genres != null) {
      data['genres'] =  [];
    }
		if (this.durations != null) {
      data['durations'] =  [];
    }
		data['mainland_pubdate'] = this.mainlandPubdate;
		data['id'] = this.id;
		return data;
	}
}

class CelebrityWorkEntityWorksSubjectImages {
	String small;
	String large;
	String medium;

	CelebrityWorkEntityWorksSubjectImages({this.small, this.large, this.medium});

	CelebrityWorkEntityWorksSubjectImages.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorkEntityWorksSubjectDirector {
	String name;
	String alt;
	String id;
	CelebrityWorkEntityWorksSubjectDirectorsAvatars avatars;
	String nameEn;

	CelebrityWorkEntityWorksSubjectDirector({this.name, this.alt, this.id, this.avatars, this.nameEn});

	CelebrityWorkEntityWorksSubjectDirector.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new CelebrityWorkEntityWorksSubjectDirectorsAvatars.fromJson(json['avatars']) : null;
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

class CelebrityWorkEntityWorksSubjectDirectorsAvatars {
	String small;
	String large;
	String medium;

	CelebrityWorkEntityWorksSubjectDirectorsAvatars({this.small, this.large, this.medium});

	CelebrityWorkEntityWorksSubjectDirectorsAvatars.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorkEntityWorksSubjectRating {
	var average;
	int min;
	int max;
	CelebrityWorkEntityWorksSubjectRatingDetails details;
	String stars;

	CelebrityWorkEntityWorksSubjectRating({this.average, this.min, this.max, this.details, this.stars});

	CelebrityWorkEntityWorksSubjectRating.fromJson(Map<String, dynamic> json) {
		average = json['average'];
		min = json['min'];
		max = json['max'];
		details = json['details'] != null ? new CelebrityWorkEntityWorksSubjectRatingDetails.fromJson(json['details']) : null;
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

class CelebrityWorkEntityWorksSubjectRatingDetails {
	var d1;
	var d2;
	var d3;
	var d4;
	var d5;

	CelebrityWorkEntityWorksSubjectRatingDetails({this.d1, this.d2, this.d3, this.d4, this.d5});

	CelebrityWorkEntityWorksSubjectRatingDetails.fromJson(Map<String, dynamic> json) {
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

class CelebrityWorkEntityWorksSubjectCast {
	String name;
	String alt;
	String id;
	CelebrityWorkEntityWorksSubjectCastsAvatars avatars;
	String nameEn;

	CelebrityWorkEntityWorksSubjectCast({this.name, this.alt, this.id, this.avatars, this.nameEn});

	CelebrityWorkEntityWorksSubjectCast.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new CelebrityWorkEntityWorksSubjectCastsAvatars.fromJson(json['avatars']) : null;
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

class CelebrityWorkEntityWorksSubjectCastsAvatars {
	String small;
	String large;
	String medium;

	CelebrityWorkEntityWorksSubjectCastsAvatars({this.small, this.large, this.medium});

	CelebrityWorkEntityWorksSubjectCastsAvatars.fromJson(Map<String, dynamic> json) {
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
