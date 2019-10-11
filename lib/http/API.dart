
class API{
  static const BASE_URL = 'https://douban-api.uieee.com';
  static const DB_BASE_URL = 'https://api.douban.com';

  static const TEST='https://api.github.com/users/RightOfHand';

  ///TOP250
  static const String TOP_250 = '/v2/movie/top250';
  static const String MOVIE_DETAIL='/v2/movie/subject/';

  ///正在热映
  static const String IN_THEATERS = 'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///即将上映
  static const String COMING_SOON = '/v2/movie/coming_soon?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///一周口碑榜
  static const String WEEKLY = '/v2/movie/weekly?apikey=0b2bdeda43b5688921839c8ecb20399b';

  ///影人条目信息
  static const String CELEBRITY = '/v2/movie/celebrity/';

  static const String REIVIEWS = '/v2/movie/subject/26266893/reviews';


  ///仓库详情 get
  static getTest() {
    return TEST;
  }

  static getBase(){
    return BASE_URL;
  }
  static getHomeTop(){
    return "$getBase()$TOP_250";
  }

  static getMovieDetail(){
    return"";
  }

  static getHotMovie(){
    return IN_THEATERS;
  }
}