import 'dart:core';

const String BASE_URL = 'http://192.168.0.111:3000';
const String BASE_URL1 = "http://qc-cp-mgr-v2-api.ebutor.com/mobileapi/v2";
const String ENDPOINT = "http://192.168.0.111:9001";
const String GIT_ENDPOINT = 'https://api.github.com';

class Api {
  static const String news = "$ENDPOINT/news";
  static const String newsDetails = "$ENDPOINT/news-details";
  static const String newsById = "$ENDPOINT/news-by-id";
  static const String breakingNews = "$ENDPOINT/breaking-news";
  static const String getOfflineProducts = "$BASE_URL1/getOfflineProducts";
  static const String gitSearch = "$GIT_ENDPOINT/legacy/repos/search/Go";

}
