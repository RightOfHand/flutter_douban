class ProfileBeanEntity {
	String lastLogin;
	String cache;
	int theme;
	String locale;
	String user;
	String token;

	ProfileBeanEntity({this.lastLogin, this.cache, this.theme, this.locale, this.user, this.token});

	ProfileBeanEntity.fromJson(Map<String, dynamic> json) {
		lastLogin = json['lastLogin'];
		cache = json['cache'];
		theme = json['theme'];
		locale = json['locale'];
		user = json['user'];
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lastLogin'] = this.lastLogin;
		data['cache'] = this.cache;
		data['theme'] = this.theme;
		data['locale'] = this.locale;
		data['user'] = this.user;
		data['token'] = this.token;
		return data;
	}
}
