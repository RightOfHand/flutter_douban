import 'package:flutter/material.dart';
import 'package:github_client_app/pages/detail/movie_detail_page.dart';
import 'package:github_client_app/pages/person_detail_page.dart';

class Router {
  static const homePage = 'app://';
  static const detailPage = 'app://DetailPage';
  static const playListPage = 'app://VideosPlayPage';
  static const searchPage = 'app://SearchPage';
  static const photoHero = 'app://PhotoHero';
  static const personDetailPage = 'app://PersonDetailPage';

  Widget _getPage(String url, dynamic params) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
    } else {
      switch (url) {
        case detailPage:
          return MovieDetailPage(params);
        case personDetailPage:
          return PersonDetailPage(params['personImgUrl'], params['id']);
      }
    }

    return null;
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
